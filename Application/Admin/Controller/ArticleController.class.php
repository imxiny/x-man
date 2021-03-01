<?php
/**
 * Created by Makecode
 * User: Xiny https://xbug.top i@xiny9.com
 * Coding Standard: PSR2
 * Date: 2018-09-12
 * Time: 16:31
 */

namespace Admin\Controller;

use Common\Controller\AdminBaseController;
use Common\Controller\MakeController;

class ArticleController extends AdminBaseController
{
    use MakeController;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'article';
        $this->addTemplet = 'Article/add';
        $this->editTemplet = 'Article/edit';
        $this->indexTemplet = 'Article/index';
        $this->whereList = [];
    }
    public function index()
    {
        if (IS_AJAX) {
            $where = " 1 ";
            $data = $_POST;
            parse_str($data['para'], $wherearray);
            $wherearray = I('data.', '', C('DEFAULT_FILTER'), $wherearray);
            $page = empty($data['page']) ? 1 : $data['page'];
            $limit = empty($data['limit']) ? 15 : $data['limit'];
            $whereList = $this->whereList;
            foreach ($wherearray as $k => $v) {
                if (isset($v) && (strlen($v) > 0)) {
                    if (key_exists($k, $whereList)) {
                        if ('eq' === $whereList[$k]) {
                            $where .= " and a.`{$k}`='{$v}' ";
                        } else {
                            $where .= " and a.`{$k}` like '%{$v}%' ";
                        }
                    } else {
                        $where .= " and a.`{$k}`='{$v}' ";
                    }
                }
            }

            $list = M($this->table . ' as a')
                ->field('a.*,b.`title` as category_id,c.`name` as user_id')
                  ->join(C('DB_PREFIX').'category as b on b.`id`=a.`category_id`','inner')
                  ->join(C('DB_PREFIX').'user as c on c.`id`=a.`user_id`','left')
                 ->where($where)
                ->limit(($page - 1) * $limit, $limit)
                ->select();
            $count = M($this->table . ' as a')
                              ->join(C('DB_PREFIX').'category as b on b.`id`=a.`category_id`','inner')
                  ->join(C('DB_PREFIX').'user as c on c.`id`=a.`user_id`','left')
                 ->where($where)
            ->count();
            $res = array(
                'code' => 0
            , 'count' => $count
            , 'msg' => ''
            , 'data' => $list
            );
            $this->ajaxReturn($res);
        } elseif (IS_GET) {
                       $categoryList = M('category')->field('id,title')->select();
           $this->assign('categoryList',$categoryList);
           $userList = M('user')->field('id,name')->select();
           $this->assign('userList',$userList);

            $this->display($this->indexTemplet);
        }
    }
    public function add()
    {
        if (IS_AJAX) {
            try {
                parse_str($_POST['para'], $data);
                $data = I('data.', '', C('DEFAULT_FILTER'), $data);
                foreach ($data as $k => $v) {
                    if (is_array($v)) {
                        $data[$k] = implode($v, ',');
                    }
                }
                M($this->table)->add($data) ? $this->success('添加成功') : $this->error('网络故障');
            } catch (Exception $e) {
                $this->error("预期之外的错误，错误ID号：".$e->getErrorID());
            }
        } elseif (IS_GET) {
           $categoryList = M('category')->field('id,title')->select();
           $this->assign('categoryList',$categoryList);
           $userList = M('user')->field('id,name')->select();
           $this->assign('userList',$userList);

            $this->display($this->addTemplet);
        }
    }
        public function edit()
    {
        if (IS_GET && (!IS_AJAX)) {
            $info = M($this->table)->getByid(I('get.id'));
            $this->assign('info', $info);
                       $categoryList = M('category')->field('id,title')->select();
           $this->assign('categoryList',$categoryList);
           $userList = M('user')->field('id,name')->select();
           $this->assign('userList',$userList);

            $this->display($this->editTemplet);
        } elseif (IS_AJAX) {
            try {
                $data = [];
                parse_str($_POST['para'], $data);
                $data = I('data.', '', C('DEFAULT_FILTER'), $data);
                foreach ($data as $k => $v) {
                    if (is_array($v)) {
                        $data[$k] = implode($v, ',');
                    }
                }
                $row = M($this->table)->save($data);
                $row === false ? $this->error('网络故障') : $row === 0 ?
                    $this->error('数据无改动', 'nojump', IS_AJAX, 2) : $this->success('操作成功');
            } catch (Exception $e) {
                $this->error("预期之外的错误，错误ID号：".$e->getErrorID());
            }
        }
    }
}
