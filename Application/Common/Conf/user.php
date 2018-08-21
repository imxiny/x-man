<?php
/**
 * Created by PhpStorm.
 * User: Xiny i@xiny9.com
 * Date: 2017/11/29
 * Time: 11:06
 */
//存放自定义配置
return array(
	'HTTP_HOST' => '127.0.0.24', //必须配置 否则验证码失效
	'SEKEY' => 'x-man', //验证码干扰值
	'UPLOAD_TYPE' => 'local', //oss或local 配置oss 下面的ALIOSSCONF一定要配置正确
	//阿里云存储设置
	'ALIOSSCONF' => array(
		'KEY' => '',
		'SECRET' => '',
		'ENDPOINT' => '',
		'BUCKET' => '',
	),
	//后台操作日志是否记录程序运行时间及其所用内存
	'SCS_TIME_MEM' => true,
	//后台管理模块名配置 必须配置，用于判断后台记录操作日志
	'DEFAULT_ADMIN_MODULE' => 'Admin',
);