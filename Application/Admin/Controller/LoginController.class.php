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
//         佛祖保佑       永无BUG     永不修改                       //
////////////////////////////////////////////////////////////////////
/**
 * Created by PhpStorm.
 * User: Xiny i@xiny9.com
 * Date: 2018-05-29
 * Time: 21:14
 */

namespace Admin\Controller;

use Common\Controller\BaseController;
use Think\Verify;

class LoginController extends BaseController
{
    /**
     * 登陆主页
     */
    protected $vid = '5b586bf6fc651147f425d5bf';

    public function index()
    {
        $this->assign('vid',$this->vid);
        $this->assign('bg',mt_rand(1,15));
        $this->assign('url', '/admin/index/index');
        $this->display("login/index");
    }

    /**
     * 登陆操作
     */
    public function check()
    {
        $token = '';
        $username = '';
        $password = '';
        parse_str($_POST['para'], $para);
        extract($para);
        $M = M('admin_user');
        $para = "id={$this->vid}&secretkey=b058dc977c7a4cbbac18a5e6a2704e6f&"
        ."token={$token}&ip=".get_client_ip();
        $res = $this->curlGetInfo("http://api.vaptcha.com/v2/validate",'post',$para);
        $t = json_decode($res,true);
        if ('0' == $t['success']) {
            $this->error('人机验证失败，请您重新验证');
        }
        /** @var array $user */
        $user = $M->getByusername($username);
        if (!($user !== false && !empty($user))) {
            $this->error('用户 ' . $username . ' 不存在');
        }
        //判断密码
        if (!password_verify($password, $user['password'])) {
            $this->error('密码错误');
        }
        //判断是否停用
        if ('0' == $user['status']) {
            $this->error('用户 ' . $username . ' 已停用', '', true, 3);
        }

        $groups = M('auth_group_access')->where(['uid' => $user['id']])->select();
        if (empty($groups)) {
            $this->error('用户 ' . $username . ' 未绑定角色组，请联系管理员', '', true, 3);
        }
        //添加登录日志
        $osinfo = $this->getBrowser();
        $logData = array(
            'admin_user_id' => $user['id'],
            'ip' => get_client_ip(),
            'logtime' => date('Y-m-d H:i:s'),
            'browser' => $osinfo['browser'],
            'os' => $osinfo['os'],
        );
        M('system_login_log')->add($logData);
        session('x-admin', serialize($user));
        session('x_admin_id', $user['id']);
        $this->success('登录成功');
    }

    /*
     * 登出
     */
    public function logout()
    {
        session('x-admin', null);
        $this->redirect('/admin');
    }

    /**
     * @return array 浏览器版本
     */
    private function getBrowser()
    {
        $flag = $_SERVER['HTTP_USER_AGENT'];
        $para = array();

        // 检查操作系统
        if (preg_match('/Windows[\d\. \w]*/', $flag, $match)) $para['os'] = $match[0];

        if (preg_match('/Chrome\/[\d\.\w]*/', $flag, $match)) {
            // 检查Chrome
            $para['browser'] = $match[0];
        } elseif (preg_match('/Safari\/[\d\.\w]*/', $flag, $match)) {
            // 检查Safari
            $para['browser'] = $match[0];
        } elseif (preg_match('/MSIE [\d\.\w]*/', $flag, $match)) {
            // IE
            $para['browser'] = $match[0];
        } elseif (preg_match('/Opera\/[\d\.\w]*/', $flag, $match)) {
            // opera
            $para['browser'] = $match[0];
        } elseif (preg_match('/Firefox\/[\d\.\w]*/', $flag, $match)) {
            // Firefox
            $para['browser'] = $match[0];
        } elseif (preg_match('/OmniWeb\/(v*)([^\s|;]+)/i', $flag, $match)) {
            //OmniWeb
            $para['browser'] = $match[2];
        } elseif (preg_match('/Netscape([\d]*)\/([^\s]+)/i', $flag, $match)) {
            //Netscape
            $para['browser'] = $match[2];
        } elseif (preg_match('/Lynx\/([^\s]+)/i', $flag, $match)) {
            //Lynx
            $para['browser'] = $match[1];
        } elseif (preg_match('/360SE/i', $flag, $match)) {
            //360SE
            $para['browser'] = '360安全浏览器';
        } elseif (preg_match('/SE 2.x/i', $flag, $match)) {
            //搜狗
            $para['browser'] = '搜狗浏览器';
        } else {
            $para['browser'] = 'unkown';
        }
        return $para;
    }

    /**
     * @param $url
     * @param string $type
     * @param string $paras
     * @param string $refer
     * @return mixed
     */
    private function curlGetInfo($url, $type = 'get', $paras = '') {
#设置执行时间不限时
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_REFERER, $_SERVER['HTTP_HOST']);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        if ('post' == $type) {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $paras);
        }
        $content = curl_exec($ch);
        curl_close($ch);
        return $content;
    }
}
