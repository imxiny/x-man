<?php

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Think\Auth;

class IndexController extends AdminBaseController
{

    public function index()
    {
        //判断四个主菜单是否有权限
        $id = session('x_admin_id');

        $rules = $this->get_rules_array($id);
        $menu = M('auth_menus')->where(['pid' => 0])->select();
        $list = [];
        foreach ($menu as $v) {
            if (in_array($v['rule_id'], $rules)) {
                $list[] = $v;
            }
        }
        $this->assign('list', $list);
        $user = M('admin_user')->find($id);
        $this->assign('user', $user);
        $skin = M('system_skin')->where(['user_id' => $id])->find() ?: '';
        $style = $skin ? $this->makeCss($skin) : '';
        $this->assign('style', $style);
        $this->display();
    }

    //获取左侧菜单
    public function getmenu()
    {
        $pid = I('get.id');
        $id = session('x_admin_id');
        $rules = $this->get_rules_array($id);
        //菜单状态与绑定的规则同步
        $M = M('auth_menus as a');
        $menus = $M->field('a.*,r.name as href,r.is_url')->join(C('DB_PREFIX') . "auth_rule as r on r.id=a.rule_id", 'left')->where(['a.pid' => $pid, 'r.status' => '1'])->select();
        //过滤第一遍
        $men1 = array();
        foreach ($menus as $k => $v) {
            if (in_array($v['rule_id'], $rules)) {
                $men1[] = $v;
                $childlist = $M->field('a.*,r.name as href')->join(C('DB_PREFIX') . "auth_rule as r on r.id=a.rule_id", 'left')->where(['a.pid' => $v['id']])->select();
                foreach ($childlist as $k1 => $v1) {

                    if (in_array($v1['rule_id'], $rules)) {
                        $men1[count($men1) - 1]['child'][] = $v1;
                    }
                }
            }
        }

        $list = array();
        foreach ($men1 as $k => $v) {
            if ($v['is_url'] == '0' && empty($v['child'])) {
                continue;
            }
            $list[$k]['title'] = $v['name'];
            $list[$k]['icon'] = $v['icon'];
            $url = ltrim($v['href'], '/');
            if (filter_var($url,FILTER_VALIDATE_URL)) {
                $list[$k]['href'] = $url;
            } else {
                $list[$k]['href'] = '/'.$url;
            }
            $list[$k]['spread'] = false;
            if ($v['target'] === '_blank') {
                $list[$k]['target'] = '_blank';
            }
            if (isset($v['child'])) {
                foreach ($v['child'] as $k1 => $v1) {
                    $list[$k]['children'][$k1]['title'] = $v1['name'];
                    $list[$k]['children'][$k1]['icon'] = $v1['icon'];
                    $list[$k]['children'][$k1]['href'] = '/' . ltrim($v1['href'], '/');
                    $list[$k]['children'][$k1]['spread'] = false;
                    if ($v1['target'] === '_blank') {
                        $list[$k]['children'][$k1]['target'] = '_blank';
                    }
                }
            }
        }
        $this->ajaxReturn(array_values($list), 'json');
    }

    //获取皮肤信息
    public function getSkin()
    {
        $res['has'] = false;
        $res['style'] = false;
        $id = session('x_admin_id');
        $skin = M('system_skin')->where(['user_id' => $id])->find() ?: '';
        if (empty($skin)) {
            $skin = M('system_skin')->find(35);
        }
        if ($skin) {
            $res['style'] =$this->makeCss($skin);
            $res['has'] =true;
            $res = array_merge($res, $skin);
        }
        $this->ajaxReturn($res);
    }

    //获取系统内置皮肤
    public function getSystemSkin()
    {
        $list = M('system_skin')->field('id,name')->where(['state' => '1'])->select();
        $this->ajaxReturn($list);
    }

    public function getSkinById()
    {
        $list = M('system_skin')->find(I('post.id'));
        $this->ajaxReturn($list);
    }
    public function main()
    {
        $list = M('update_log')->order("addtime desc")->select();
        $this->assign("list", $list);
        $this->display("Index/main");
    }

