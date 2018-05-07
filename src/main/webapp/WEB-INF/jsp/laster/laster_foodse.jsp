<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家美食表</title>
<%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>
<<style type="text/css">
	.htmer{  
		height: 66px;  			   /* 高度截取多少 */
		overflow: auto;  		   /* 侧标滑动条 */
		/* overflow: hidden; */    /* 隐藏 */
	}  
</style>
</head>
<body>
	<div class="page-content clearfix">
		    <div id="Member_Ratings">
		      <div class="d_Confirm_Order_style">
		    
		     <!---->
		     <div class="border clearfix">
		       <span class="l_f">
		       	<c:if test="${sessionScope.cateGroup != null}">
		        <a href="javascript:ovid()" onclick="member_show('添加该城市美食','<%=basePath %>lastercate/toFoodInsert','600','600')" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加美食</a>
		        </c:if>
		        <a href="javascript:ovid()" onclick="deleteHotelAll()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
		       </span>
		       <span class="r_f">共<b>${fn:length(list) }</b>个美食记录</span>
		     </div>
		     <span class=""><b>选择地区：</b>
		       <span class="select-box">
					<select class="select" name="areaIds"  onchange="citychange()" id="shi" style="width:250px; height:35px ">
						<option>----请选择城市----</option>
						<c:forEach items="${listArea}" var="t">
							<c:if test="${t.areaPid==0}">
								<option value="${t.areaId}">${t.areaName}</option>
							</c:if>
						</c:forEach>
					</select>
				</span>
				<span class="select-box">
					<select class="select" name="areaId" onchange="regionchange()" id="quyu" style="width:250px; height:35px ">
						
					</select>
				</span>
			</span>
		     <!---->
		     <div class="table_menu_list" style="margin-top:30px">
		       <table class="table table-striped table-bordered table-hover" id="sample-table">
				<thead>
				 <tr>
						<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
						<th width="50">ID</th>
						<th width="150">美食店铺</th>
						<th width="180">美食名称</th>
						<th width="80">美食价格</th>
						<th width="250">美食简介</th>
						<th width="110">操作</th>
					</tr>
				</thead>
			<tbody>
				
		       <c:forEach items="${list }" var="s" varStatus="sg">
		       	   <tr style="height:100px">
			          <td><label><input type="checkbox" class="ace" value="${s.foodId}"><span class="lbl"></span></label></td>
		       	   	  <td>${sg.count }</td>
			          <td><u style="cursor:pointer" class="text-primary" onclick="member_show('${s.cateShopname }','member-show.html','1031','500','400')">${s.cateShopname }</u></td>
			        
			          <td>${s.foodName }</td>
			          <td>${s.foodPrice}</td>
			          <td>
			          	<center class="htmer">&nbsp;&nbsp;
			          	${s.foodMessage}</center>
			          </td> 
			         
			           <!-- <td class="td-status"><span class="label label-success radius">已启用</span></td> -->
			          <td class="td-manage">
			             <input type="hidden" id="cgpId" value="${sessionScope.cateGroup.cgpId}"/>
			         	 <a title="编辑" onclick="member_edit('修改店铺','<%=basePath %>lastercate/toUpdateByFood','${s.foodId}','800','800')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
			          	<!--  <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a> -->
			          </td>
					</tr>
		       </c:forEach>
		        
		      </tbody>
			</table>
		   </div>
		  </div>
		 </div>
		</div>
</body>
<jsp:include page="/styles/lasterTwo/common/laster_common_js.jsp"></jsp:include>	
<script>
$(function(){
	var areaPid = ${area.areaPid};
	var areaid = ${area.areaId};
	//alert(areaPid+areaid);
   $.post(
    		"<%=basePath%>lastercate/selectFoodByAreaEcho",
			{"areaId":areaid,"areaPid":areaPid},
			function(msg){
				alert(JSON.stringify(msg));
				$("#quyu").append("<option value='"+msg.area.areaId+"'>"+msg.area.areaName+"</option>");
				$("#shi").val(msg.area.areaPid);
			},
			"json"	
    )
})
	jQuery(function($) {
			var oTable1 = $('#sample-table').dataTable( {
			"aaSorting": [[ 1, "desc" ]],//默认第几个排序
			"bStateSave": true,//状态保存
			"aoColumnDefs": [
			  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			  {"orderable":false,"aTargets":[0,2,4,6,7,8,9]}// 制定列不参与排序
			 ],
			 "aLengthMenu" : [ 5, 10, 15 ] , //更改显示记录数选项
			} );
					$('table th input:checkbox').on('click' , function(){
						var that = this;
						$(this).closest('table').find('tr > td:first-child input:checkbox')
						.each(function(){
							this.checked = that.checked;
							$(this).closest('tr').toggleClass('selected');
						});
							
					});
				
				
					$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
					function tooltip_placement(context, source) {
						var $source = $(source);
						var $parent = $source.closest('table')
						var off1 = $parent.offset();
						var w1 = $parent.width();
				
						var off2 = $source.offset();
						var w2 = $source.width();
				
						if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
						return 'left';
					}
				})
	
	/*添加*/
	function member_show(title,url,w,h){
		layer_show(title,url,w,h);
	}
	
	/*品牌-编辑*/
	function member_edit(title,url,foodId,w,h){
		layer_show(title,url+'?foodId='+foodId,w,h);
	}
	
	/*用户-删除*/
	function member_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			$(obj).parents("tr").remove();
			layer.msg('已删除!',{icon:1,time:1000});
		});
	}
	laydate({
	    elem: '#start',
	    event: 'focus' 
	});
	
	function deleteHotelAll(){
		var cgpId = $("#cgpId").val();
		var ids = "";
		$(":checkbox:checked").each(function(){
			ids += ","+$(this).val(); 
		})
		ids = ids.substring(1);
		layer.confirm('确认要删除吗？',function(index){
			$.post(
				"<%=basePath%>lastercate/deleteFood",
				{"ids":ids},
				function(msg){
					if(msg>0){
						layer.msg('已删除!',{icon:1,time:1000});
						if(cgpId != null){
							location.href = "<%=basePath%>lastercate/selectFoodByGroup?cgpId="+cgpId;							
						}else{
						location.href="<%=basePath%>lastercate/selectCateFoodList"
						}
					}else{
						layer.msg("删除失败！",{icon:1,time:1000});
					}
				},
				"json"
			)
		});
	}
	
	//二级联动
	function citychange(){
		var areaId = $("#shi").val();
		var areaIds = $("#quyu").val();
		//alert(areaId+"---"+areaIds)
		$.post(
			"<%=basePath%>lasterHotel/toSelectAreaList",
			{"areaId":areaId},
			function(msg){
				$("#quyu").empty();
				for ( var i in msg) {
					$("#quyu").append("<option value='"+msg[i].areaId+"'>"+msg[i].areaName+"</option>");
				}
			},
			"json"
		)
	}
	
	
	function regionchange(){
		var areaPid = $("#shi").val();
		var areaid = $("#quyu").val();
	    //alert("areaid的值是"+areaPid+","+areaid);
		location.href = "<%=basePath%>lastercate/selectFoodByAreaId?areaPid="+areaPid+"&areaId="+areaid;
	    
	}
	
	</script>
</html>