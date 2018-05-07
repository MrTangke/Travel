<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/styles/before/common/before_common_css.jsp" %>
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
</head>
<body>
	<form action="<%=basePath%>index/totupain" method="post" enctype="multipart/form-data" id="Form" class="form form-horizontal">
		<input type="hidden" name="touristId" value="${tourists.touristId}">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>原始图片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<img alt="暂无图片" src="<%=basePath %>${tourists.touristImage}" style="width:100px; height:70px;">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">新图片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="file" name="file" id="xdaTanFileImg" onchange="xmTanUploadImg(this)">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"></label>
			<div class="formControls col-xs-8 col-sm-9">
				<img id="xmTanImg"  class="" style="width: 100px; height: 70px;" />
			</div>
		</div>
		<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i>保存并提交</button>
	</form>
</body>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">


  	/* 表单校验 */
	$(function(){
		/* 截取上传文件后缀，只能是图片形式 */
		$("#Form").submit(function(){
			var filePath = $("input[name='file']").val();
			if(filePath!=''){
				var extStart = filePath.lastIndexOf(".");
				var ext = filePath.substring(extStart,filePath.length).toUpperCase();
				if(ext!=".png" && ext!=".PNG" && ext!=".jpg" && ext!=".JPG"){
					layer.alert("必须是图片格式！");
					return false;
				}
			}
		});
		
		$("#Form").Validform({
			tiptype:3, 
			tipSweep:true,
			datatype:{
				"shuzi" :  /^\+?(0|[1-9][0-9]*)$/,
				// 手机号、身份证、邮箱
			}
		});
		
	});
	
	// 关闭窗口
	function closeLayer(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
        return true;
	}
	
	//选择图片，马上预览
	function xmTanUploadImg(obj) {
		var file = obj.files[0];
	
		console.log(obj);
		console.log(file);
		console.log("file.size = " + file.size); //file.size 单位为byte
	
		var reader = new FileReader();
		//读取文件过程方法
				reader.onloadstart = function(e) {
					console.log("开始读取....");
				}
				
				reader.onprogress = function(e) {
					console.log("正在读取中....");
				}
				reader.onabort = function(e) {
					console.log("中断读取....");
				}
				reader.onerror = function(e) {
					console.log("读取异常....");
				}
		reader.onload = function(e) {
			console.log("成功读取....");
	
			var img = document.getElementById("xmTanImg");
			img.src = e.target.result;
			//或者 img.src = this.result;  //e.target == this
		}
	
		reader.readAsDataURL(file)
	}
	

	
  	</script>
</html>