## X-Man后台管理框架
### Author  Xiny
+ Layui2.4.3+Thinkphp3.2.3后台管理框架，一键增删改查，支持多表外联，控件多样化，完善的权限管理模块
+ 演示地址：[http://x.imxiny.com](http://x.imxiny.com "X-Man后台管理框架")
+ 如果觉得对你有所帮助 请为我点个星星 谢谢 
+ 数据库文件 xinyadmin.sql
+ 如有疑问+Q 1655241471

# 安装

```bash
git clone git@github.com:imxiny/x-man.git
```

导入 xman.sql 文件

设置数据库配置  Application\Common\Conf\db.conf

设置伪静态nginx

必须设置伪静态，且通过域名直接访问，不能通过路径访问

 ```
location / {
	if (!-e $request_filename){
		rewrite  ^(.*)$  /index.php?s=$1  last;   break;
	}
}
 ```



