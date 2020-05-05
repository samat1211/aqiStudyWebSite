<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.ArrayList,entity.*,Dao.AqiDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
		<title>当前AQI</title>
		<style>
			#main-page{
    			width:900px;
    			height:1000px;
    		}
    		.table th,td{
    			text-align: center;
    		}
    		#left{
    			text-align: left;
    			width:50%;
    			float:left
    		}
    		#right{
    			text-align: right;
    			width:50%;
    			float:left
    		}
		</style>
		
		<script language="javascript" type="text/javascript">
			function color(){
				var table=document.getElementById("historyAqi");
				var len=table.rows.length;
				var _row=table.rows;
				for(var i=0;i<len;i++){
					var _cell=_row[i].cells;
					var aqi=_cell[1].innerHTML;
					if(aqi<=50){
						table.rows[i].cells[2].style.color="#32F43E";
					}else if(aqi>=51&&aqi<=100){
						table.rows[i].cells[2].style.color="#E4F33E";
					}else if(aqi>=101&&aqi<=150){
						table.rows[i].cells[2].style.color="#E4993E";
					}else if(aqi>=151&&aqi<=200){
						table.rows[i].cells[2].style.color="#F10617";
					}else if(aqi>=201&&aqi<=300){
						table.rows[i].cells[2].style.color="#99074E";
					}else if(aqi>300){
						table.rows[i].cells[2].style.color="#860022";
					}
				}
			}
		</script>
	</head>
	<body onload="color()">
		<div>
			<nav class="navbar navbar-expand-sm bg-info navbar-dark">
				<img src="img/001.png" width="80">
  				<a class="navbar-brand" href="#"><h3 class="font-weight-bold">AQI信息服务平台</h3></a>
  				<ul class="navbar-nav">
    				<li class="nav-item active">
      					<a class="nav-link" style="font-size: 22px;" href="index.jsp">首页</a>
    				</li>
    				<li class="nav-item active">
      					<a class="nav-link" style="font-size: 22px;" href="#">数据查询</a>
    				</li>
    				<li class="nav-item active">
      					<a class="nav-link" style="font-size: 22px;" href="#">数据分析</a>
    				</li>
  				</ul>
			</nav>
		</div>
		
		<div id="main-page" class="mx-auto" style="margin-top: 15px;">
			<div>
				<h2 align="center">${city_cn}空气质量指数AQI_PM2.5历史数据</h2>
				<table class="table table-striped table-bordered table-hover" id="historyAqi">
     				<tbody>
                	<tr style="background-color:lightgoldenrodyellow">
                		<th width="12%">日期</th>
                    	<th width="11%">AQI指数</th>
                    	<th width="11%">质量等级</th>
                    	<th width="11%">PM2.5/1h</th>
                    	<th width="11%">PM101/h</th>
                    	<th width="11%">SO2/1h</th>
                    	<th width="11%">NO2/1h</th>
                    	<th width="11%">CO/1h</th>
                    	<th width="10%">O3/1h</th>
                	</tr>
         			<c:forEach var="a" items="${historyAqi}" varStatus="status">
						<tr>
							<td>${a.date}</td>
             				<td>${a.aqi}</td>
             				<td>${a.level}</td>
             				<td>${a.pm25}</td>
             				<td>${a.pm10}</td>
             				<td>${a.so2}</td>
             				<td>${a.no2}</td>
             				<td>${a.co}</td>
             				<td>${a.o3}</td>
     					</tr>
     				</c:forEach>
     				</tbody>
  				</table>
			</div>

  			<div>
  				<div id="left">
  					数值单位：μg/m3(CO为mg/m3)
  				</div>
  			</div>
  			
		</div>
	</body>
</html>