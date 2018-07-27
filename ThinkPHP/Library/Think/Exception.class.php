<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
/**
 * ThinkPHP系统异常基类
 */
namespace Think;

class Exception extends \Exception
{
    protected $error_id;

    public function getErrorID()
    {
        $errData = array(
            'file' => $this->getFile(),
            'line' => $this->getLine(),
            'code' => $this->getCode(),
            'message' => $this->getMessage(),
            'trace' => $this->getTraceAsString(),
            'createtime' => date('Y-m-d H:i:s'),
            'admin_user_id' => unserialize(session('x-admin'))['id'] ?: ''
        );
        try {
            $this->error_id = M('system_error_log')->add($errData);
        } catch (\Exception $e) {
            $this->error_id = '网络故障';
        }
        return $this->error_id;
    }
}
