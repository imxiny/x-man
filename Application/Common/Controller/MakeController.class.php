<?php
////////////////////////////////////////////////////////////////////
//                          _ooOoo_                               //
//                         o8888888o                              //
//                         88" . "88                              //
//                         (| $_$ |)                              //
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
//      $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$        //
//         佛祖保佑       永无BUG     永不修改                       //
////////////////////////////////////////////////////////////////////
/**
 * 代码生成器生成控制器所使用的复用类
 * Created by PhpStorm.
 * User: Xiny i@xiny9.com https://xbug.top
 * Coding Standard: PSR2
 * Date: 2018-07-22
 * Time: 23:43
 */

namespace Common\Controller;

use Think\Exception;

trait MakeController
{
    private $table = '';
    private $addTemplet = '';
    private $editTemplet = '';
    private $indexTemplet = '';
    private $whereList = [];
    public function index()
    {
        if (IS_AJAX) {
            $where = " 1 ";
            $data = $_POST;
            parse_str($data['para'], $wherearray);
            $wherearray = I('data.', '', C('DEFAULT_FILTER'), $wherearray);
            $page = empty($data['page']) ? 1 : $data['page'];
            $limit = empty($data['limit']) ? 10 : $data['limit'];
            $whereList = $this->whereList;
            foreach ($wherearray as $k => $v) {
                if (isset($v) && (strlen($v) > 0)) {
                    if (key_exists($k, $whereList)) {
                        if ('eq' === $whereList[$k]) {
                            $where .= " and `{$k}`='{$v}' ";
                        } else {
                            $where .= " and `{$k}` like '%{$v}%' ";
                        }
                    } else {
                        $where .= " and `{$k}`='{$v}' ";
                    }
                }
            }

            $list = M($this->table)
                ->where($where)
                ->limit(($page - 1) * $limit, $limit)
                ->select();
            $count = M($this->table)->where($where)->count();
            $res = array(
                'code' => 0
            , 'count' => $count
            , 'msg' => ''
            , 'data' => $list
            );
            $this->ajaxReturn($res);
        } elseif (IS_GET) {
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
            $this->display($this->addTemplet);
        }
    }

    public function edit()
    {
        if (IS_GET) {
            $info = M($this->table)->getByid(I('get.id'));
            $this->assign('info', $info);
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

    public function delete()
    {
        if (IS_AJAX) {
            try {
                $id = I('post.id');
                if (is_array($id)) {
                    $id = implode($id, ',');
                }
                M($this->table)->startTrans();
                $rows[] = M($this->table)->where(" `id` in ({$id})")->delete();
                if (!in_array(false, $rows, true)) {
                    M($this->table)->commit();
                    $this->success('删除成功');
                } else {
                    M($this->table)->rollback();
                    $this->error('网络故障');
                }
            } catch (Exception $e) {
                $this->error("预期之外的错误，错误ID号：".$e->getErrorID());
            }
        }
    }
}
