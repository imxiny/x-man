<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/Public/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/Public/static/css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form layui-form-pane" lay-filter="form1" style="width:90%;padding-left: 5%;">
	<input type="hidden" name="id" value="<?php echo ($info["id"]); ?>"><div class="layui-form-item">
	<label class="layui-form-label" for="name"><b style="color: red">* </b>用户名</label>
	<div class="layui-input-block">
		<input type="text" name="name" id="name" placeholder="用户名"  lay-verify="required" lay-verType="tips"   autocomplete="off"  maxlength="255" value=""  class="layui-input">
	</div>
</div><div class="layui-form-item">
	<label class="layui-form-label" for="phone"><b style="color: red">* </b>移动电话</label>
	<div class="layui-input-block">
		<input type="text" name="phone" id="phone" placeholder="移动电话"  lay-verify="required" lay-verType="tips"   autocomplete="off"  maxlength="32" value=""  class="layui-input">
	</div>
</div><div class="layui-form-item">
	<label class="layui-form-label" for="birdate"><b style="color: red">* </b>生日</label>
	<div class="layui-input-block">
		<input type="text" readonly name="birdate" id="birdate" placeholder="年-月-日 时:分:秒"  lay-verify="required" lay-verType="tips"   autocomplete="off"  class="layui-input">
	</div>
</div><div class="layui-form-item">
	<label class="layui-form-label" for="headimage"><b style="color: red">* </b>头像</label>
	<div class="layui-input-block">
		<input type="text" readonly style="cursor: pointer" name="headimage" id="headimage" placeholder="头像"  lay-verify="required" lay-verType="tips"   autocomplete="off"  class="layui-input">
		<img src="" id="headimage_show" alt="头像" style="height: 100px;width: auto;position: absolute;z-index: 10;border: 1px dashed #d2d2d2;display: none">
	</div>
</div><div class="layui-form-item">
	<label class="layui-form-label" >可用状态</label>
	<div class="layui-input-block">
		<input type="radio" name="state" value="0" title="禁用"  >
<input type="radio" name="state" value="1" title="可用" checked >

	</div>
</div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addData">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="/Public/static/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/Public/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','layer','laydate','upload','layedit'],function(){
        let form = layui.form,
		laydate = layui.laydate,
		upload = layui.upload,
		layedit = layui.layedit,
        layer = parent.layer === undefined ? layui.layer : top.layer;

        
laydate.render({
                          elem: '#birdate'
                          ,theme: '#01AAED'
                          ,type: 'date'
                          ,trigger: 'click'
                        });

upload.render({
            elem: "#headimage"
            ,url: "/admin/FileUpload/upload"
            ,before:function(){
                layer.msg("图片上传中",{icon:16});
            }
            ,done: function(res){
                let item = this.item;
                layer.closeAll();
                if(res.code === 0){
                    layer.msg("上传成功",{icon:1});
                    $(item).val(res.data.src);
                }else{
                    layer.alert(res.msg);
                }
            }
        });
        $("#headimage").hover(function(){
            let _this = $(this);
            if(_this.val() !== ''){
                $('#headimage_show').attr("src",_this.val()).slideDown();
            }
        },function(){
            $('#headimage_show').slideUp();
        });
        
form.val("form1",{
                    'name': '<?php echo ($info["name"]); ?>',
                    'phone': '<?php echo ($info["phone"]); ?>',
                    'birdate': '<?php echo ($info["birdate"]); ?>',
                    'headimage': '<?php echo ($info["headimage"]); ?>',
                    'state': '<?php echo ($info["state"]); ?>'});

        form.on("submit(addData)",function(data){
            let index = layer.msg('数据提交中，请稍候',{icon: 16,time:false});
            $.post("/admin/User/edit",{para:$('form').serialize()},function(res){
                window.parent.window.parent.toast(res.info,res.code);
                layer.close(index);
                if(0 === res.code){
                    parent.layer.closeAll();
                    window.parent.tablist.reload();
                }
            });
            return false;
        });
    });
</script>
</body>
</html>