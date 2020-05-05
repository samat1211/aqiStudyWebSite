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
    		.historyDate ul{
    			width:800px;
    			display:inline-block;
    		}
    		.historyDate li{
    			width: 100px;
				float: left;
				display: inline-block;
    		}
    		
		</style>
		<script language="javascript" type="text/javascript">
			function color(){
				var table=document.getElementById("currentAqi");
				var len=table.rows.length;
				var _row=table.rows;
				for(var i=0;i<len;i++){
					var _cell=_row[i].cells;
					var aqi=_cell[0].innerHTML;
					if(aqi<=50){
						table.rows[i].cells[1].style.color="#32F43E";
					}else if(aqi>=51&&aqi<=100){
						table.rows[i].cells[1].style.color="#E4F33E";
					}else if(aqi>=101&&aqi<=150){
						table.rows[i].cells[1].style.color="#E4993E";
					}else if(aqi>=151&&aqi<=200){
						table.rows[i].cells[1].style.color="#F10617";
					}else if(aqi>=201&&aqi<=300){
						table.rows[i].cells[1].style.color="#99074E";
					}else if(aqi>300){
						table.rows[i].cells[1].style.color="#860022";
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
				<h2 align="center">${city_cn}空气质量AQI</h2>
				<table class="table table-striped table-bordered table-hover" id="currentAqi">
     				<tbody>
     				<tr>
						<td colspan="8" style="text-align:center;color:red">今日空气质量AQI报告</td>
					</tr>
                	<tr style="background-color:lightgoldenrodyellow">
                    	<th width="12.5%">AQI指数</th>
                    	<th width="12.5%">质量等级</th>
                    	<th width="12.5%">PM2.5/1h</th>
                    	<th width="12.5%">PM101/h</th>
                    	<th width="12.5%">SO2/1h</th>
                    	<th width="12.5%">NO2/1h</th>
                    	<th width="12.5%">CO/1h</th>
                    	<th width="12.5%">O3/1h</th>
                	</tr>
         			<c:forEach var="a" items="${alist}" varStatus="status">
						<tr>
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
  					数据更新时间：${updateDate}
  				</div>
  				<div id="right">
  					数值单位：μg/m3(CO为mg/m3)
  				</div>
  			</div>
  			
  			<div id="AqiDetail" style="width: 100%;height:400px;margin-top:100px;"></div>
  			<script language="javascript" type="text/javascript">
  				var myChart=echarts.init(document.getElementById('AqiDetail'));
  				
				var option={
					title:{
						left:'center',
						text:'各污染物占比'
					},
					//tooltip:{},
					legeng:{
						data:['μg/m3']
					},
        			series: [{
            			name: '污染物占比',
            			radius: '70%',
            			type: 'pie',
            			label:{
            				normal:{
            					formatter:'{b}({d}%)',
            					textStyle:{
            						fontWeight:'normal',
            						fontSize:15
            					}
            				}
            			},
            			data: [
            				{value:${alist.get(0).getPm25()},name:'PM2.5'},
            				{value:${alist.get(0).getPm10()},name:'PM10'},
            				{value:${alist.get(0).getSo2()},name:'SO2'},
            				{value:${alist.get(0).getNo2()},name:'NO2'},
            				{value:${Math.round(alist.get(0).getCo()*1000)},name:'CO'},
            				{value:${alist.get(0).getO3()},name:'O3'}
            			]
        			}]
				};
				myChart.setOption(option);
  			</script>
  			
  			<div id="historyAqi" style="width: 100%;height:400px;"></div>
  			<script language="javascript" type="text/javascript">
  				var historyAqi=echarts.init(document.getElementById('historyAqi'));
  				var option={
  					title: {
  						left:'center',
  			        	text: '历史AQI数据'
  			        },
  			      	tooltip: {},
  			        legend: {
  			        	left:'left',
  	                	data:['AQI指数']
  	                },
					xAxis: {
						type:'category',
  	                	data: [
  	                		<c:forEach items="${allDate}" var="e">
  	                		["${e.date}"],
  	                		</c:forEach>	
  	                	]
    				},
    				yAxis: {},
    				dataZoom: [{   // 这个dataZoom组件，默认控制x轴。
            			type: 'slider', // 这个 dataZoom 组件是 slider 型 dataZoom 组件
            			start: 0,      // 左边在 10% 的位置。
            			end: 40         // 右边在 60% 的位置。
            		}],
    				series: [{
    					name:'AQI',
        				data: ${historyAqi},
        				type: 'line',
        				smooth:true
    				}]
				};
				historyAqi.setOption(option);
  			</script>
  			
  			<div style="width: 100%;height:400px; text-align:center; margin-top:50px;" class="historyDate">
  				<h5>${city_cn}其他月份PM2.5查询</h5>
  				<ul>
  					<c:forEach var="i" begin="1" end="${allMonth.size()}">
   						<li>
   							<a href="QueryCityHistoryAqi?city=${city}&date=${allMonth.get(i-1).getDate()}">${allMonth.get(i-1).getDate()}</a>
   						</li>								
   					</c:forEach>
  				</ul>
  			</div>
  			
		</div>
	</body>
</html>