var $,tab,dataStr,layer,getData;
layui.config({
	base : "/Public/static/js/"
}).extend({
	"bodyTab" : "bodyTab"
});
layui.use(['bodyTab','form','element','layer'],function(){
	var form = layui.form,
		element = layui.element;
    	layer = parent.layer === undefined ? layui.layer : top.layer;
		tab = layui.bodyTab({
			openTabNum : "15",  //最大可打开窗口数量
			url : "/admin/index/getmenu", //获取菜单json地址
            firstUrl:'/admin/index/index',//后台首页名
            firstTitle:'后台首页'//后台首页url
		});

    //切换后获取当前窗口的内容
    $("body").on("click",".top_tab li",function(){
        var curmenu = '';
        var menu = JSON.parse(window.sessionStorage.getItem("menu"));
        if(window.sessionStorage.getItem("menu")) {
            curmenu = menu[$(this).index() - 1];
        }
        if($(this).index() == 0){
            window.sessionStorage.setItem("curmenu",'');
        }else{
            window.sessionStorage.setItem("curmenu",JSON.stringify(curmenu));
            if(window.sessionStorage.getItem("curmenu") == "undefined"){
                //如果删除的不是当前选中的tab,则将curmenu设置成当前选中的tab
                if(curNav != JSON.stringify(delMenu)){
                    window.sessionStorage.setItem("curmenu",curNav);
                }else{
                    window.sessionStorage.setItem("curmenu",JSON.stringify(menu[liIndex-1]));
                }
            }
        }
        element.tabChange(tabFilter,$(this).attr("lay-id")).init();
        tab.changeRegresh($(this).index());
        setTimeout(function(){
            tab.tabMove();
        },100);
    });

    //删除tab
    $("body").on("click",".top_tab li i.layui-tab-close",function(){
        //删除tab后重置session中的menu和curmenu
        liIndex = $(this).parent("li").index();
        var menu = JSON.parse(window.sessionStorage.getItem("menu"));
        if(menu != null) {
            //获取被删除元素
            delMenu = menu[liIndex - 1];
            var curmenu = window.sessionStorage.getItem("curmenu") == "undefined" ? undefined : window.sessionStorage.getItem("curmenu") == "" ? '' : JSON.parse(window.sessionStorage.getItem("curmenu"));
            if (JSON.stringify(curmenu) != JSON.stringify(menu[liIndex - 1])) {  //如果删除的不是当前选中的tab
                // window.sessionStorage.setItem("curmenu",JSON.stringify(curmenu));
                curNav = JSON.stringify(curmenu);
            } else {
                if ($(this).parent("li").length > liIndex) {
                    window.sessionStorage.setItem("curmenu", curmenu);
                    curNav = curmenu;
                } else {
                    window.sessionStorage.setItem("curmenu", JSON.stringify(menu[liIndex - 1]));
                    curNav = JSON.stringify(menu[liIndex - 1]);
                }
            }
            menu.splice((liIndex - 1), 1);
            window.sessionStorage.setItem("menu", JSON.stringify(menu));
        }
        element.tabDelete("bodyTab",$(this).parent("li").attr("lay-id")).init();
        tab.tabMove();
    });

    //刷新当前
    $(".refresh").on("click",function(){  //此处添加禁止连续点击刷新一是为了降低服务器压力，另外一个就是为了防止超快点击造成chrome本身的一些js文件的报错(不过貌似这个问题还是存在，不过概率小了很多)
        if($(this).hasClass("refreshThis")){
            $(this).removeClass("refreshThis");
            let iframe = $($(".clildFrame .layui-tab-item.layui-show").find("iframe")[0]);
            if(NProgress){
                NProgress.done();
                NProgress.start();
                setTimeout(function(){
                    NProgress.done();
                },5000)
            }
            iframe.attr('src',iframe.attr('src'));
            //以下方法同源限制
            /*$(".clildFrame .layui-tab-item.layui-show").find("iframe")[0].contentWindow.location.reload();*/
            setTimeout(function(){
                $(".refresh").addClass("refreshThis");
            },2000)
        }else{
            layer.msg("点击次数过多，请稍后");
        }
    });

    //关闭其他
    $(".closePageOther").on("click",function(){
        if($("#top_tabs li").length>2 && $("#top_tabs li.layui-this cite").text()!==tab.tabConfig.firstTitle){
            var menu = JSON.parse(window.sessionStorage.getItem("menu"));
            $("#top_tabs li").each(function(){
                if($(this).attr("lay-id") != '' && !$(this).hasClass("layui-this")){
                    element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
                    //此处将当前窗口重新获取放入session，避免一个个删除来回循环造成的不必要工作量
                    for(var i=0;i<menu.length;i++){
                        if($("#top_tabs li.layui-this cite").text() == menu[i].title){
                            menu.splice(0,menu.length,menu[i]);
                            window.sessionStorage.setItem("menu",JSON.stringify(menu));
                        }
                    }
                }
            })
        }else if($("#top_tabs li.layui-this cite").text()==tab.tabConfig.firstTitle && $("#top_tabs li").length>1){
            $("#top_tabs li").each(function(){
                if($(this).attr("lay-id") != '' && !$(this).hasClass("layui-this")){
                    element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
                    window.sessionStorage.removeItem("menu");
                    menu = [];
                    window.sessionStorage.removeItem("curmenu");
                }
            })
        }else{
            layer.msg("没有可以关闭的窗口");
        }
        //渲染顶部窗口
        tab.tabMove();
    });
    //关闭全部
    $(".closePageAll").on("click",function(){
        if($("#top_tabs li").length > 1){
            $("#top_tabs li").each(function(){
                if($(this).attr("lay-id") != ''){
                    element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
                    window.sessionStorage.removeItem("menu");
                    menu = [];
                    window.sessionStorage.removeItem("curmenu");
                }
            })
        }else{
            layer.msg("没有可以关闭的窗口");
        }
        //渲染顶部窗口
        tab.tabMove();
    });

	//通过顶部菜单获取左侧二三级菜单
    getData = function(id){
        var store = window.sessionStorage;
        if(typeof store === 'undefined'){
            console.log('很遗憾，您的浏览器对h5的支持不是很好');
            $.getJSON(tab.tabConfig.url+'/id/'+id,function(data){
                dataStr = data;
                //重新渲染左侧菜单
                tab.render();
                //菜单搜索功能
                let search = $('#search');
                let option = 'op' + id;
                let optinoStr = '';
                if(!store.getItem(option)){
                    optinoStr = '<option value="">搜索导航</option>';
                    for(let k =0;k<dataStr.length;k++){
                        let t = dataStr[k];
                        if (t['children']) {
                            for(let n =0;n<t['children'].length;n++){
                                let t1 = t['children'][n];
                                optinoStr += '<option value="'+t1.href+'">'+t1.title+'</option>';
                            }
                        } else {
                            optinoStr += '<option value="'+t.href+'">'+t.title+'</option>';
                        }
                    }
                    store.setItem(option,optinoStr);
                } else {
                    optinoStr = store.getItem(option);
                }
                search.html(optinoStr);
                form.render('select');
            })
        }else{
            var key = 'menu' + id;
            if(!store.getItem(key)){
                $.getJSON(tab.tabConfig.url+'/id/'+id,function(data){
                    dataStr = data;
                    store.setItem(key,JSON.stringify(data));
                    //重新渲染左侧菜单
                    tab.render();
                    //菜单搜索功能
                    let search = $('#search');
                    let option = 'op' + id;
                    let optinoStr = '';
                    if(!store.getItem(option)){
                        optinoStr = '<option value="">搜索导航</option>';
                        for(let k =0;k<dataStr.length;k++){
                            let t = dataStr[k];
                            if (t['children']) {
                                for(let n =0;n<t['children'].length;n++){
                                    let t1 = t['children'][n];
                                    optinoStr += '<option value="'+t1.href+'">'+t1.title+'</option>';
                                }
                            } else {
                                optinoStr += '<option value="'+t.href+'">'+t.title+'</option>';
                            }
                        }
                        store.setItem(option,optinoStr);
                    } else {
                        optinoStr = store.getItem(option);
                    }
                    search.html(optinoStr);
                    form.render('select');
                });
            }else{
                dataStr = JSON.parse(store.getItem(key));
                //重新渲染左侧菜单
                tab.render();
                //菜单搜索功能
                let search = $('#search');
                let option = 'op' + id;
                let optinoStr = '';
                if(!store.getItem(option)){
                    optinoStr = '<option value="">搜索导航</option>';
                    for(let k =0;k<dataStr.length;k++){
                        let t = dataStr[k];
                        if (t['children']) {
                            for(let n =0;n<t['children'].length;n++){
                                let t1 = t['children'][n];
                                optinoStr += '<option value="'+t1.href+'">'+t1.title+'</option>';
                            }
                        } else {
                            optinoStr += '<option value="'+t.href+'">'+t.title+'</option>';
                        }
                    }
                    store.setItem(option,optinoStr);
                } else {
                    optinoStr = store.getItem(option);
                }
                search.html(optinoStr);
                form.render('select');
            }
        }
	};
    form.on('select(searchPage)',function(e){
        let a = $("a[data-url='"+e.value+"']");
        if(a.length){
            a.click();
        }
    });
	//页面加载时判断左侧菜单是否显示
	//通过顶部菜单获取左侧菜单
	$(".topLevelMenus li,.mobileTopLevelMenus dd").click(function(){
		if($(this).parents(".mobileTopLevelMenus").length !== 0){
			$(".topLevelMenus li").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
		}else{
			$(".mobileTopLevelMenus dd").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
		}
		$(".layui-layout-admin").removeClass("showMenu");
		$('.hideMenu').find('i').removeClass("layui-icon-spread-left").addClass('layui-icon-shrink-right');
		$("body").addClass("site-mobile");
		getData($(this).data("menu"));
		//渲染顶部窗口
		tab.tabMove();
	});

	//隐藏左侧导航
	$(".hideMenu").click(function(){
		if($(".topLevelMenus li.layui-this a").data("url")){
			layer.msg("此栏目状态下左侧菜单不可展开");  //主要为了避免左侧显示的内容与顶部菜单不匹配
			return false;
		}
		let _this = $(this).find('i');
		if( _this.hasClass('layui-icon-shrink-right') ) {
		    _this.removeClass('layui-icon-shrink-right').addClass('layui-icon-spread-left');
        } else {
            _this.removeClass('layui-icon-spread-left').addClass('layui-icon-shrink-right');
        }
		$(".layui-layout-admin").toggleClass("showMenu");
		//渲染顶部窗口
		tab.tabMove();
	});

	//手机设备的简单适配
    $('.site-tree-mobile').on('click', function(){
		$('body').addClass('site-mobile');
	});
    $('.site-mobile-shade').on('click', function(){
		$('body').removeClass('site-mobile');
	});

	// 添加新窗口
	$("body").on("click",".layui-nav .layui-nav-item a:not('.mobileTopLevelMenus .layui-nav-item a')",function(){
		//如果不存在子级
		if($(this).siblings().length === 0){
			addTab($(this));
			$('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
		}
		$(this).parent("li").siblings().removeClass("layui-nav-itemed");
	});

	//清除缓存
	$(".clearCache").click(function(){
        var index = layer.msg('清除缓存中，请稍候',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            window.sessionStorage.clear();
            window.localStorage.clear();
            $.post("/admin/index/clearcache");
            layer.close(index);
            layer.msg("缓存清除成功！",{icon:1,time:1000});
        },500);
    });

	//刷新后还原打开的窗口
    if(cacheStr == "true") {
        if (window.sessionStorage.getItem("menu") != null) {
            menu = JSON.parse(window.sessionStorage.getItem("menu"));
            curmenu = window.sessionStorage.getItem("curmenu");
            var openTitle = '';
            for (var i = 0; i < menu.length; i++) {
                openTitle = '';
                if (menu[i].icon) {
                    openTitle += '<i class="' + menu[i].icon + '"></i>';
                }
                openTitle += '<cite>' + menu[i].title + '</cite>';
                openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + menu[i].layId + '">&#x1006;</i>';
                element.tabAdd("bodyTab", {
                    title: openTitle,
                    content: "<iframe src='" + menu[i].href + "' data-id='" + menu[i].layId + "'></iframe>",
                    id: menu[i].layId
                });
                //定位到刷新前的窗口
                if (curmenu != "undefined") {
                    if (curmenu == '' || curmenu == "null") {  //定位到后台首页
                        element.tabChange("bodyTab", '');
                    } else if (JSON.parse(curmenu).title == menu[i].title) {  //定位到刷新前的页面
                        element.tabChange("bodyTab", menu[i].layId);
                    }
                } else {
                    element.tabChange("bodyTab", menu[menu.length - 1].layId);
                }
            }
            //渲染顶部窗口
            tab.tabMove();
        }
    }else{
		window.sessionStorage.removeItem("menu");
		window.sessionStorage.removeItem("curmenu");
	}
});

//打开新窗口
function addTab(_this){
	tab.tabAdd(_this);
}
//图片管理弹窗
function showImg(){
    $.getJSON('json/images.json', function(json){
        var res = json;
        layer.photos({
            photos: res,
            anim: 5
        });
    });
}
let full = function(){
    let docElm = document.documentElement;
    //W3C
    if (docElm.requestFullscreen) {
        docElm.requestFullscreen();
    }
    //FireFox
    else if (docElm.mozRequestFullScreen) {
        docElm.mozRequestFullScreen();
    }
    //Chrome等
    else if (docElm.webkitRequestFullScreen) {
        docElm.webkitRequestFullScreen();
    }
    //IE11
    else if (docElm.msRequestFullscreen) {
        docElm.msRequestFullscreen();
    }
};
let exitfull = function(){
    if (document.exitFullscreen) {
        document.exitFullscreen();
    }
    else if (document.mozCancelFullScreen) {
        document.mozCancelFullScreen();
    }
    else if (document.webkitCancelFullScreen) {
        document.webkitCancelFullScreen();
    }
    else if (document.msExitFullscreen) {
        document.msExitFullscreen();
    }
};