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
			url : "/admin/index/getmenu" //获取菜单json地址
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