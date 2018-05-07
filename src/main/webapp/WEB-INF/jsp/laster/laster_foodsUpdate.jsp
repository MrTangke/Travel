<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>美食修改页面</title>
<%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>
</head>
<body>
<div id="add_administrator_style" class="add_menber">
		    <form action="<%=basePath %>lastercate/updateFood" method="post" id="formSceneAdd"  style="margin-left:20%" enctype="multipart/form-data" >
		    	<input type="hidden" name="foodId" value="${food.foodId}"> 
		    	<div class="form-group" style="margin-top: 35px">
					<label class="form-label"><span class="c-red">*</span>选择店铺：</label>
					<div class="formControls"> 
						<span class="select-box">
							<select class="select" name="cateId" disabled="disabled"  onchange="citychange()" id="shi" style="width:250px; height:35px ">
								<option>----请选择----</option>
								<c:forEach items="${list}" var="t">
										<option value="${t.cateId}">${t.cateShopname}</option>
								</c:forEach>
							</select>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label class="form-label"><span class="c-red">*</span>美食名称：</label>
					<div class="formControls">
						<input type="text" class="input-text" value="${food.foodName }" placeholder="请输入美食名称" name="foodName" style="width:250px;" datatype="*" nullmsg="美食名称不能为空">
					</div>
					<div class="col-4"> <span class="Validform_checktip" style="color:red">*属于必填</span></div>
				</div>
				<div class="form-group">
					<label class="form-label">美食价格：</label>
					<div class="formControls">
					<input type="text" placeholder="请输入美食价格" name="foodPrice"  value="${food.foodPrice }" style="width:250px;" class="input-text">
					</div>
					<div class="col-4"> <span class="Validform_checktip"></span></div>
				</div>
			
				<div class="form-group">
					<label class="form-label">美食简介：</label>
					<div class="formControls">
						<textarea cols="" rows="" name="foodMessage" class="textarea" placeholder="美食简介...300个字符以内" dragonfly="true" style="width:250px;border:1px solid #d5d5d5">${food.foodMessage }</textarea>
						<span class="wordage"><span id="sy"></span></span>
					</div>
					<div class="col-4"> </div>
				</div>
				
		       <!--  <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;新增&nbsp;&nbsp;" style="margin-left:160px" onclick="sceneAdd()" > -->
		        <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;美食修改&nbsp;&nbsp;" style="margin-left:160px">
			</form>
		   </div>
		 </div>
</body>
<jsp:include page="/styles/lasterTwo/common/laster_common_js.jsp"></jsp:include>	
<script type="text/javascript">		
		
		$(function(){
			var cateid = ${cate.cateId}
			$("#shi").val(cateid);
		})
		
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
	
		//进行表单提交
		function sceneAdd(){
			$.post(
                "<%=basePath %>lastlogin/sceneAddBySgpid",
                $('#formSceneAdd').serialize(),
                function (obj) {
                	//alert(JSON.stringify(obj))
                    if ('1' == obj) {
                        alert("SUCCESS");
                        location.href= "<%=basePath%>lastlogin/tocloseLayer?sgpId=${sgpId }" ;
                    }
                },
                "json"
            )
		}

		// 关闭窗口
		function closeLayer(){
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        parent.layer.close(index);
	        return true;
		}

		
    </script>
</html>