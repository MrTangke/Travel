<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>景点表格导入</title>
<%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>
</head>
<body>
<div id="add_administrator_style" class="add_menber">
		    <form method="post"  style="margin-left:4%" enctype="multipart/form-data" >
		    	
				<div class="form-group">
					<label class="form-label"><span class="c-red">*</span>导入文件：</label>
					<div class="formControls">
						<input type="file" class="input-text" placeholder="请选择excel文件" id="excelfile" name="excelfile" style="width:250px;">
					</div>
					<input type="hidden" name="sgpId" value="${areaId }"> 
					
					请下载<a href="javascript:void(0)" onclick="downloadexcel()" style="color:#3486e3">模板</a>
				</div>
				
		        <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;导入Excel文件&nbsp;&nbsp;" style="margin-left:160px" onclick="sceneAdd()" >
		        <!-- <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;导入Excel文件&nbsp;&nbsp;" style="margin-left:160px"> -->
			</form>
		   </div>
		 </div>
</body>
<jsp:include page="/styles/lasterTwo/common/laster_common_js.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>>styles/js/ajaxfileupload.js" ></script>
	
<script type="text/javascript">		
		
		//进行表单提交
		function sceneAdd(){
			var excelfile = $("[name=\"excelfile\"]").val();
	 		var sgpId = $("[name=\"sgpId\"]").val(); 
			
	 		 var sufexcel = excelfile.substring(excelfile.lastIndexOf("."));
	 		 //alert(sufexcel);
	 		 
	 		 if(sufexcel == ".xls" || sufexcel == ".XLS" || sufexcel == ".xlsx" || sufexcel == ".XLSX"){
	 			$.ajaxFileUpload({  
	 	             url:'<%=basePath %>lastlogin/SceneImportExcel', //你处理上传文件的服务端  
	 	             type:'post', 
	 	             secureuri:false,//是否启用安全机制  
	 	             fileElementId:'excelfile',//file的id  
	 	             dataType: 'application/json',//返回的类型  
	 	             success: function (data) {//调用成功时怎么处理  
	 	                 if(data.msg != "1"){
	 	                	 alert("上传成功");  
	 	                	 //上传excel中的数据至数据库   然后进行刷新列表页面 
	 	                     window.parent.location.href = "<%=basePath %>lastlogin/toSceneBySceneId?sgpId="+sgpId;
	 	                 }else{
	 	                	 alert("上传失败");  
	 	                 }
	 	             }  
	 	         }); 
	 			 
	 		 }else{
	 			 alert("请找到.xsl文件或.xslx文件！");
	 		 }
		}
		
		// 下载模板
		function downloadexcel(){
			location.href="<%=basePath %>lastlogin/downloadexcel";
		}

		// 关闭窗口
		function closeLayer(){
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        parent.layer.close(index);
	        return true;
		}

		
    </script>
</html>