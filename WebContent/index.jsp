<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<title>AQI信息服务平台</title>
		<style>
			#main-page{
    			width:900px;
    			height:1000px;
    		}
    		.aqi-lv1{color: #32F43E;}
    		.aqi-lv2{color: #E4F33E;}
    		.aqi-lv3{color: #E4993E;}
    		.aqi-lv4{color: #F10617;}
    		.aqi-lv5{color: #99074E;}
    		.aqi-lv6{color: #860022;}
		</style>
	</head>
	<body>
		<div>
			<nav class="navbar navbar-expand-sm bg-info navbar-dark">
				<img src="./img/001.png" width="80">
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
			<h1 align="center">空气质量指数(AQI)查询</h1>
			<div align="center" style=" width:750px;border:2px solid black" class="mx-auto">
				<dl>
					<dt>
						<b style="color:red">热门城市</b>
					</dt>
					<dd>
						<a href="QueryCityAqi?city=shanghai">上海</a>
						<a href="QueryCityAqi?city=nanjing">南京</a>
						<a href="QueryCityAqi?city=nantong">南通</a>
						<a href="QueryCityAqi?city=hangzhou">杭州</a>
					</dd>
				</dl>
			</div>
			<div style="margin-top: 20px; width:750px;border:2px solid black" class="mx-auto">
				<h4 align="center" style="background-color:aquamarine ;">天气常识</h4>
				<b>PM2.5</b>
				：指环境空气中空气动力学当量直径小于等于 2.5 μm （微米）的颗粒物，也称细颗粒物、细粒、细颗粒。
				这个值越高，就代表空气污染越严重。
				<br>
				<b>AQI</b>
				：空气质量指数（Air Quality Index）是定量描述空气质量状况的指数，其数值越大说明空气污染状况
				越严重，对人体健康的危害也就越大。
				<br>
				<b>空气质量标准等级</b>
				：
				<table width="100%" border="1" cellpadding="1" cellspacing="1">
					<thead>
						<tr>
							<th>AQI指数</th>
							<th>等级(描述)</th>
							<th>温馨提示</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>0-50</td>
							<td>
								"一级"
								<em class="aqi-lv1">优</em>
							</td>
							<td>可多参加户外活动呼吸新鲜空气</td>
						</tr>
						<tr>
							<td>51-100</td>
							<td>
								"二级"
								<em class="aqi-lv2">良</em>
							</td>
							<td>除少数对某些污染物特别容易过敏的人群外，其他人群可以正常进行室外活动。</td>	
						</tr>
						<tr>
							<td>101-150</td>
							<td>
								"三级"
								<em class="aqi-lv3">轻度污染</em>
							</td>
							<td>敏感人群需减少体力消耗较大的户外活动</td>	
						</tr>
						<tr>
							<td>151-200</td>
							<td>
								"四级"
								<em class="aqi-lv4">中度污染</em>
							</td>
							<td>敏感人群应尽量减少外出，一般人群适当减少户外运动</td>	
						</tr>
						<tr>
							<td>201-300</td>
							<td>
								"五级"
								<em class="aqi-lv5">重度污染</em>
							</td>
							<td>敏感人群应停止户外活动，一般人群尽量减少户外运动</td>	
						</tr>
						<tr>
							<td>>300</td>
							<td>
								"六级"
								<em class="aqi-lv6">严重污染</em>
							</td>
							<td>除有特殊需要的人群外，尽量不要留在室外</td>	
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>