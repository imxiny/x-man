<?php

namespace Common\Controller;

use Think\Auth;

/**
 * admin 基类控制器
 */
class AdminBaseController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        if (empty(session('x-admin'))) {
            $url = '';
            if ($_SERVER['HTTP_HOST'] == C('HTTP_HOST')) {
                $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
                $url = $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
            }
            $url = empty($url) ? '/admin/index/index' : $url;
			$url = "/admin";
            if (IS_AJAX) {
                //5 log 4 in 9 wrong 登陆错误
                $this->error('please login in x-manage', '', true, '3');
            }
            $this->redirect("/admin/login/index", ['jumpLink' => urlencode($url)]);
        }
        $rule = strtolower(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME);
        $Auth = new Auth();
        $count = M('auth_rule')->where(['status' => '1', 'name' => $rule])->count();

        if ($count != '0' && !$Auth->check($rule, session('x_admin_id'))) {
            $this->error("未获取该功能授权", 'nojump', IS_AJAX, 3);
        }
        //是否开启操作时间、内存统计
        if (C("SCS_TIME_MEM")) {
            G('begin');
        }
    }

    public function get_icon_list()
    {
        $icons1 = array(0 => 'iconfont icon-27', 1 => 'iconfont icon-QQ', 2 => 'iconfont icon-activity', 3 => 'iconfont icon-activity_fill', 4 => 'iconfont icon-add', 5 => 'iconfont icon-add1', 6 => 'iconfont icon-add2', 7 => 'iconfont icon-addition', 8 => 'iconfont icon-addition_fill', 9 => 'iconfont icon-addpeople', 10 => 'iconfont icon-addpeople_fill', 11 => 'iconfont icon-addressbook', 12 => 'iconfont icon-addressbook_fill', 13 => 'iconfont icon-barrage_fill', 14 => 'iconfont icon-bianji', 15 => 'iconfont icon-bianji1', 16 => 'iconfont icon-bianji2', 17 => 'iconfont icon-bianji3', 18 => 'iconfont icon-bianji4', 19 => 'iconfont icon-bianji5', 20 => 'iconfont icon-brush', 21 => 'iconfont icon-brush_fill', 22 => 'iconfont icon-businesscard', 23 => 'iconfont icon-businesscard_fill', 24 => 'iconfont icon-caidan', 25 => 'iconfont icon-camera', 26 => 'iconfont icon-camera_fill', 27 => 'iconfont icon-chushaixuanxiang', 28 => 'iconfont icon-clock', 29 => 'iconfont icon-clock_fill', 30 => 'iconfont icon-close', 31 => 'iconfont icon-cmstubiaozitihua15', 32 => 'iconfont icon-collection_fill', 33 => 'iconfont icon-computer', 34 => 'iconfont icon-computer_fill', 35 => 'iconfont icon-coordinates', 36 => 'iconfont icon-coordinates_fill', 37 => 'iconfont icon-createtask', 38 => 'iconfont icon-decoration_fill', 39 => 'iconfont icon-delete-copy', 40 => 'iconfont icon-dianji', 41 => 'iconfont icon-document', 42 => 'iconfont icon-edit', 43 => 'iconfont icon-emoji', 44 => 'iconfont icon-emoji_fill', 45 => 'iconfont icon-empty', 46 => 'iconfont icon-empty_fill', 47 => 'iconfont icon-erweima', 48 => 'iconfont icon-erweima1', 49 => 'iconfont icon-feedback', 50 => 'iconfont icon-font29', 51 => 'iconfont icon-guanbi', 52 => 'iconfont icon-guanli', 53 => 'iconfont icon-houtai1', 54 => 'iconfont icon-houtai2', 55 => 'iconfont icon-houtai4', 56 => 'iconfont icon-houtai5', 57 => 'iconfont icon-icon-test', 58 => 'iconfont icon-icon02', 59 => 'iconfont icon-icon021', 60 => 'iconfont icon-icon_article', 61 => 'iconfont icon-iconfont', 62 => 'iconfont icon-iconfontfile', 63 => 'iconfont icon-iconfonticonfontweibo', 64 => 'iconfont icon-lianjie', 65 => 'iconfont icon-lianjie1', 66 => 'iconfont icon-lianjie2', 67 => 'iconfont icon-lianjie3', 68 => 'iconfont icon-live', 69 => 'iconfont icon-lock', 70 => 'iconfont icon-mail', 71 => 'iconfont icon-mail_fill', 72 => 'iconfont icon-manage', 73 => 'iconfont icon-manage_fill', 74 => 'iconfont icon-menu', 75 => 'iconfont icon-menu1', 76 => 'iconfont icon-message_fill', 77 => 'iconfont icon-offline', 78 => 'iconfont icon-order_fill', 79 => 'iconfont icon-picture', 80 => 'iconfont icon-praise', 81 => 'iconfont icon-praise_fill', 82 => 'iconfont icon-publishgoods_fill', 83 => 'iconfont icon-qq', 84 => 'iconfont icon-qq1', 85 => 'iconfont icon-qq2', 86 => 'iconfont icon-qq3', 87 => 'iconfont icon-qq4', 88 => 'iconfont icon-qq5', 89 => 'iconfont icon-qq6', 90 => 'iconfont icon-shanchu', 91 => 'iconfont icon-shanchu1', 92 => 'iconfont icon-shanchu2', 93 => 'iconfont icon-shanchu3', 94 => 'iconfont icon-shanchu4', 95 => 'iconfont icon-shou', 96 => 'iconfont icon-sina', 97 => 'iconfont icon-tianjia', 98 => 'iconfont icon-translation', 99 => 'iconfont icon-translation_fill', 100 => 'iconfont icon-trash_fill', 101 => 'iconfont icon-tupian', 102 => 'iconfont icon-tupian-copy', 103 => 'iconfont icon-tupian1', 104 => 'iconfont icon-tupian2', 105 => 'iconfont icon-video_fill', 106 => 'iconfont icon-wb', 107 => 'iconfont icon-weiBo', 108 => 'iconfont icon-wenben', 109 => 'iconfont icon-wenben1', 110 => 'iconfont icon-wenben2', 111 => 'iconfont icon-wenjian', 112 => 'iconfont icon-wenjian1', 113 => 'iconfont icon-wenjian2', 114 => 'iconfont icon-wenjian3', 115 => 'iconfont icon-wenzhang', 116 => 'iconfont icon-wenzhang-copy', 117 => 'iconfont icon-wenzhang1', 118 => 'iconfont icon-wenzhang2', 119 => 'iconfont icon-wenzhang3', 120 => 'iconfont icon-wenzhang4', 121 => 'iconfont icon-wenzhang5', 122 => 'iconfont icon-wenzhang6', 123 => 'iconfont icon-wenzhang7', 124 => 'iconfont icon-wenzhang8', 125 => 'iconfont icon-xiaolvdashiicon02', 126 => 'iconfont icon-xiaoshoutianchong', 127 => 'iconfont icon-yonghu', 128 => 'iconfont icon-yonghu1', 129 => 'iconfont icon-yonghu2', 130 => 'iconfont icon-youjian', 131 => 'iconfont icon-youjian1', 132 => 'iconfont icon-youjian2', 133 => 'iconfont icon-youjian3', 134 => 'iconfont icon-youjian4', 135 => 'iconfont icon-youjian5');

        $icons2 = array(0 => 'layui-icon layui-icon-rate-half', 1 => 'layui-icon layui-icon-rate', 2 => 'layui-icon layui-icon-rate-solid', 3 => 'layui-icon layui-icon-cellphone', 4 => 'layui-icon layui-icon-vercode', 5 => 'layui-icon layui-icon-login-wechat', 6 => 'layui-icon layui-icon-login-qq', 7 => 'layui-icon layui-icon-login-weibo', 8 => 'layui-icon layui-icon-password', 9 => 'layui-icon layui-icon-username', 10 => 'layui-icon layui-icon-refresh-3', 11 => 'layui-icon layui-icon-auz', 12 => 'layui-icon layui-icon-spread-left', 13 => 'layui-icon layui-icon-shrink-right', 14 => 'layui-icon layui-icon-snowflake', 15 => 'layui-icon layui-icon-tips', 16 => 'layui-icon layui-icon-note', 17 => 'layui-icon layui-icon-home', 18 => 'layui-icon layui-icon-senior', 19 => 'layui-icon layui-icon-refresh', 20 => 'layui-icon layui-icon-refresh-1', 21 => 'layui-icon layui-icon-flag', 22 => 'layui-icon layui-icon-theme', 23 => 'layui-icon layui-icon-notice', 24 => 'layui-icon layui-icon-website', 25 => 'layui-icon layui-icon-console', 26 => 'layui-icon layui-icon-face-surprised', 27 => 'layui-icon layui-icon-set', 28 => 'layui-icon layui-icon-template-1', 29 => 'layui-icon layui-icon-app', 30 => 'layui-icon layui-icon-template', 31 => 'layui-icon layui-icon-praise', 32 => 'layui-icon layui-icon-tread', 33 => 'layui-icon layui-icon-male', 34 => 'layui-icon layui-icon-female', 35 => 'layui-icon layui-icon-camera', 36 => 'layui-icon layui-icon-camera-fill', 37 => 'layui-icon layui-icon-more', 38 => 'layui-icon layui-icon-more-vertical', 39 => 'layui-icon layui-icon-rmb', 40 => 'layui-icon layui-icon-dollar', 41 => 'layui-icon layui-icon-diamond', 42 => 'layui-icon layui-icon-fire', 43 => 'layui-icon layui-icon-return', 44 => 'layui-icon layui-icon-location', 45 => 'layui-icon layui-icon-read', 46 => 'layui-icon layui-icon-survey', 47 => 'layui-icon layui-icon-face-smile', 48 => 'layui-icon layui-icon-face-cry', 49 => 'layui-icon layui-icon-cart-simple', 50 => 'layui-icon layui-icon-cart', 51 => 'layui-icon layui-icon-next', 52 => 'layui-icon layui-icon-prev', 53 => 'layui-icon layui-icon-upload-drag', 54 => 'layui-icon layui-icon-upload', 55 => 'layui-icon layui-icon-download-circle', 56 => 'layui-icon layui-icon-component', 57 => 'layui-icon layui-icon-file-b', 58 => 'layui-icon layui-icon-user', 59 => 'layui-icon layui-icon-find-fill', 60 => 'layui-icon layui-icon-loading', 61 => 'layui-icon layui-icon-loading-1', 62 => 'layui-icon layui-icon-add-1', 63 => 'layui-icon layui-icon-play', 64 => 'layui-icon layui-icon-pause', 65 => 'layui-icon layui-icon-headset', 66 => 'layui-icon layui-icon-video', 67 => 'layui-icon layui-icon-voice', 68 => 'layui-icon layui-icon-speaker', 69 => 'layui-icon layui-icon-fonts-del', 70 => 'layui-icon layui-icon-fonts-code', 71 => 'layui-icon layui-icon-fonts-html', 72 => 'layui-icon layui-icon-fonts-strong', 73 => 'layui-icon layui-icon-unlink', 74 => 'layui-icon layui-icon-picture', 75 => 'layui-icon layui-icon-link', 76 => 'layui-icon layui-icon-face-smile-b', 77 => 'layui-icon layui-icon-align-left', 78 => 'layui-icon layui-icon-align-right', 79 => 'layui-icon layui-icon-align-center', 80 => 'layui-icon layui-icon-fonts-u', 81 => 'layui-icon layui-icon-fonts-i', 82 => 'layui-icon layui-icon-tabs', 83 => 'layui-icon layui-icon-radio', 84 => 'layui-icon layui-icon-circle', 85 => 'layui-icon layui-icon-edit', 86 => 'layui-icon layui-icon-share', 87 => 'layui-icon layui-icon-delete', 88 => 'layui-icon layui-icon-form', 89 => 'layui-icon layui-icon-cellphone-fine', 90 => 'layui-icon layui-icon-dialogue', 91 => 'layui-icon layui-icon-fonts-clear', 92 => 'layui-icon layui-icon-layer', 93 => 'layui-icon layui-icon-date', 94 => 'layui-icon layui-icon-water', 95 => 'layui-icon layui-icon-code-circle', 96 => 'layui-icon layui-icon-carousel', 97 => 'layui-icon layui-icon-prev-circle', 98 => 'layui-icon layui-icon-layouts', 99 => 'layui-icon layui-icon-util', 100 => 'layui-icon layui-icon-templeate-1', 101 => 'layui-icon layui-icon-upload-circle', 102 => 'layui-icon layui-icon-tree', 103 => 'layui-icon layui-icon-table', 104 => 'layui-icon layui-icon-chart', 105 => 'layui-icon layui-icon-chart-screen', 106 => 'layui-icon layui-icon-engine', 107 => 'layui-icon layui-icon-triangle-d', 108 => 'layui-icon layui-icon-triangle-r', 109 => 'layui-icon layui-icon-file', 110 => 'layui-icon layui-icon-set-sm', 111 => 'layui-icon layui-icon-add-circle', 112 => 'layui-icon layui-icon-404', 113 => 'layui-icon layui-icon-about', 114 => 'layui-icon layui-icon-up', 115 => 'layui-icon layui-icon-down', 116 => 'layui-icon layui-icon-left', 117 => 'layui-icon layui-icon-right', 118 => 'layui-icon layui-icon-circle-dot', 119 => 'layui-icon layui-icon-search', 120 => 'layui-icon layui-icon-set-fill', 121 => 'layui-icon layui-icon-group', 122 => 'layui-icon layui-icon-friends', 123 => 'layui-icon layui-icon-reply-fill', 124 => 'layui-icon layui-icon-menu-fill', 125 => 'layui-icon layui-icon-log', 126 => 'layui-icon layui-icon-picture-fine', 127 => 'layui-icon layui-icon-face-smile-fine', 128 => 'layui-icon layui-icon-list', 129 => 'layui-icon layui-icon-release', 130 => 'layui-icon layui-icon-ok', 131 => 'layui-icon layui-icon-help', 132 => 'layui-icon layui-icon-chat', 133 => 'layui-icon layui-icon-top', 134 => 'layui-icon layui-icon-star', 135 => 'layui-icon layui-icon-star-fill', 136 => 'layui-icon layui-icon-close-fill', 137 => 'layui-icon layui-icon-close', 138 => 'layui-icon layui-icon-ok-circle', 139 => 'layui-icon layui-icon-add-circle-fine',);
        $icons = array_merge($icons1, $icons2);

        $str = "<table class=\"layui-table\"><tbody>";
        $num = 0;
        for ($i = 0; $i <= 60; $i++) {
            if (!isset($icons[$num])) {
                break;
            }
            $str .= "<tr>";
            for ($j = 0; $j <= 7; $j++) {
                $str .= "<td><i style=\"cursor: pointer;\" class=\"{$icons[$num]}\" onclick=\"choseIcon(this)\"></i></td>";
                $num++;
            }
            $str .= "</tr>";
        }
        return $str;
    }
}

