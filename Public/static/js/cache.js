var cacheStr = window.sessionStorage.getItem("cache"),
    oneLoginStr = window.sessionStorage.getItem("oneLogin");
layui.use(['form', 'jquery', "layer","colorpicker"], function () {
    var form = layui.form,
        $ = layui.jquery,
        colorpicker = layui.colorpicker,
        layer = parent.layer === undefined ? layui.layer : top.layer;

    //公告层
    function showNotice() {
        layer.open({
            type: 1,
            title: "系统公告",
            area: '300px',
            shade: 0.8,
            id: 'LAY_layuipro',
            btn: ['确定'],
            moveType: 1,
            content: '<div style="padding:15px 20px; text-align:justify; line-height: 22px; text-indent:2em;border-bottom:1px solid #e2e2e2;"><p class="layui-red">X-Man后台管理框架</p><p>前端部分使用<a href="http://layuicms.com/v2/index.html" target="_blank">layuiCMS2.0</a>框架为基础再此感谢 驊驊龔頾，感谢layuiCMS2.0、感谢 贤心大神 感谢layui，引入ztree、jquery、toast等插件，后台使用Thinkphp3.2.3为框架，开发的快速后台开发框架，基于Auth的完善权限管理模块，代码生成器功能，选择数据表，可自主选择生成增、删、改、查模块，日志功能、包括登录日志、操作日志、错误日志等、（日志模块完全使用代码生成器开发，无任何修改）开发十分快捷方便！</p></pclass></p></div>',
            success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
                btn.on("click", function () {
                    tipsShow();
                });
            },
            cancel: function (index, layero) {
                tipsShow();
            }
        });
    }

    function tipsShow() {
        window.sessionStorage.setItem("showNotice", "true");
        if ($(window).width() > 432) {  //如果页面宽度不足以显示顶部“系统公告”按钮，则不提示
            layer.tips('系统公告', '#userInfo', {
                tips: 3,
                time: 1000
            });
        }
    }

    $(".showNotice").on("click", function () {
        showNotice();
    });

    //功能设定
    $(".functionSetting").click(function () {
        layer.open({
            title: "功能设定",
            area: ["380px", "280px"],
            type: "1",
            content: '<div class="functionSrtting_box">' +
            '<form class="layui-form">' +
            '<div class="layui-form-item">' +
            '<label class="layui-form-label">开启Tab缓存</label>' +
            '<div class="layui-input-block">' +
            '<input type="checkbox" name="cache" lay-skin="switch" lay-text="开|关">' +
            '<div class="layui-word-aux">开启后刷新页面不关闭打开的Tab页</div>' +
            '</div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<label class="layui-form-label">Tab切换刷新</label>' +
            '<div class="layui-input-block">' +
            '<input type="checkbox" name="changeRefresh" lay-skin="switch" lay-text="开|关">' +
            '<div class="layui-word-aux">开启后切换窗口刷新当前页面</div>' +
            '</div>' +
            '</div>' +
            '<div class="layui-form-item skinBtn">' +
            '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="settingSuccess">设定完成</a>' +
            '<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-primary" lay-submit="" lay-filter="noSetting">退下,容朕想想</a>' +
            '</div>' +
            '</form>' +
            '</div>',
            success: function (index, layero) {
                //如果之前设置过，则设置它的值
                $(".functionSrtting_box input[name=cache]").prop("checked", cacheStr == "true" ? true : false);
                $(".functionSrtting_box input[name=changeRefresh]").prop("checked", changeRefreshStr == "true" ? true : false);
                $(".functionSrtting_box input[name=oneLogin]").prop("checked", oneLoginStr == "true" ? true : false);
                //设定
                form.on("submit(settingSuccess)", function (data) {
                    window.sessionStorage.setItem("cache", data.field.cache == "on" ? "true" : "false");
                    window.sessionStorage.setItem("changeRefresh", data.field.changeRefresh == "on" ? "true" : "false");
                    window.sessionStorage.removeItem("menu");
                    window.sessionStorage.removeItem("curmenu");
                    location.reload();
                    return false;
                });
                //取消设定
                form.on("submit(noSetting)", function () {
                    layer.closeAll("page");
                });
                form.render();  //表单渲染
            }
        })
    });
    $(".changeSkin").click(function () {
        let old = '';
        layer.open({
            title: "更换皮肤",
            area: ["60%", "77%"],
            type: "1",
            shade:false,
            content: $("#skinbox"),
            success: function (index, layero) {
                $.post("/admin/index/getSkin",function(data){
                    if(data.has){
                        for(let t in data){
                            if (-1 !== t.indexOf('color')) {
                                $("#" + t).val(data[t]).change();
                            }
                        }
                        /*form.val('form1',{
                            'menucolor':data.menucolor,
                            'framecolor':data.framecolor,
                            'topcolor':data.topcolor,
                            'leftcolor':data.leftcolor,
                            'topbottomcolor':data.topbottomcolor
                        });*/
                    }
                });
                $.post("/admin/index/getSystemSkin",function(data){
                    let list = '';
                    for(let i=0;i<data.length;i++){
                    list += '<a data-skinid="'+data[i].id+'" class="layui-btn layui-btn-sm">'+data[i].name+'</a>';
                    }
                    $(".system_skin_list").html(list);
                });
                old = $('head').find('style').text();
            },
            cancel: function () {
                let head = $("head");
                head.find('style').remove();
                head.append("<style type='text/css'>" +old+ "</style>");
            }
        })
    })
    $('#skinbox').on('click','a[data-skinid]',function(){
        let skid = $(this).data('skinid');
        $.post("/admin/index/getSkinById",{'id':skid},function(data){
            for(let t in data){
                if (-1 !== t.indexOf('color')) {
                    $("#" + t).val(data[t]).change();
                }
            }
            /*form.val('form1',{
                'menucolor':data.menucolor,
                'framecolor':data.framecolor,
                'topcolor':data.topcolor,
                'leftcolor':data.leftcolor,
                'topbottomcolor':data.topbottomcolor
            });
            $("input[name=framecolor]").change();*/
        });
    });
});