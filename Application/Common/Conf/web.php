<?php
/**
 * Created by PhpStorm.
 * User: Xiny i@xiny9.com
 * Date: 2017/11/29
 * Time: 11:10
 */
//一些网站的设置 session cookie等
return array(
    'SHOW_PAGE_TRACE' =>false,
    'AUTH_CONFIG' => array(
        'AUTH_ON'=> true,// 认证开关
        'AUTH_TYPE'=> 1,// 认证方式，1为实时认证；2为登录认证。
    ),
    //错误模板和正确模板
    'TMPL_ACTION_SUCCESS' => "Index:dispatch_jump",
    'TMPL_ACTION_ERROR' => "Index:dispatch_jump"

);