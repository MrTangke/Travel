<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>城市地址添加</title>
<%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>
</head>
<body>
	
	  	<div id="add_administrator_style" class="add_menber">
		    <form action="<%=basePath %>lasterArea/InsertAreaInfo" method="post" id="formSceneAdd"  style="margin-left:20%" >
		    	<input type="hidden" name="sgpId" value="">
				<div class="form-group">
					<label class="form-label"><span class="c-red">*</span>城市：</label>
					<div class="formControls">
						<input type="text" class="input-text" value="" placeholder="请输入城市名称" name="areaNamef" style="width:250px;" datatype="*" nullmsg="景点名称不能为空">
					</div>
					<div class="col-4"> <span class="Validform_checktip" style="color:red">*属于必填</span></div>
				</div>
				<div class="form-group">
					<label class="form-label"><span class="c-red">*</span>地区：</label>
					<div class="formControls">
					<input type="text" placeholder="请输入地区名称" name="areaNamez"  value="" class="input-text" datatype="*" style="width:250px;" nullmsg="售价不能为空">
					</div>
					<div class="col-4"> <span class="Validform_checktip"></span></div>
				</div>
				
		        <!-- <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;新增&nbsp;&nbsp;" style="margin-left:160px" onclick="sceneAdd()" > -->
		        
		       <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;新增&nbsp;&nbsp;" style="margin-left:160px"> 
			</form>
		   </div>
		 </div>
</body>
  <jsp:include page="/styles/lasterTwo/common/laster_common_js.jsp"></jsp:include>
  <script type="text/javascript">		
		
		/* 表单校验 */
		$(function(){
			$("#Form").Validform({
				tiptype:3, 
				tipSweep:true,
				datatype:{
					"num" :  /^\+?(0|[1-9][0-9]*)$/,
				}
			});
		});
	</script>
</html>