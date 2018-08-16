layui.define(function (exports) {
    var $ = layui.$;
    var allicons = ['iconfont icon-27','iconfont icon-QQ','iconfont icon-activity','iconfont icon-activity_fill','iconfont icon-add','iconfont icon-add1','iconfont icon-add2','iconfont icon-addition','iconfont icon-addition_fill','iconfont icon-addpeople','iconfont icon-addpeople_fill','iconfont icon-addressbook','iconfont icon-addressbook_fill','iconfont icon-barrage_fill','iconfont icon-bianji','iconfont icon-bianji1','iconfont icon-bianji2','iconfont icon-bianji3','iconfont icon-bianji4','iconfont icon-bianji5','iconfont icon-brush','iconfont icon-brush_fill','iconfont icon-businesscard','iconfont icon-businesscard_fill','iconfont icon-caidan','iconfont icon-camera','iconfont icon-camera_fill','iconfont icon-chushaixuanxiang','iconfont icon-clock','iconfont icon-clock_fill','iconfont icon-close','iconfont icon-cmstubiaozitihua15','iconfont icon-collection_fill','iconfont icon-computer','iconfont icon-computer_fill','iconfont icon-coordinates','iconfont icon-coordinates_fill','iconfont icon-createtask','iconfont icon-decoration_fill','iconfont icon-delete-copy','iconfont icon-dianji','iconfont icon-document','iconfont icon-edit','iconfont icon-emoji','iconfont icon-emoji_fill','iconfont icon-empty','iconfont icon-empty_fill','iconfont icon-erweima','iconfont icon-erweima1','iconfont icon-feedback','iconfont icon-font29','iconfont icon-guanbi','iconfont icon-guanli','iconfont icon-houtai1','iconfont icon-houtai2','iconfont icon-houtai4','iconfont icon-houtai5','iconfont icon-icon-test','iconfont icon-icon02','iconfont icon-icon021','iconfont icon-icon_article','iconfont icon-iconfont','iconfont icon-iconfontfile','iconfont icon-iconfonticonfontweibo','iconfont icon-lianjie','iconfont icon-lianjie1','iconfont icon-lianjie2','iconfont icon-lianjie3','iconfont icon-live','iconfont icon-lock','iconfont icon-mail','iconfont icon-mail_fill','iconfont icon-manage','iconfont icon-manage_fill','iconfont icon-menu','iconfont icon-menu1','iconfont icon-message_fill','iconfont icon-offline','iconfont icon-order_fill','iconfont icon-picture','iconfont icon-praise','iconfont icon-praise_fill','iconfont icon-publishgoods_fill','iconfont icon-qq','iconfont icon-qq1','iconfont icon-qq2','iconfont icon-qq3','iconfont icon-qq4','iconfont icon-qq5','iconfont icon-qq6','iconfont icon-shanchu','iconfont icon-shanchu1','iconfont icon-shanchu2','iconfont icon-shanchu3','iconfont icon-shanchu4','iconfont icon-shou','iconfont icon-sina','iconfont icon-tianjia','iconfont icon-translation','iconfont icon-translation_fill','iconfont icon-trash_fill','iconfont icon-tupian','iconfont icon-tupian-copy','iconfont icon-tupian1','iconfont icon-tupian2','iconfont icon-video_fill','iconfont icon-wb','iconfont icon-weiBo','iconfont icon-wenben','iconfont icon-wenben1','iconfont icon-wenben2','iconfont icon-wenjian','iconfont icon-wenjian1','iconfont icon-wenjian2','iconfont icon-wenjian3','iconfont icon-wenzhang','iconfont icon-wenzhang-copy','iconfont icon-wenzhang1','iconfont icon-wenzhang2','iconfont icon-wenzhang3','iconfont icon-wenzhang4','iconfont icon-wenzhang5','iconfont icon-wenzhang6','iconfont icon-wenzhang7','iconfont icon-wenzhang8','iconfont icon-xiaolvdashiicon02','iconfont icon-xiaoshoutianchong','iconfont icon-yonghu','iconfont icon-yonghu1','iconfont icon-yonghu2','iconfont icon-youjian','iconfont icon-youjian1','iconfont icon-youjian2','iconfont icon-youjian3','iconfont icon-youjian4','iconfont icon-youjian5','layui-icon layui-icon-rate-half','layui-icon layui-icon-rate','layui-icon layui-icon-rate-solid','layui-icon layui-icon-cellphone','layui-icon layui-icon-vercode','layui-icon layui-icon-login-wechat','layui-icon layui-icon-login-qq','layui-icon layui-icon-login-weibo','layui-icon layui-icon-password','layui-icon layui-icon-username','layui-icon layui-icon-refresh-3','layui-icon layui-icon-auz','layui-icon layui-icon-spread-left','layui-icon layui-icon-shrink-right','layui-icon layui-icon-snowflake','layui-icon layui-icon-tips','layui-icon layui-icon-note','layui-icon layui-icon-home','layui-icon layui-icon-senior','layui-icon layui-icon-refresh','layui-icon layui-icon-refresh-1','layui-icon layui-icon-flag','layui-icon layui-icon-theme','layui-icon layui-icon-notice','layui-icon layui-icon-website','layui-icon layui-icon-console','layui-icon layui-icon-face-surprised','layui-icon layui-icon-set','layui-icon layui-icon-template-1','layui-icon layui-icon-app','layui-icon layui-icon-template','layui-icon layui-icon-praise','layui-icon layui-icon-tread','layui-icon layui-icon-male','layui-icon layui-icon-female','layui-icon layui-icon-camera','layui-icon layui-icon-camera-fill','layui-icon layui-icon-more','layui-icon layui-icon-more-vertical','layui-icon layui-icon-rmb','layui-icon layui-icon-dollar','layui-icon layui-icon-diamond','layui-icon layui-icon-fire','layui-icon layui-icon-return','layui-icon layui-icon-location','layui-icon layui-icon-read','layui-icon layui-icon-survey','layui-icon layui-icon-face-smile','layui-icon layui-icon-face-cry','layui-icon layui-icon-cart-simple','layui-icon layui-icon-cart','layui-icon layui-icon-next','layui-icon layui-icon-prev','layui-icon layui-icon-upload-drag','layui-icon layui-icon-upload','layui-icon layui-icon-download-circle','layui-icon layui-icon-component','layui-icon layui-icon-file-b','layui-icon layui-icon-user','layui-icon layui-icon-find-fill','layui-icon layui-icon-loading','layui-icon layui-icon-loading-1','layui-icon layui-icon-add-1','layui-icon layui-icon-play','layui-icon layui-icon-pause','layui-icon layui-icon-headset','layui-icon layui-icon-video','layui-icon layui-icon-voice','layui-icon layui-icon-speaker','layui-icon layui-icon-fonts-del','layui-icon layui-icon-fonts-code','layui-icon layui-icon-fonts-html','layui-icon layui-icon-fonts-strong','layui-icon layui-icon-unlink','layui-icon layui-icon-picture','layui-icon layui-icon-link','layui-icon layui-icon-face-smile-b','layui-icon layui-icon-align-left','layui-icon layui-icon-align-right','layui-icon layui-icon-align-center','layui-icon layui-icon-fonts-u','layui-icon layui-icon-fonts-i','layui-icon layui-icon-tabs','layui-icon layui-icon-radio','layui-icon layui-icon-circle','layui-icon layui-icon-edit','layui-icon layui-icon-share','layui-icon layui-icon-delete','layui-icon layui-icon-form','layui-icon layui-icon-cellphone-fine','layui-icon layui-icon-dialogue','layui-icon layui-icon-fonts-clear','layui-icon layui-icon-layer','layui-icon layui-icon-date','layui-icon layui-icon-water','layui-icon layui-icon-code-circle','layui-icon layui-icon-carousel','layui-icon layui-icon-prev-circle','layui-icon layui-icon-layouts','layui-icon layui-icon-util','layui-icon layui-icon-templeate-1','layui-icon layui-icon-upload-circle','layui-icon layui-icon-tree','layui-icon layui-icon-table','layui-icon layui-icon-chart','layui-icon layui-icon-chart-screen','layui-icon layui-icon-engine','layui-icon layui-icon-triangle-d','layui-icon layui-icon-triangle-r','layui-icon layui-icon-file','layui-icon layui-icon-set-sm','layui-icon layui-icon-add-circle','layui-icon layui-icon-404','layui-icon layui-icon-about','layui-icon layui-icon-up','layui-icon layui-icon-down','layui-icon layui-icon-left','layui-icon layui-icon-right','layui-icon layui-icon-circle-dot','layui-icon layui-icon-search','layui-icon layui-icon-set-fill','layui-icon layui-icon-group','layui-icon layui-icon-friends','layui-icon layui-icon-reply-fill','layui-icon layui-icon-menu-fill','layui-icon layui-icon-log','layui-icon layui-icon-picture-fine','layui-icon layui-icon-face-smile-fine','layui-icon layui-icon-list','layui-icon layui-icon-release','layui-icon layui-icon-ok','layui-icon layui-icon-help','layui-icon layui-icon-chat','layui-icon layui-icon-top','layui-icon layui-icon-star','layui-icon layui-icon-star-fill','layui-icon layui-icon-close-fill','layui-icon layui-icon-close','layui-icon layui-icon-ok-circle','layui-icon layui-icon-add-circle-fine'];
    var ihtml = '<div class="popover"><div class="popover-title"><input type="search" class="form-control iconpicker-search" placeholder="查找图标"></div>'
    ihtml += '<div class="iconpicker-items"><ul class="icon_lists"></ul></div></div>';
    if ($('.popover').length <= 0) {
        $('body').append(ihtml)
    }

    for (var i in allicons) {
        $('.icon_lists').append('<li class="hov" data-icon="' + allicons[i] + '"><i class="' + allicons[i] + '"></i></li>');
    }

    var picksel = {
        pickinit: function (es, els) {
            var e, el;
            if ($('#' + es).length > 0) {
                e = $('#' + es);
            } else {
                e = $('.' + es);
            }
            if ($('#' + els).length > 0) {
                el = $('#' + els);
            } else {
                el = $('.' + els);
            }
            e.click(function () {
                if ($('.popover').css('display') == "none") {
                    $('.popover').css({
                        'left': e.offset().left,
                        'top': e.offset().top + e[0].clientHeight + 5
                    });
                    $('.popover').slideDown(150);
                    ;
                } else {
                    $(".popover").slideUp(150);
                }

            }), $(document).click(function () {
                $(".popover").slideUp(150);
            }), $(e).click(function (event) {
                event.stopPropagation();
            }), $('.popover').click(function (event) {
                event.stopPropagation();
            }), $('.icon_lists li').click(function () {
                $(this).addClass('selectd').removeClass('hov').siblings().removeClass('selectd');
                e.find('i').attr('class', $(this).attr("data-icon"));
                el.val($(this).attr("data-icon"));
                e.click();
            }), $('.iconpicker-search').keyup(function () {
                var str = $(this).val();
                var icons = [];
                $('.icon_lists li').each(function () {
                    var b = $(this);
                    var e = b.attr("data-icon").toLowerCase();
                    var f = false;
                    try {
                        f = new RegExp(str, "g");
                    } catch (a) {
                        f = false;
                    }
                    if (f !== false && e.match(f)) {
                        icons.push(b);
                        b.show();
                    } else {
                        b.hide();
                    }
                })

            })
        }
    }
    exports('iconpick', picksel);
});

