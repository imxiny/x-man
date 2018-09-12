var tabFilter,menu=[],liIndex,curNav,delMenu,
    changeRefreshStr = window.sessionStorage.getItem("changeRefresh");
layui.define(["element","jquery"],function(exports){
	var element = layui.element,
		$ = layui.$,
		layId,
		Tab = function(){
			this.tabConfig = {
				openTabNum : undefined,  //最大可打开窗口数量
				tabFilter : "bodyTab",  //添加窗口的filter
				url : undefined,  //获取菜单json地址
				firstTitle:'后台首页1', //配置后台首页菜单
				firstUrl:'/admin/index/index1', //配置后台首页菜单
			}
		};
    //生成左侧菜单
    Tab.prototype.navBar = function(strData){
        var data;
        if(typeof(strData) === "string"){
            data = JSON.parse(strData); //部分用户解析出来的是字符串，转换一下
        }else{
            data = strData;
        }
        var ulHtml = '';
        for(var i=0;i<data.length;i++){
            if(data[i].spread || data[i].spread === undefined){
                ulHtml += '<li class="layui-nav-item layui-nav-itemed">';
            }else{
                ulHtml += '<li class="layui-nav-item">';
            }
            if(data[i].children !== undefined && data[i].children.length > 0){
                ulHtml += '<a>';
                ulHtml += '<i class="'+data[i].icon+'" data-icon="'+data[i].icon+'"></i>';
                ulHtml += '<cite>'+data[i].title+'</cite>';
                ulHtml += '<span class="layui-nav-more"></span>';
                ulHtml += '</a>';
                ulHtml += '<dl class="layui-nav-child">';
                for(var j=0;j<data[i].children.length;j++){
                    if(data[i].children[j].target == "_blank"){
                        ulHtml += '<dd><a data-url="'+data[i].children[j].href+'" target="'+data[i].children[j].target+'">';
                    }else{
                        ulHtml += '<dd><a data-url="'+data[i].children[j].href+'">';
                    }
                    if(data[i].children[j].icon != undefined && data[i].children[j].icon != ''){
                        ulHtml += '<i class="'+data[i].children[j].icon+'" data-icon="'+data[i].children[j].icon+'"></i>';
                    }
                    ulHtml += '<cite>'+data[i].children[j].title+'</cite></a></dd>';
                }
                ulHtml += "</dl>";
            }else{
                if(data[i].target === "_blank"){
                    ulHtml += '<a data-url="'+data[i].href+'" target="'+data[i].target+'">';
                }else{
                    ulHtml += '<a data-url="'+data[i].href+'">';
                }
                ulHtml += '<i class="'+data[i].icon+'" data-icon="'+data[i].icon+'"></i>';
                ulHtml += '<cite>'+data[i].title+'</cite></a>';
            }
            ulHtml += '</li>';
        }
        return ulHtml;
    };
	//获取二级菜单数据
	Tab.prototype.render = function() {
		//显示左侧菜单
		var _this = this;
		$(".navBar ul").html('<li class="layui-nav-item layui-this"><a data-url="' + _this.tabConfig.firstUrl + '"><i class="layui-icon layui-icon-home" data-icon="layui-icon layui-icon-home"></i><cite>' + _this.tabConfig.firstTitle + '</cite></a></li>').append(_this.navBar(dataStr)).height($(window).height()-138);
		element.init();  //初始化页面元素
        $(".navBar").height($(window).height()-138);
		$(window).resize(function(){
			$(".navBar").height($(window).height()-138);
		})
	};

	//是否点击窗口切换刷新页面
	Tab.prototype.changeRegresh = function(index){
        if(changeRefreshStr === "true"){
        	let iframe = $($(".clildFrame .layui-tab-item").eq(index).find("iframe")[0]);
            iframe.attr('src',iframe.attr('src'));

        	//旧版方法 同源限制 不可刷新不同源网页
            /*$(".clildFrame .layui-tab-item").eq(index).find("iframe")[0].contentWindow.location.reload();*/
        }
	};

	//参数设置
	Tab.prototype.set = function(option) {
		var _this = this;
		$.extend(true, _this.tabConfig, option);
		return _this;
	};

	//通过title获取lay-id
	Tab.prototype.getLayId = function(title){
		$(".layui-tab-title.top_tab li").each(function(){
			if($(this).find("cite").text() === title){
				layId = $(this).attr("lay-id");
			}
		});
		return layId;
	};
	//通过title判断tab是否存在
	Tab.prototype.hasTab = function(title){
		var tabIndex = -1;
		$(".layui-tab-title.top_tab li").each(function(){
			if($(this).find("cite").text() == title){
				tabIndex = 1;
			}
		});
		return tabIndex;
	};

	//右侧内容tab操作
	var tabIdIndex = 0;
	Tab.prototype.tabAdd = function(_this){
		if(window.sessionStorage.getItem("menu")){
			menu = JSON.parse(window.sessionStorage.getItem("menu"));
		}
		var that = this;
		var openTabNum = that.tabConfig.openTabNum;
			tabFilter = that.tabConfig.tabFilter;
		if(_this.attr("target") == "_blank"){
			window.open(_this.attr("data-url"));
		}else if(_this.attr("data-url") != undefined){
			var title = '';
            title += '<i class="'+_this.find("i").attr("data-icon")+'"></i>';
			//已打开的窗口中不存在
			if(that.hasTab(_this.find("cite").text()) == -1 && _this.siblings("dl.layui-nav-child").length == 0){

                if($(".layui-tab-title.top_tab li").length == openTabNum){
                    layer.msg('只能同时打开'+openTabNum+'个选项卡');
                    return;
                }

                //加载进度条事件
                NProgress.done();
                NProgress.start();
                setTimeout(function(){
                    NProgress.done();
                },Math.floor(Math.random() * (6000 - 2000) + 1000));


				tabIdIndex++;
				title += '<cite>'+_this.find("cite").text().replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;")+'</cite>';
				title += '<i class="layui-icon layui-unselect layui-tab-close layui-icon-close" data-id="'+tabIdIndex+'" title="关闭此页面"></i>';
				element.tabAdd(tabFilter, {
			        title : title,
			        content :"<iframe src='"+_this.attr("data-url")+"' data-id='"+tabIdIndex+"'></iframe>",
			        id : new Date().getTime()
			    });
				//当前窗口内容
				var curmenu = {
					"icon" : _this.find("i.iconfont").attr("data-icon")!=undefined ? _this.find("i.iconfont").attr("data-icon") : _this.find("i.layui-icon").attr("data-icon"),
					"title" : _this.find("cite").text(),
					"href" : _this.attr("data-url"),
					"layId" : new Date().getTime()
				};
				menu.push(curmenu);
				window.sessionStorage.setItem("menu",JSON.stringify(menu)); //打开的窗口
				window.sessionStorage.setItem("curmenu",JSON.stringify(curmenu));  //当前的窗口
				element.tabChange(tabFilter, that.getLayId(_this.find("cite").text()));
				that.tabMove(); //顶部窗口是否可滚动
			}else{
				//当前窗口内容
				var curmenu = {
					"icon" : _this.find("i.iconfont").attr("data-icon")!=undefined ? _this.find("i.iconfont").attr("data-icon") : _this.find("i.layui-icon").attr("data-icon"),
					"title" : _this.find("cite").text(),
					"href" : _this.attr("data-url")
				};
                that.changeRegresh(_this.parent('.layui-nav-item').index());
				window.sessionStorage.setItem("curmenu", JSON.stringify(curmenu));  //当前的窗口
				element.tabChange(tabFilter, that.getLayId(_this.find("cite").text()));
				that.tabMove(); //顶部窗口是否可滚动
			}
		}
	};

	//顶部窗口移动
	Tab.prototype.tabMove = function(){
		$(window).on("resize",function(event){
			var topTabsBox = $("#top_tabs_box"),
				topTabsBoxWidth = $("#top_tabs_box").width(),
				topTabs = $("#top_tabs"),
				topTabsWidth = $("#top_tabs").width(),
				tabLi = topTabs.find("li.layui-this"),
				top_tabs = document.getElementById("top_tabs"),
				event = event || window.event;

			if(topTabsWidth > topTabsBoxWidth){
				if(tabLi.position().left > topTabsBoxWidth || tabLi.position().left+topTabsBoxWidth > topTabsWidth){
					topTabs.css("left",topTabsBoxWidth-topTabsWidth);
				}else{
					topTabs.css("left",-tabLi.position().left);
				}
				//拖动效果
				var flag = false;
				var cur = {
				    x:0,
				    y:0
				};
				var nx,dx,x ;
				function down(event){
				    flag = true;
				    var touch ;
				    if(event.touches){
				        touch = event.touches[0];
				    }else {
				        touch = event;
				    }
				    cur.x = touch.clientX;
				    dx = top_tabs.offsetLeft;
				}
				function move(event){
					var self = this;
                    if(flag){
						window.getSelection ? window.getSelection().removeAllRanges() : document.selection.empty();
				        var touch ;
				        if(event.touches){
				            touch = event.touches[0];
				        }else {
				            touch = event;
				        }
				        nx = touch.clientX - cur.x;
				        x = dx+nx;
				        if(x > 0){
				        	x = 0;
				        }else{
				        	 if(x < topTabsBoxWidth-topTabsWidth){
				        	 	x = topTabsBoxWidth-topTabsWidth;
				        	 }else{
				        	 	x = dx+nx;
				        	 }
				        }
				        top_tabs.style.left = x +"px";
				        //阻止页面的滑动默认事件
				        document.addEventListener("touchmove",function(){
				            event.preventDefault();
				        },false);
				    }
				}
				//鼠标释放时候的函数
				function end(){
				    flag = false;
				}
				//pc端拖动效果
				topTabs.on("mousedown",down);
				topTabs.on("mousemove",move);
				$(document).on("mouseup",end);
				//移动端拖动效果
				topTabs.on("touchstart",down);
				topTabs.on("touchmove",move);
				topTabs.on("touchend",end);
			}else{
				//移除pc端拖动效果
				topTabs.off("mousedown",down);
				topTabs.off("mousemove",move);
				topTabs.off("mouseup",end);
				//移除移动端拖动效果
				topTabs.off("touchstart",down);
				topTabs.off("touchmove",move);
				topTabs.off("touchend",end);
				topTabs.removeAttr("style");
				return false;
			}
		}).resize();
	};

	var bodyTab = new Tab();
	exports("bodyTab",function(option){
		return bodyTab.set(option);
	});
})
