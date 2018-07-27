<?php
/**
 * Created by PhpStorm.
 * User: Xiny i@xiny9.com
 * Date: 2017/11/29
 * Time: 15:29
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Think\Page;
use Admin\Model\UserModel as UserModel;
use Org\Util\Data;

class RbacController extends AdminBaseController
{
    //初始化操作
    public function _initialize()
    {
        //if (!IS_AJAX) $this->error('你访问的页面不存在，请稍后再试');
    }

    public function userIndex()
    {
        if (IS_POST) {
            $condition['username'] = array('like', "%" . trim(I('keybord')) . "%");
            $model = D('AdminUser');
            $count = $model->where($condition)->count();
            $Page = new Page($count, 3);
            $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
            $show = $Page->show();
            //select search
            $list = $model->where($condition)->field('password', true)->relation(true)->limit($Page->firstRow . ',' . $Page->listRows)->select();
            $this->show = $show;
            $this->list = $list;
            $this->display('AdminUser/index');
        } else {
            //$model = D('User');
            $model = new UserModel();
            $count = $model->count();
            $Page = new Page($count, 6);
            $Page->setConfig('header', '共%TOTAL_ROW%条');
            $Page->setConfig('first', '首页');
            $Page->setConfig('last', '共%TOTAL_PAGE%页');
            $Page->setConfig('prev', '上一页');
            $Page->setConfig('next', '下一页');
            $Page->setConfig('link', 'indexpagenumb');
            $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
            $show = $Page->show();
            //select search
            $list = $model->field('password', true)->relation(true)->limit($Page->firstRow . ',' . $Page->listRows)->select();
            $this->show = $show;
            $this->list = $list;
            $this->display('Rbac/userIndex');
        }

    }

    /*
    *  平台用户异步验证
    */
    public function checkUser()
    {
        $username = trim(I('username'));
        $conditions = array('username' => ':username');
        $result = M('AdminUser')->where($conditions)->bind(':username', $username)->find();
        //如果不存在，则可以创建，也就是返回的是true
        if (!$result) {
            echo 'true';
        } else {
            echo 'false';
        }
        exit();
    }

    /*
     *  创建平台用户,这里开启了服务器验证
     */
    public function createAdminUser()
    {
        if (IS_POST) {
            /**
             * [实例化User对象]
             * D方法实例化模型类的时候通常是实例化某个具体的模型类，如果你仅仅是对数据表进行基本的CURD操作的话，
             * 使用M方法实例化的话，由于不需要加载具体的模型类，所以性能会更高。
             */
            $model = D('AdminUser');

            /**
             * 如果创建失败 表示验证没有通过 输出错误提示信息
             * $model->create() 会自动调用验证规则
             */
            if (!$model->create()) return $this->error($model->getError());
            //$username = $model->username;
            //$model->add() 插入数据后会自动的摧毁数据
            if (!$uid = $model->add()) return $this->success('注册失败', U('Rbac/userIndex'));//获取用户id
            // 如果是注册用户的话
//            session('uid', $uid);
//            session('username', $username);
            //用户添加成功后，给用户角色表添加数据
            $role['role_id'] = I('role_id');
            $role['user_id'] = $uid;
            //添加该管理员操作到操作日志中
            $desc = '给ID为:[' . $_POST['role_id'] . ']的角色,新增用户:[' . $_POST['username'] . '],密码为:[' . $_POST['password'] . ']' . '其他参数' . $_POST;
            addOperationLog($desc);
            if (D('AdminRoleUser')->add($role)) {
                return $this->success('添加平台用户成功', U('Rbac/userIndex'));
            } else {
                return $this->error('添加平台用户失败', U('Rbac/userIndex'));
            }
            return $this->success('添加平台用户成功', U('Rbac/userIndex'));
        }
        $this->role_list = M('AdminRole')->select();
        $this->display('Rbac/createAdminUser');
    }

    /**
     * 改变用户角色
     * 可以支持不执行SQL而只是返回SQL语句:$User->fetchSql(true)->add($data);
     */
    public function updateUser()
    {
        $userId = I('get.id');
        if (IS_POST) {
            $data['user_id'] = I('post.user_id');
            $data['role_id'] = I('post.role_id');
            $model = M('AdminRoleUser');
            if ($model->where(array('user_id' => $data['user_id']))->delete() == false) {
                return $this->error('用户角色修改失败', U('Rbac/updateUser', array('id' => $userId)));
            }
            if ($model->add($data) == false) {
                return $this->error('用户角色修改失败', U('Rbac/updateUser', array('id' => $userId)));
            }
            return $this->success('用户角色修改成功', U('Rbac/userIndex'));
        }
        $this->role_list = M('AdminRole')->select();
        $this->user = M('AdminUser')->join('tour_admin_role_user ON tour_admin_role_user.user_id = tour_admin_user.id')->where(array('id' => $userId))->field('user_id,username,role_id')->find();
        $this->display();
    }

    //删除用户
    public function delUser()
    {
        $user_id = I('post.id', '', 'int');
        $user = D('AdminUser');
        $result = $user->relation(true)->where(array('id' => $user_id))->delete();
        if ($result) {
            //添加该管理员操作到操作日志中
            $desc = '删除用户ID:' . $user_id . '成功';
            addOperationLog($desc);
            $response = ['status' => 200, 'errmsg' => '删除成功', 'dataList' => $result];
            return $this->ajaxReturn($response, 'JSON');
        }
        //添加该管理员操作到操作日志中
        $desc = '删除用户ID:' . $user_id . '失败';
        addOperationLog($desc);
        $response = ['status' => 500, 'errmsg' => '删除失败', 'dataList' => $result];
        return $this->ajaxReturn($response, 'JSON');

    }

    //设置用户状态
    public function userStatus()
    {
        $uid = I('post.id');
        $db = M('AdminUser');
        $status = $db->where(array('id' => $uid))->getField('status');
        $status = ($status == 1) ? 0 : 1;
        if ($db->where(array('id' => $uid))->setField('status', $status)) {
            $response = ['status' => 200, 'errmsg' => '改变成功', 'dataList' => $status];
            return $this->ajaxReturn($response, 'JSON');
        }
        //添加该管理员操作到操作日志中
        $desc = '设置用户状态:' . $uid . '失败';
        addOperationLog($desc);
        $response = ['status' => 500, 'errmsg' => '改变失败', 'dataList' => $status];
        return $this->ajaxReturn($response, 'JSON');
    }

    /***********************************节点开始****************************************************/
    //节点列表
    public function nodeIndex()
    {
        $db = D('RbacNode');
        if (IS_AJAX) {
            //$db->
            $nodes = $db->where(['isdel' => 0])->select();
            $nodes = $db->deal($nodes);
            $list = Data::tree($nodes, 'title', 'id', 'pid');
            $this->ajaxReturn(array_values($list));
        } else {
            $this->display();
        }
    }

    //删除节点
    public function nodeDel($id)
    {
        if (IS_AJAX) {
            $db = D('RbacNode');
            $db->isdel = 1;
            $num = $db->where(['id' => $id])->save();
            if ($num) {
                $this->ajaxReturn(['code' => 0, 'mess' => '']);
            } else {
                $this->ajaxReturn(['code' => 1, 'mess' => '操作失败，稍后再试']);
            }
        }
    }

    public function nodeAdd()
    {
        if (IS_GET) {
            $this->assign('icons', $this->getIconList());
            $db = D('RbacNode');
            $nodes = $db->field('id,pid,title')->where("isdel=0 and level between 1 and 2 ")->select();
            $list = Data::tree($nodes, 'title', 'id', 'pid');
            $this->assign('list', $list);
            $this->display();
        } else if (IS_POST) {
            foreach (I('param.paras') as $k => $v) {
                $data[$v['name']] = $v['value'];
            }
            $data['nodestatus'] = isset($data['nodestatus']) ? '1' : '0';
            $Node = D('RbacNode');
            if ($handle_data = $Node->create($data,1)) {
                //var_dump($handle_data);die;
                $Node->add($handle_data);
                $this->success('添加成功', '', true);
            } else {
                $this->error($Node->getError(), '', true);
            }
        }
    }

    //创建权限表单处理
    public function createNode()
    {
        $db = M('AdminNode');

        //创建权限表单处理
        if (IS_POST) {
            $db->create();
            if (!$db->add()) {
                return $this->error("权限添加失败", U('Rbac/nodeIndex'));
            }
            return $this->success('权限添加成功', U('Rbac/nodeIndex'));
        }
        $node = $db->where('level !=3')->order('sort')->select();
        $this->nodelist = Tree::create($node);
        $this->display();
    }

    /*
    *   删除权限
    */
    public function delNode()
    {
        $result = M('AdminNode')->where(array('id' => I('post.id', '', 'int')))->delete();
        if ($result) {
            $response = ['status' => 200, 'errmsg' => '删除成功', 'dataList' => $result];
            return $this->ajaxReturn($response, 'JSON');
        }
        $response = ['status' => 500, 'errmsg' => '删除失败', 'dataList' => $result];
        return $this->ajaxReturn($response, 'JSON');
    }

    /*
    *   设置权限状态
    */
    public function NodeStatus()
    {
        $id = I('post.id');
        $db = M('AdminNode');
        $status = $db->where(array('id' => $id))->getField('status');

        $status = ($status == 1) ? 0 : 1;
        if ($db->where(array('id' => $id))->setField('status', $status)) {
            $response = ['status' => 200, 'errmsg' => '修改成功', 'dataList' => $status];
            return $this->ajaxReturn($response, 'JSON');
        }
        $response = ['status' => 500, 'errmsg' => '修改失败', 'dataList' => $status];
        return $this->ajaxReturn($response, 'JSON');
    }

    /*
   *   该节点是否在菜单栏显示
   */
    public function showMenus()
    {
        $id = I('post.id');
        $db = M('AdminNode');
        $show = $db->where(array('id' => $id))->getField('menus');
        $menus = ($show == 1) ? 0 : 1;
        $result = $db->where(array('id' => $id))->setField('menus', $menus);
        if ($result) {
            $response = ['status' => 200, 'errmsg' => '修改成功', 'dataList' => $result];
            return $this->ajaxReturn($response, 'JSON');
        }
        $response = ['status' => 500, 'errmsg' => '修改失败', 'dataList' => $result];
        return $this->ajaxReturn($response, 'JSON');
    }

    /***********************************角色开始****************************************************/
    public function roleIndex()
    {
        $db = M('AdminRole');
        $this->rolelist = $db->select();
        $this->display();
    }

    /*
     *创建角色
     */
    public function createAdminRole()
    {
        if (IS_POST) {
            $name = I('post.name', '', 'strip_tags');
            $remark = I('post.remark', '', 'strip_tags');
            $pid = I('post.pid', '', 'strip_tags');  // 用strip_tags过滤$_GET['title']
            if (empty($name)) return $this->error('角色名称不能为空');
            $role = M('AdminRole');
            $where['name'] = ':name';
            $roleName = $role->where($where)->bind(':name', $name, \PDO::PARAM_STR)->getField('name');
            if ($roleName) return $this->error("角色名称:'" . $name . "'已经存在", U('Rbac/roleIndex'));

            $role->name = $name;
            $role->remark = $remark;
            $role->pid = $pid;
            //create方法并不算是连贯操作，因为其返回值可能是布尔值，所以必须要进行严格判断。
            if ($role->create()) {
                // 如果主键是自动增长型 成功后返回值就是最新插入的值
                $result = $role->field('name,remark,pid')->add();
                //如果在add方法之前调用field方法，则表示只允许写入指定的字段数据，其他非法字段将会被过滤
                if (!$result) return $this->error("角色添加失败", U('Rbac/createpartent'));
                return $this->success('角色添加成功', U('Rbac/roleIndex'));
            }
            return $this->success('角色添加成功', U('Rbac/roleIndex'));
        }
        $this->display();
    }

    /*
     *添加权限Node位权限表，Access为权限-角色关联表
     */
    public function addNode()
    {
        $rid = I('rid', '', 'int');
        if (!is_numeric($rid)) return $this->success('参数类型错误,必须是数字', U('Rbac/roleIndex'));
        //getFieldById针对某个字段(ID)查询并返回某个字段(name)的值
        $roleModel = M('AdminRole');
        $roleWhere['id'] = ':id';
        $role_name = $roleModel->where($roleWhere)->bind(':id', $rid, \PDO::PARAM_INT)->getField('name');
        if ($role_name == false) return $this->success('没有找到该角色', U('Rbac/roleIndex'));

        //根据角色遍历所有权限
        $access = M('AdminAccess');
        if (IS_POST) {
            $actions = I('post.actions');
            try {
                $access->startTrans();
                $where['role_id'] = ':role_id';
                $mod1 = $access->where($where)->bind(':role_id', $rid)->delete();
                if (!$mod1) $access->rollback();
                $data = array();
                foreach ($actions as $value) {
                    $tmp = explode('_', $value);
                    $data[] = array(
                        'role_id' => $rid,
                        'node_id' => $tmp[0],
                        'level' => $tmp[1]
                    );
                }
                if (!($access->addAll($data))) {
                    $access->rollback();
                } else {
                    $access->commit();
                }
                return $this->success('权限设置成功', U('Rbac/addNode', array('rid' => $rid)));
            } catch (\Exception $e) {
                $access->rollback();
                return $this->success('权限设置异常', U('Rbac/addNode', array('rid' => $rid)));
            }

        }
        $node = M('AdminNode')->order('id')->select();
        $node_list = Tree::create($node);
        $node_arr = array();
        foreach ($node_list as $value) {
            $conditions['node_id'] = $value['id'];
            $conditions['role_id'] = $rid;
            $count = $access->where($conditions)->count();
            if ($count) {
                $value['access'] = '1';
            } else {
                $value['access'] = '0';
            }
            $node_arr[] = $value;
        }
        $this->role_name = $role_name;
        $this->node_list = $node_arr;
        $this->rid = $rid;
        $this->display();
    }

    /*
     *删除角色以及角色所拥有的权限
     */
    public function delRole()
    {
        $role_id = I('post.role_id', '', 'int');
        $user = D('AdminRole');
        $result = $user->relation(true)->where(array('id' => $role_id))->delete();
        if ($result) {
            $response = ['status' => 200, 'errmsg' => '修改成功', 'dataList' => $result];
            return $this->ajaxReturn($response, 'JSON');
        }
        $response = ['status' => 500, 'errmsg' => '修改失败', 'dataList' => $result];
        return $this->ajaxReturn($response, 'JSON');
    }

    /*
    *   设置角色状态
    */
    public function roleStatus()
    {
        $rid = I('post.rid');
        $db = M('AdminRole');
        $status = $db->where(array('id' => $rid))->getField('status');
        $status = ($status == 1) ? 0 : 1;
        if ($db->where(array('id' => $rid))->setField('status', $status)) {
            $response = ['status' => 200, 'errmsg' => '修改成功', 'dataList' => $status];
            return $this->ajaxReturn($response, 'JSON');
        }
        $response = ['status' => 500, 'errmsg' => '修改失败', 'dataList' => $status];
        return $this->ajaxReturn($response, 'JSON');
    }
}