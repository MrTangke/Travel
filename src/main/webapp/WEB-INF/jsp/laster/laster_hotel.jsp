<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>酒店列表</title>
<%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>
<style type="text/css">
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
		        <a href="javascript:ovid()" onclick="member_show('添加该城市酒店','<%=basePath %>lasterHotel/toHotelInsert','800','800')" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加酒店</a>
		        <a href="javascript:ovid()" onclick="deleteHotelAll()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
		       </span>
		       <span class="r_f">共<b>${fn:length(list) }</b>个景点记录</span>
		     </div>
		     <!---->
		     <div class="table_menu_list">
		       <table class="table table-striped table-bordered table-hover" id="sample-table">
				<thead>
				 <tr>
						<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
						<th width="50">ID</th>
						<th width="150">酒店名称</th>
						<th width="75">所属区域</th>
						<th width="180">酒店地址</th>
						<th width="80">酒店等级</th>
						<th width="100">销量</th>
						<th width="250">酒店简介</th>
						<th width="100">联系方式</th>
						<th width="150">酒店图片</th>
						<th width="110">操作</th>
					</tr>
				</thead>
			<tbody>
				
		       <c:forEach items="${list }" var="s" varStatus="sg">
		       	   <tr style="height:100px">
			          <td><label><input type="checkbox" class="ace" value="${s.hotelId}"><span class="lbl"></span></label></td>
		       	   	  <td>${sg.count }</td>
			          <td><u style="cursor:pointer" class="text-primary" onclick="member_show('${s.hotelHotelname }','member-show.html','1031','500','400')">${s.hotelHotelname }</u></td>
			          <td>
				          <c:forEach items="${listArea }" var="a">
				          	<c:if test="${s.areaId==a.areaId }">
				          		${a.areaName}
				          	</c:if>
				          </c:forEach>
			          </td>
			          <td>${s.hotelAdress }</td>
					  <td>
			          	<c:forEach begin="1" end="${s.levelId }" step="1">
			          		<img style="width:12px" alt="" src="<%=basePath %>upload/imgs/xingxing/xingxing.png">
			          	</c:forEach>
			          </td>
			          <td>${s.hotelNum}</td>
			          <td>
			          	<center class="htmer">&nbsp;&nbsp;
			          	${s.hotelMessage}</center>
			          </td> 
			          <td>${s.hotelPhone }</td>
			          <td>
						<img alt="Logo" style="width: 120px; height: 120px" src="<%=basePath%>${s.hotelLogo}">			          
			          </td>
			           <!-- <td class="td-status"><span class="label label-success radius">已启用</span></td> -->
			          <td class="td-manage">
			         	 <a title="编辑" onclick="member_edit('修改酒店','<%=basePath %>lasterHotel/toUpdateByHotel','${s.hotelId}','800','800')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
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
	function member_edit(title,url,hotelId,w,h){
		layer_show(title,url+'?hotelId='+hotelId,w,h);
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
		var ids = "";
		$(":checkbox:checked").each(function(){
			ids += ","+$(this).val(); 
		})
		ids = ids.substring(1);
		layer.confirm('确认要删除吗？',function(index){
			$.post(
				"<%=basePath%>lasterHotel/deleteHotelAndHotelPriceRel",
				{"ids":ids},
				function(msg){
					if(msg>0){
						layer.msg('已删除!',{icon:1,time:1000});
						location.href="<%=basePath%>lasterHotel/selectHotelList"
					}else{
						layer.msg("删除失败！",{icon:1,time:1000});
					}
				},
				"json"
			)
		});
	}
	
	</script>
</html>