    /*
     * 清除缓存
     */
    public function clearcache()
    {
        if (IS_AJAX) {
            $dir = ROOT_PATH . trim(APP_PATH, './') . '/' . 'Runtime/';
            delete($dir . 'Cache');
            delete($dir . 'Data');
        }
    }

    public function changePass()
    {
        if (IS_AJAX) {
            parse_str($_POST['para'], $data);
            $data = I('data.', C('DEFAULT_FILTER'), '', $data);
            $userinfo = unserialize(session('x-admin'));
            if (!password_verify($data['pass'], $userinfo['password'])) {
                $this->error("旧密码错误");
            }
            if ($data['newpass'] !== $data['cnewpass']) {
                $this->error('两次输入的新密码不一致');
            }
            $newpass = password_hash($data['newpass'], PASSWORD_DEFAULT);
            if (M('admin_user')->where(['id' => $data['id']])->save(['password' => $newpass])) {
                $userinfo['password'] = $newpass;
                session('x-admin', serialize($userinfo));
                $this->success('密码修改成功');
            } else {
                $this->success('网络故障');
            }
        } elseif (IS_GET) {
            $this->assign("username", unserialize(session('x-admin'))['username']);
            $this->assign("id", session('x_admin_id'));
            $this->display("Index/changePass");
        }
    }

    public function makeSkin()
    {
        $id = session('x_admin_id');
        parse_str($_POST['paras'],$data);
        M('system_skin')->where(['user_id' => $id])->delete();
        $data['user_id'] = $id;
        M('system_skin')->add($data) ? $this->success('制作成功') : $this->error('网络故障');
    }

    public function defaultSkin()
    {
        $id = session('x_admin_id');

        false !== M('system_skin')->where(['user_id' => $id])->delete() ? $this->success('操作成功') : $this->error('网络故障');
    }

    private function makeCss($arr)
    {
        $style = "<style type=\"text/css\">
.layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this > a, .layui-nav-tree .layui-this > a:hover, .hideMenu, .layui-nav-tree .layui-nav-bar, .layui-nav-itemed:before, .layui-nav .layui-nav-child dd.layui-this a, .layui-nav-child dd.layui-this,#nprogress .bar
{ background-color: {$arr['framecolor']}}

#nprogress .spinner-icon{
    border-left-color:{$arr['framecolor']};
    border-top-color:{$arr['framecolor']};
}
#nprogress .peg{
    box-shadow: 0 0 10px {$arr['framecolor']}, 0 0 5px {$arr['framecolor']};
}


.layui-tab-title .layui-this {color: {$arr['framecolor']};border-bottom: 1px solid {$arr['framecolor']};}

                .layui-body {border-top: 5px solid {$arr['framecolor']};}

                .layui-nav .layui-nav-child a:hover,.ui-context-menu-item a:hover {background-color: {$arr['framecolor']};}

.layui-nav .layui-nav-child a:hover, .layui-nav .layui-nav-child dd.layui-this a:hover {background-color: {$arr['framecolor']}}

.topLevelMenus .layui-nav-item.layui-this a{background-color: {$arr['framecolor']}}

.layui-layout-admin .layui-header{ background-color: {$arr['topcolor']}}

.layui-bg-black { background-color: {$arr['leftcolor']}!important;}

.layui-nav .layui-this:after, .layui-nav-bar, .layui-nav-tree .layui-nav-itemed:after { background-color: {$arr['topbottomcolor']}}

.layui-nav-item.layui-nav-itemed { background-color: {$arr['menucolor']}!important;}

</style>";
        return $style;
    }

    /**
     * @param string $id 用户当前所有的规则
     * @return array
     */
    private function get_rules_array($id)
    {
        $Auth = new Auth();
        $data = $Auth->getGroups($id);
        $rules = [];//当前用户所有的规则
        foreach ($data as $v) {
            $rules = array_merge($rules, explode(',', $v['rules']));
        }
        return array_unique($rules);
    }
}