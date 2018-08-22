<?php
////////////////////////////////////////////////////////////////////
//                          _ooOoo_                               //
//                         o8888888o                              //
//                         88" . "88                              //
//                         (| ^_^ |)                              //
//                         O\  =  /O                              //
//                      ____/`---'\____                           //
//                    .'  \\|     |//  `.                         //
//                   /  \\|||  :  |||//  \                        //
//                  /  _||||| -:- |||||-  \                       //
//                  |   | \\\  -  /// |   |                       //
//                  | \_|  ''\---/''  |   |                       //
//                  \  .-\__  `-`  ___/-. /                       //
//                ___`. .'  /--.--\  `. . ___                     //
//              ."" '<  `.___\_<|>_/___.'  >'"".                  //
//            | | :  `- \`.;`\ _ /`;.`/ - ` : | |                 //
//            \  \ `-.   \_ __\ /__ _/   .-` /  /                 //
//      ========`-.____`-.___\_____/___.-`____.-'========         //
//                           `=---='                              //
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        //
//         佛祖保佑       永无BUG     永不修改                  //
////////////////////////////////////////////////////////////////////
/**
 * Created by PhpStorm.
 * User: Xiny i@xiny9.com
 * Date: 2018-06-03
 * Time: 22:31
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Org\Util\Data;
use Think\Exception;

class AuthController extends AdminBaseController
{
    /**
     * 规则管理
     */
    public function rule()
    {
        if (IS_AJAX) {
            $where = " 1 ";
            $data = I('get.');

            $keyword = $data['keyword'];
            unset($data['keyword']);
            unset($data['page']);
            unset($data['limit']);

            if (isset($keyword[0])) {
                $where .= " and (`name` like '%{$keyword}%' or `title` like '%{$keyword}%') ";
            }

            //如果传递了父级id 且不为 '' 添加条件
            if (isset($data['pid']) && $data['pid'] !== '') {
                $ids = implode($this->get_children_str($data['pid']), ',');
                $where .= " and pid in ({$ids}) ";
            }
            unset($data['pid']);//防止条件组装上pid
            foreach ($data as $k => $v) {
                if (isset($v[0])) {
                    $where .= " and `{$k}`={$v} ";
                }
            }

            extract(I('get.'));
            $list = M('auth_rule')
                ->where($where)
                ->select();
            $ids = array_column($list, 'id');

            //treetable需要id为0的父级
            foreach ($list as &$v) {
                if (!in_array($v['pid'], $ids)) {
                    $v['pid'] = 0;
                }
            }
            /**/
            $count = M('auth_rule')->where($where)->count();
            $list = array_values($list);
            $res = array(
                'code' => 0
            , 'count' => $count
            , 'msg' => ''
            , 'data' => $list
            );
            $this->ajaxReturn($res);
        } elseif (IS_GET) {
            $list = M('auth_rule')
                ->field('title,id,pid')
                ->where(['status' => 1])
                ->select();
            $list = Data::tree($list, 'title', 'id', 'pid');
            $list = array_values($list);
            $this->assign('list', $list);
            $this->display('auth/rule_index');
        }
    }

    /**
     * 添加规则
     */
    public function add_rule()
    {
        if (IS_AJAX) {
            try {
                parse_str($_POST['para'], $data);
                $data = I('data.', '', C('DEFAULT_FILTER'), $data);
                $data = array_filter($data);
                $data['name'] = strtolower($data['name']);
                $data['is_url'] = $data['is_url'] ? $data['is_url'] : 0;
                $data['type'] = $data['type'] ? $data['type'] : 0;
                $data['status'] = $data['status'] ? $data['status'] : 0;
                if (M('auth_rule')->where(['name' => $data['name']])->count()) {
                    $this->error('存在同名规则');
                }
                M('auth_rule')->add($data) ? $this->success('添加成功') : $this->error(M('auth_rule')->getError());
            } catch (Exception $e) {
                $this->error($e->getMessage());
            }
        } elseif (IS_GET) {
            $list = M('auth_rule')
                ->field('title,id,pid')
                ->where(['status' => 1])
                ->select();
            $pid = 0;
            if (!empty(I('get.id'))) {
                $pid = I('get.id');
            }
            $this->assign('pid', $pid);
            $list = Data::tree($list, 'title', 'id', 'pid');
            $list = array_values($list);
            $this->assign('list', $list);
            $this->display('auth/rule_add');
        }
    }

    /*
     * 快捷更改规则状态
     */
    public function fast_change_rule()
    {
        $data = [];
        $data['id'] = I('param.id');
        $data[I('param.name')] = I('param.val') === 'true' ? 1 : 0;
        M('auth_rule')->save($data) ? $this->success() : $this->error('网络故障');
    }

    /*
     * 修改规则
     */
    public function edit_rule()
    {
        if (IS_GET && !IS_AJAX) {
            $list = M('auth_rule')
                ->field('title,id,pid')
                ->where(['status' => 1])
                ->select();
            $list = Data::tree($list, 'title', 'id', 'pid');
            $list = array_values($list);
            $this->assign('list', $list);
            $id = I('get.id');
            $info = M('auth_rule')->find($id);
            $this->assign('info', $info);
            $this->display('auth/rule_edit');
        } elseif (IS_AJAX) {
            $data = array();
            parse_str($_POST['para'], $data);
            $data = I('data.', '', C('DEFAULT_FILTER'), $data);
            $data['is_url'] = $data['is_url'] ? $data['is_url'] : 0;
            $data['type'] = $data['type'] ? $data['type'] : 0;
            $data['status'] = $data['status'] ? $data['status'] : 0;
            if (M('auth_rule')->where("`id` != {$data['id']} and `name`='{$data['name']}'")->count()) {
                $this->error('该规则已存在', '', true, 3);
            }
            $row = M('auth_rule')->save($data);
            $row === false ? $this->error('网络故障') : $row === 0 ? $this->error('数据无改动', 'nojump', IS_AJAX, 2) : $this->success('操作成功');
        }
    }

    /*
     * （批量）删除规则
     */
    public function del_rule()
    {
        if (IS_AJAX) {
            $id = I('post.id');
            if (is_array($id)) {
                $id = implode($id, ',');
            }
            $child = M('auth_rule')->where(" `pid` in ({$id})")->count();
            if ($child > 0) {
                $this->error('存在子权限，请删除子权限', '', true, 3);
            }
            $rows = M('auth_rule')->where(" `id` in ({$id})")->delete();
            $row2 = M('auth_menus')->where("rule_id in ({$id})")->save(['rule_id' => 0]);
            $rows !== false ? $this->success('删除成功') : $this->error('网络故障');
        }
    }

    /*
     * 角色组管理
     */
    public function group()
    {
        if (IS_AJAX) {
            $page = '';
            $limit = '';
            $where = " 1 ";
            $data = I('post.');
            $keyword = $data['keyword'];
            unset($data['keyword']);
            unset($data['page']);
            unset($data['limit']);
            if (isset($keyword[0])) {
                $where .= " and `title` like '%{$keyword}%' ";
            }
            foreach ($data as $k => $v) {
                if (isset($v[0])) {
                    $where .= " and `{$k}`={$v} ";
                }
            }
            extract(I('post.'));
            $list = M('auth_group')
                ->where($where)
                ->order('id asc')
                ->limit(($page - 1) * $limit, $limit)
                ->select();
            $count = M('auth_group')->where($where)->count();
            $res = array(
                'code' => 0
            , 'count' => $count
            , 'msg' => ''
            , 'data' => $list
            );
            $this->ajaxReturn($res);
        } elseif (IS_GET) {
            $this->display('auth/group_index');
        }
    }

    /*
     * 添加角色组
     */
    public function add_group()
    {
        if (IS_AJAX) {
            try {
                parse_str($_POST['para'], $data);
                $data = I('data.', '', C('DEFAULT_FILTER'), $data);
                $data = array_filter($data);
                $data['status'] = $data['status'] ? $data['status'] : 0;
                $data['rules'] = trim(I('post.rules'), ',');
                if (M('auth_group')->where(['title' => $data['title']])->count()) {
                    $this->error('存在同名角色组');
                }
                M('auth_group')->add($data) ? $this->success('添加成功') : $this->error('网络故障');
            } catch (Exception $e) {
                $this->error($e->getMessage());
            }
        } elseif (IS_GET) {
            $rule_list = M('auth_rule')->where(['status' => 1])->select();

            $nodes = array();
            foreach ($rule_list as $k => $v) {
                $nodes[$k]['id'] = $v['id'];
                $nodes[$k]['pId'] = $v['pid'];
                $nodes[$k]['name'] = $v['title'];
                $nodes[$k]['checked'] = false;
            }

            $this->assign('nodes', json_encode($nodes));
            $this->display('auth/group_add');
        }
    }

    /*
    * 快捷更改角色组状态
    */
    public function fast_change_group()
    {
        $data = [];
        $data['id'] = I('param.id');
        $data[I('param.name')] = I('param.val') === 'true' ? 1 : 0;
        M('auth_group')->save($data) ? $this->success() : $this->error('网络故障');
    }

    /*
     * （批量）删除角色组
     */
    public function del_group()
    {
        if (IS_AJAX) {
            $id = I('post.id');
            if (is_array($id)) {
                $id = implode($id, ',');
            }
            M('auth_group')->startTrans();
            $rows[] = M('auth_group')->where(" `id` in ({$id})")->delete();
            //删除成功后 清除该角色组绑定的数据
            $rows[] = M("auth_group_access")->where("`group_id` in ({$id})")->delete();
            if (!in_array(false, $rows, true)) {
                M('auth_group')->commit();
                $this->success('删除成功');
            } else {
                M('auth_group')->rollback();
                $this->error('网络故障');
            }
        }
    }

    /*
     * 修改角色组
     */
    public function edit_group()
    {
        if (IS_GET && !IS_AJAX) {
            $id = I('get.id');
            $info = M('auth_group')->find($id);
            $this->assign('info', $info);
            $rule_list = M('auth_rule')->where(['status' => 1])->select();

            $nodes = array();
            $group_rules = explode(',', $info['rules']);
            foreach ($rule_list as $k => $v) {
                $nodes[$k]['id'] = $v['id'];
                $nodes[$k]['pId'] = $v['pid'];
                $nodes[$k]['name'] = $v['title'];
                $nodes[$k]['checked'] = in_array($v['id'], $group_rules) ? true : false;
            }
            $this->assign('nodes', json_encode($nodes));
            $this->display('auth/group_edit');
        } elseif (IS_AJAX) {
            $data = array();
            parse_str($_POST['para'], $data);
            $data = I('data.', '', C('DEFAULT_FILTER'), $data);
            $data['rules'] = trim(I('post.rules'), ',');
            $data['status'] = $data['status'] ? $data['status'] : 0;
            if (M('auth_group')->where("`id` != {$data['id']} and `title`='{$data['title']}'")->count()) {
                $this->error('该角色组已存在', '', true, 3);
            }
            $row = M('auth_group')->save($data);
            $row === false ? $this->error('网络故障') : $row === 0 ? $this->error('数据无改动', 'nojump', IS_AJAX, 2) : $this->success('操作成功');
        }
    }

    /*
     * 后台管理员管理 只是更改权限
     */
    public function admin_user()
    {
        if (IS_AJAX) {
            $page = '';
            $limit = '';
            $where = " 1 ";
            $data = I('post.');
            $keyword = $data['keyword'];
            unset($data['keyword']);
            unset($data['page']);
            unset($data['limit']);
            if (isset($keyword[0])) {
                $where .= " and (`username` like '%{$keyword}%' or `nickname` like '%{$keyword}%') ";
                if (is_numeric($keyword)) {
                    $where = "1 and `id`={$keyword} ";
                }
            }
            foreach ($data as $k => $v) {
                if (isset($v[0])) {
                    $where .= " and `{$k}`={$v} ";
                }
            }
            extract(I('post.'));
            $list = M('admin_user')
                ->where($where)
                ->order('id asc')
                ->limit(($page - 1) * $limit, $limit)
                ->select();
            foreach ($list as $k => $v) {

                $g_list = M('auth_group_access as ga ')
                    ->join(C('DB_PREFIX') . 'auth_group as ag on ag.id=ga.group_id')
                    ->field('ag.title')
                    ->where(['uid' => $v['id']])
                    ->select();
                $g_list = array_column($g_list, 'title');
                $list[$k]['groups'] = implode($g_list, ',') ?: '<span class="layui-red">无</span>';
            }
            $count = M('admin_user')->where($where)->count();
            $res = array(
                'code' => 0
            , 'count' => $count
            , 'msg' => ''
            , 'data' => $list
            );
            $this->ajaxReturn($res);
        } elseif (IS_GET) {
            $this->display('auth/admin_user');
        }
    }

    /**
     * 添加后台用户
     */
    public function add_admin()
    {
        if (IS_AJAX) {
            try {
                parse_str($_POST['para'], $data);
                $data = I('data.', '', C('DEFAULT_FILTER'), $data);
                $data = array_filter($data);
                $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
                //循环插入 group_access
                if (M('admin_user')->where(['username' => $data['username']])->count()) {
                    $this->error('登陆账号已存在');
                }
                $M = M('admin_user');
                $M->startTrans();
                $groups = explode(',', $data['groups']);
                unset($data['groups']);
                $res = array();
                $res[] = $M->add($data);
                $uid = $M->getLastInsID();
                foreach ($groups as $k => $v) {
                    $res[] = M('auth_group_access')->add(['uid' => $uid, 'group_id' => $v]);
                }
                if (!in_array(0, $res)) {
                    $M->commit();
                    $this->success('添加成功');
                } else {
                    $M->rollback();
                    $this->error('网络故障');
                }
            } catch (Exception $e) {
                $this->error($e->getMessage());
            }
        } elseif (IS_GET) {
            $group_list = M('auth_group')->field('id,title')->where(['status' => '1'])->select();
            $this->assign('group_list', $group_list);
            $this->display('auth/admin_add');
        }
    }

    /**
     * 删除后台用户
     */
    public function del_admin()
    {
        if (IS_AJAX) {
            $id = I('post.id');
            if (is_array($id)) {
                $id = implode($id, ',');
            }
            M('admin_user')->startTrans();
            $rows[] = M('admin_user')->where(" `id` in ({$id})")->delete();
            if (!in_array(false, $rows, true)) {
                M('admin_user')->commit();
                $this->success('删除成功');
            } else {
                M('admin_user')->rollback();
                $this->error('网络故障');
            }
        }
    }

    /*
     * 编辑用户
     */
    public function edit_admin()
    {
        if (IS_GET && !IS_AJAX) {
            $id = I('get.id');
            $info = M('admin_user')->find($id);
            $this->assign('info', $info);
            $glist = M('auth_group_access')->where(['uid' => $id])->select();
            $glist = implode(array_column($glist, 'group_id'), ',');
            $this->assign('glist', $glist);
            $group_list = M('auth_group')->where(['status' => 1])->select();
            $this->assign('group_list', $group_list);
            $this->display('auth/admin_edit');
        } elseif (IS_AJAX) {
            $data = array();
            parse_str($_POST['para'], $data);
            $data = I('data.', '', C('DEFAULT_FILTER'), $data);
            $data = array_filter($data);
            isset($data['password']) && $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
            $data['status'] = isset($data['status']) ?: '0';
            if (M('admin_user')->where("`id` != {$data['id']} and `username`='{$data['username']}'")->count()) {
                $this->error('该账户已存在', '', true, 3);
            }
            M('admin_user')->startTrans();
            $groups = explode(',', $data['groups']);
            unset($data['groups']);
            $res = array();
            $res[] = M('admin_user')->save($data);
            $res[] = M('auth_group_access')->where(['uid' => $data['id']])->delete();
            foreach ($groups as $k => $v) {
                $res[] = M('auth_group_access')->add(['uid' => $data['id'], 'group_id' => $v]);
            }
            if (in_array(false, $res, true)) {
                M('admin_user')->rollback();
                $this->error('更新失败');
            } else {
                M('admin_user')->commit();
                $this->success('更新成功');
            }
        }
    }

    /*
     * 菜单管理
     */
    public function menus()
    {
        if (!IS_AJAX && IS_GET) {
            $this->display("auth/menus");
        } elseif (IS_AJAX) {
            $list = M('auth_menus a')->field('a.*,r.name as link')->join(C('DB_PREFIX') . "auth_rule as r on r.id=a.rule_id", 'left')->select();
           /* $list = Data::tree($list, 'name', 'id', 'pid');*/
            /*$list = array_values($list);*/
            $res = array(
                'code' => 0
            , 'count' => count($list)
            , 'msg' => ''
            , 'data' => $list
            );
            $this->ajaxReturn($res);
        }
    }

    /*
     * 添加菜单
     */
    public function add_menu()
    {
        if (IS_GET) {
            $list = M('auth_rule')->select();
            $list = Data::tree($list, 'title', 'id', 'pid');
            $this->assign('urlist', $list);
            $this->display('auth/menu_add');
        } elseif (IS_AJAX) {
            $data = [];
            parse_str($_POST['paras'], $data);
            $data = I('data.', '', C('DEFAULT_FILTER'), $data);
            M('auth_menus')->add($data) ? $this->success('操作成功') : $this->error(M('auth_menus')->getDbError());
        }
    }

    /*
     * 菜单删除
     */
    public function del_menu()
    {
        if (IS_AJAX) {
            $id = I('post.id');

            if (M('auth_menus')->where(['pid' => $id])->count()) {
                $this->error("该菜单下存在子项", '', true, 3);
            }

            M('auth_menus')->startTrans();
            $rows[] = M('auth_menus')->where(" `id` in ({$id})")->delete();
            if (!in_array(false, $rows, true)) {
                M('auth_menus')->commit();
                $this->success('删除成功');
            } else {
                M('auth_menus')->rollback();
                $this->error('网络故障');
            }
        }
    }

    /*
     * 修改菜单
     */
    public function edit_menu()
    {
        if (IS_GET) {
            $info = M('auth_menus')->getByid(I('get.id'));
            $menus = M('auth_menus')->field('id,name,pid')->select();
            $menus = Data::tree($menus, 'name', 'id', 'pid');
            $this->assign('info', $info);
            $list = M('auth_rule')->select();
            $list = Data::tree($list, 'title', 'id', 'pid');
            $this->assign('urlist', $list);
            $this->assign('menus', $menus);
            $this->display('auth/menu_edit');
        } elseif (IS_AJAX) {
            $data = [];
            parse_str($_POST['paras'], $data);
            //数据过滤
            $data = I('data.', '', C('DEFAULT_FILTER'), $data);
            $row = M('auth_menus')->save($data);
            $row === false ? $this->error('网络故障') : $row === 0 ? $this->error('数据无改动', 'nojump', IS_AJAX, 2) : $this->success('操作成功');
        }
    }

    /*
     * 修改菜单排序功能
     */
    public function change_menu_sort()
    {
        if (!IS_AJAX) exit();
        $oldsort = I('post.oldsort');
        $newsort = I('post.newsort');

        //1.先保存旧数据
        //2.删除原有数据
        //3.对旧数据进行排序
        //4.插入新的数据
        $M = M('auth_menus');
        $M->startTrans();
        $res = [];//结果
        $olddata = [];//旧数据
        $child = [];//旧数据对应的孩子

        //先判断同一拨

        foreach ($oldsort as $k => $v) {
            if ($newsort[$k] == $v) {
                //顺序和原来一样的不变
                unset($oldsort[$k]);
                unset($newsort[$k]);
                continue;
            }
            $olddata[$v] = $M->find($v);
            $child[$v] = implode(array_column($M->field('id')->where(['pid' => $v])->select(), 'id'), ',');
            $res[] = $M->where(['id' => $v])->delete();
        }
        //插入新数据
        foreach ($oldsort as $k => $v) {
            $t = $olddata[$newsort[$k]];
            $ch = $child[$newsort[$k]];
            $t['id'] = $v;
            $res[] = $M->add($t);
            if (!empty($ch)) {
                $res[] = $M->where("`id` in ({$ch})")->save(['pid' => $v]);
            }
        }
        if (in_array(false, $res, true)) {
            $M->rollback();
            $this->error('网络故障');
        } else {
            $M->commit();
            $this->success('更新成功');
        }
    }

    /**
     * @param string $pid 父级id
     * @return array 该级别下所有孩子包括下下级
     */
    private function get_children_str($pid)
    {
        $ids = array($pid);
        $list = M("auth_rule")->field("id")->where("pid={$pid} and `status`='1'")->select();
        foreach ($list as $key => $val) {
            $ids = array_merge($ids, $this->get_children_str($val["id"]));
        }
        return $ids;
    }

}
