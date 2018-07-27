<?php

namespace Admin\Model;

use Common\Model\BaseModel;

class RbacNodeModel extends BaseModel
{
    protected $tableName = 'rbac_node';
    protected $fields = array('id', 'isdel', 'name', 'status', 'title', 'remark', 'sort', 'level', 'pid');
    protected $pk = 'id';
    protected $deal = array(
        'status' => array(0 => '关闭', 1 => '开启'),
        'level' => array(1 => '模块', 2 => '控制器', 3 => '动作'),
        'ismenu' => array(1 => '是', 0 => '否')
    );
    //protected $patchValidate = true;//开启批量验证
    //字段映射
    protected $_map = array(
        'nodename' => 'name',
        'nodetitle' => 'title',
        'nodestatus' => 'status',
        'nodepid' => 'pid',
        'nodesort' => 'sort',
        'noderemark' => 'remark',
        'nodelevel' => 'level',
    );
    // 自动验证
    protected $_validate = array(
        //验证字段----验证规则-----错误提示-----验证条件-----附加规则----验证时间
        array('name', 'require', '节点值必填', 0),
        array('title', 'require', '节点名必填', 0),
        array('pid', 'require', '必须选择父节点', 0),
        array('level', 'require', '必须选择节点类型', 0),
        array('sort', 'require', '排序必须有值', 0)
    );

    // 自动完成
//    protected $_auto=array(
//        array('password','md5',1,'function') , // 对password字段在新增的时候使md5函数处理
//        array('register_time','time',1,'function'), // 对date字段在新增的时候写入当前时间戳
//    );

    public function deal($list)
    {
        if ($list && is_array($list)) {
            foreach ($list as $k => $v) {
                foreach ($v as $k1 => $v1) {
                    if (array_key_exists($k1, $this->deal)) {
                        $list[$k]["{$k1}_friend"] = $this->deal[$k1][$v1];
                    }
                }
            }
            return $list;
        }
        return false;
    }

    /**
     * 添加用户
     * @param array (data)
     * @return bool|int|mixed
     */
//    public function addData($data)
//    {
//        // 对data数据进行验证
//        if (!$data = $this->create($data)) {
//            // 验证不通过返回错误
//            return false;
//        } else {
//            // 验证通过
//            $result = $this->add($data);
//            return $result;
//        }
//    }
    /**
     * 修改用户
     * //     */
//    public function editData($map,$data){
//        // 对data数据进行验证
//        if(!$data=$this->create($data)){
//            // 验证不通过返回错误
//            return false;
//        }else{
//            // 验证通过
//            $result=$this
//                ->where(array($map))
//                ->save($data);
//            return $result;
//        }
//    }

    /**
     * 删除数据
     * @param   array $map where语句数组形式
     * @return  boolean         操作是否成功
     */
//    public function deleteData($map){
//        die('禁止删除用户');
//    }


}
