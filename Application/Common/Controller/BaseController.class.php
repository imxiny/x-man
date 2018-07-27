<?php

namespace Common\Controller;

//use Think\Controller;
use Think\Controller;
use Think\Verify;

/**
 * Base基类控制器
 */
class BaseController extends Controller {
	/**
	 * 初始化方法
	 */
	public function _initialize() {
	}

	//获取icon列表
	public function getIconList() {
//        $icons = array(
		//            "icon-zhanghu",
		//            "icon-lock1",
		//            "icon-erweima",
		//            "icon-xinlangweibo",
		//            "icon-qq",
		//            "icon-icon",
		//            "icon-edit",
		//            "icon-computer",
		//            "icon-text",
		//            "icon-guanbi",
		//            "icon-shuaxin1",
		//            "icon-loginout",
		//            "icon-shezhi1",
		//            "icon-gonggao",
		//            "icon-menu1",
		//            "icon-wenben",
		//            "icon-dengji1",
		//            "icon-dengji2",
		//            "icon-dengji3",
		//            "icon-dengji4",
		//            "icon-dengji5",
		//            "icon-dengji6",
		//            "icon-new1",
		//            "icon-huanfu",
		//            "icon-link",
		//            "icon-lingsheng",
		//            "icon-star",
		//            "icon-dongtaifensishu",
		//            "icon-prohibit",
		//            "icon-caozuo",
		//            "icon-weather",
		//        );
		$icons = array('icon-27', 'icon-QQ', 'icon-activity', 'icon-activity_fill', 'icon-add', 'icon-add1', 'icon-add2', 'icon-addition', 'icon-addition_fill', 'icon-addpeople', 'icon-addpeople_fill', 'icon-addressbook', 'icon-addressbook_fill', 'icon-barrage_fill', 'icon-bianji', 'icon-bianji1', 'icon-bianji2', 'icon-bianji3', 'icon-bianji4', 'icon-bianji5', 'icon-brush', 'icon-brush_fill', 'icon-businesscard', 'icon-businesscard_fill', 'icon-caidan', 'icon-camera', 'icon-camera_fill', 'icon-chushaixuanxiang', 'icon-clock', 'icon-clock_fill', 'icon-close', 'icon-cmstubiaozitihua15', 'icon-collection_fill', 'icon-computer', 'icon-computer_fill', 'icon-coordinates', 'icon-coordinates_fill', 'icon-createtask', 'icon-decoration_fill', 'icon-delete-copy', 'icon-dianji', 'icon-document', 'icon-edit', 'icon-emoji', 'icon-emoji_fill', 'icon-empty', 'icon-empty_fill', 'icon-erweima', 'icon-erweima1', 'icon-feedback', 'icon-font29', 'icon-guanbi', 'icon-guanli', 'icon-houtai1', 'icon-houtai2', 'icon-houtai4', 'icon-houtai5', 'icon-icon-test', 'icon-icon02', 'icon-icon021', 'icon-icon_article', 'icon-iconfont', 'icon-iconfontfile', 'icon-iconfonticonfontweibo', 'icon-lianjie', 'icon-lianjie1', 'icon-lianjie2', 'icon-lianjie3', 'icon-live', 'icon-lock', 'icon-mail', 'icon-mail_fill', 'icon-manage', 'icon-manage_fill', 'icon-menu', 'icon-menu1', 'icon-message_fill', 'icon-offline', 'icon-order_fill', 'icon-picture', 'icon-praise', 'icon-praise_fill', 'icon-publishgoods_fill', 'icon-qq', 'icon-qq1', 'icon-qq2', 'icon-qq3', 'icon-qq4', 'icon-qq5', 'icon-qq6', 'icon-shanchu', 'icon-shanchu1', 'icon-shanchu2', 'icon-shanchu3', 'icon-shanchu4', 'icon-shou', 'icon-sina', 'icon-tianjia', 'icon-translation', 'icon-translation_fill', 'icon-trash_fill', 'icon-tupian', 'icon-tupian-copy', 'icon-tupian1', 'icon-tupian2', 'icon-video_fill', 'icon-wb', 'icon-weiBo', 'icon-wenben', 'icon-wenben1', 'icon-wenben2', 'icon-wenjian', 'icon-wenjian1', 'icon-wenjian2', 'icon-wenjian3', 'icon-wenzhang', 'icon-wenzhang-copy', 'icon-wenzhang1', 'icon-wenzhang2', 'icon-wenzhang3', 'icon-wenzhang4', 'icon-wenzhang5', 'icon-wenzhang6', 'icon-wenzhang7', 'icon-wenzhang8', 'icon-xiaolvdashiicon02', 'icon-xiaoshoutianchong', 'icon-yonghu', 'icon-yonghu1', 'icon-yonghu2', 'icon-youjian', 'icon-youjian1', 'icon-youjian2', 'icon-youjian3', 'icon-youjian4', 'icon-youjian5');
		$str = "<table class=\"layui-table\"><tbody>";
		$num = 0;
		for ($i = 0; $i <= 20; $i++) {
			if (!isset($icons[$num])) {
				break;
			}
			$str .= "<tr>";
			for ($j = 0; $j <= 10; $j++) {
				$str .= "<td><i style=\"cursor: pointer;\" class=\"iconfont {$icons[$num]}\" onclick=\"choseIcon(this)\"></i></td>";
				$num++;
			}
			$str .= "</tr>";
		}
		return $str;
	}

	public function getCodeImg() {
		if ($_SERVER['HTTP_HOST'] != C('HTTP_HOST')) {
			exit('not access get code img');
		}
		$config = array(
			'seKey' => C('SEKEY'), // 验证码加密密钥
			'codeSet' => '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY', // 验证码字符集合
			'expire' => 1800, // 验证码过期时间（s）
			'useZh' => false, // 使用中文验证码
			'useImgBg' => false, // 使用背景图片
			'fontSize' => 17, // 验证码字体大小(px)
			'useCurve' => true, // 是否画混淆曲线
			'useNoise' => true, // 是否添加杂点
			'imageH' => 36, // 验证码图片高度
			'imageW' => 116, // 验证码图片宽度
			'length' => 4, // 验证码位数
			'fontttf' => '', // 验证码字体，不设置随机获取
			'bg' => array(243, 251, 254), // 背景颜色
			'reset' => true, // 验证成功后是否重置
		);
		$config = array_merge($config, I('get.'));
		$ob = new Verify($config);
		$ob->entry();
	}
}
