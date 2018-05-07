<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>城市酒店添加</title>
<%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>
</head>
<body>
	<div id="add_administrator_style" class="add_menber">
		    <form action="<%=basePath %>lasterHotel/insertHotelByHpr" method="post" id="formSceneAdd"  style="margin-left:20%" enctype="multipart/form-data" >
		    	<input type="hidden" name="sgpId" value="${sgpId }">
				<div class="form-group">
					<label class="form-label"><span class="c-red">*</span>酒店名称：</label>
					<div class="formControls">
						<input type="text" class="input-text" value="" placeholder="请输入酒店名称" name="hotelHotelname" style="width:250px;" datatype="*" nullmsg="酒店名称不能为空">
					</div>
					<div class="col-4"> <span class="Validform_checktip" style="color:red">*属于必填</span></div>
				</div>
				<div class="form-group">
					<label class="form-label">酒店地址：</label>
					<div class="formControls">
					<input type="text" placeholder="请输入酒店地址" name="hotelAdress"  value="" style="width:250px;" class="input-text">
					</div>
					<div class="col-4"> <span class="Validform_checktip"></span></div>
				</div>
				<div class="form-group">
					<label class="form-label ">酒店等级：</label>
					<div class="formControls ">
						<span class="select-box">
							<select class="select" name="levelId" style="width:250px;">
								<option>-请选择-</option>
								<c:forEach begin="1" end="5" var="s">
									<option value="${s}">${s}星</option>
								</c:forEach>
							</select>
						</span>
					</div>
					<div class="col-4"> <span class="Validform_checktip"></span></div>
				</div>
				<div class="form-group">
					<label class="form-label">酒店简介：</label>
					<div class="formControls">
						<textarea cols="" rows="" name="hotelMessage" class="textarea" placeholder="酒店简介...300个字符以内" dragonfly="true" style="width:250px;border:1px solid #d5d5d5"></textarea>
						<span class="wordage"><span id="sy"></span></span>
					</div>
					<div class="col-4"> </div>
				</div>
				
				<div class="form-group">x
					<label class="form-label "><span class="c-red">*</span>联系方式：</label>
					<div class="formControls ">
						<input type="text" class="input-text" value="" placeholder="输入联系方式" name="hotelPhone" style="width:250px;" datatype="*" nullmsg="电话不能为空">
					</div>
					<div class="col-4"> <span class="Validform_checktip"></span></div>
				</div>
				<div class="form-group">
					<!-- 待定 -->
					<label class="form-label "><span class="c-red">*</span>酒店图片：</label>
					<div class="formControls ">
						<input type="file" id="imgfile" name="imgfile" onchange="xmTanUploadImg(this)" accept="image/*" />
					</div>
					<div class="col-4"> <span class="Validform_checktip"></span></div>
				</div>
				<!-- 图片预览 -->
				<div class="row cl">
					<label class="form-label"><span class="c-red">*</span>预览：</label>
					<div class="formControls col-xs-8 col-sm-9">
							<div class="row clearfix">
								<div class="col-md-12 column">
									<img id="xmTanImg"  class="round" style="width: 300px; height: 180px;" />
								</div>
							</div>
						<div id="xmTanDiv"></div>
					</div>
				</div>
				<div class="form-group" style="margin-top: 20px">
					<label class="form-label"><span class="c-red">*</span>酒店均价：</label>
					<div class="formControls"> 
						<span class="select-box">
							<select class="select" name="priceId" style="width:250px; height:35px ">
								<option>----请选择----</option>
								<c:forEach items="${listPrice }" var="t">
									<option value="${t.priceId }">${t.pricePrice }</option>
								</c:forEach>
							</select>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label class="form-label"><span class="c-red">*</span>选择类型：</label>
					<div class="formControls"> 
						<span class="select-box">
							<select class="select" name="typeiId" style="width:250px; height:35px ">
								<option>----请选择----</option>
								<c:forEach items="${listType }" var="t">
									<option value="${t.typeiId }">${t.typeName }</option>
								</c:forEach>
							</select>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label class="form-label"><span class="c-red">*</span>选择城市：</label>
					<div class="formControls"> 
						<span class="select-box">
							<select class="select" name="areaIds"  onchange="citychange()" id="shi" style="width:250px; height:35px ">
								<option>----请选择----</option>
								<c:forEach items="${listArea}" var="t">
									<c:if test="${t.areaPid==0}">
										<option value="${t.areaId}">${t.areaName}</option>
									</c:if>
								</c:forEach>
							</select>
						</span>
					</div>
				</div>
				<div> 
				<div class="form-group">
					<label class="form-label"><span class="c-red">*</span>选择区域：</label>
					<div class="formControls"> 
						<span class="select-box">
							<select class="select" name="areaId" id="quyu" style="width:250px; height:35px ">
								<option>----请选择----</option>
								
							</select>
						</span>
					</div>
				</div>
		       <!--  <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;新增&nbsp;&nbsp;" style="margin-left:160px" onclick="sceneAdd()" > -->
		        <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;酒店新增&nbsp;&nbsp;" style="margin-left:160px">
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
	
		//进行表单提交
		function sceneAdd(){
			$.post(
                "<%=basePath %>lastlogin/sceneAddBySgpid",
                $('#formSceneAdd').serialize(),
                function (obj) {
                	alert(JSON.stringify(obj))
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
		 

			function citychange(){
				var areaId = $("#shi").val();
				alert(areaId)
				$.post(
					"<%=basePath%>lasterHotel/toSelectAreaList",
					{"areaId":areaId},
					function(msg){
						$("#quyu").empty();
						for ( var i in msg) {
							$("#quyu").append("<option value='"+msg[i].areaId+"'>"+msg[i].areaName+"</option>")
						}
					},
					"json"
				)
			}
		
    </script>
</html>