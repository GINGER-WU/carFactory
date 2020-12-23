<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Uibrush Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="/Big_Assignments/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="/Big_Assignments/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
</head>
<body background="images/b1.jpg">
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
String str_date1 = formatter.format(currentTime); //将日期时间格式化
String year=str_date1.substring(0,4);//取第0+1位至第4位
%>
<div class="header" style="background-color: darkslategray">
  <div class="container">
	<div class="logo">
		<a href="/Big_Assignments/car/index"><img src="/Big_Assignments/images/电击篮球修理厂.png" alt=""></a>
	</div>
    <div class="menu">
	   <a class="toggleMenu" href="#"><img src="/Big_Assignments/images/menu.png" alt="" /> </a>
	  <form action="/Big_Assignments/car" method="post">
	   <ul class="nav" id="nav">
		 <li class="current"><a href="/Big_Assignments/car/index">首页</a></li>
		 <li><a href="/Big_Assignments/car/carfiles">车辆档案</a></li>
		 <li><a href="/Big_Assignments/parts/Warehouse">配件仓库</a></li>
		 <li><a href="/Big_Assignments/worker/worker">员工管理</a></li>	
		 <li><a href="/Big_Assignments/car/showProfit?year=<%=year%>">利润统计</a></li>							
	  </ul>
	  </form>
	  <script type="text/javascript" src="/Big_Assignments/js/responsive-nav.js"></script>
	</div>							
    <div class="clearfix"> </div>
	<!----//End-top-nav---->
  </div>
</div>
<div class="banner">
		  <div class="banner_container">
       	      <div class="wmuSlider example1">
			     <div class="wmuSliderWrapper">
				   <article style="position: absolute; width: 100%; opacity: 0;"> 
				        <div class="banner_right">
				   	    	<h1>WECLCOME TO<br>FLASH AND BASKETBALL FACTORY.</h1>
				   	    	<h2>OUR SERVICE IS TOP ONE,YOUR CAR IS LIKE GET HOME.</h2>
				   	    </div>
					</article>
				    <article style="position: relative; width: 100%; opacity: 1;"> 
				   	 <div class="banner_right">
				   	 	<h1>High Quality<br>FASTEST FIXING SPEED.</h1>
				   	 	<h2>100%PERFECT WORK,CHOSING US IS YOUR LUCKING.</h2>
				   	 </div>
				   </article>
				 </div>
				 <a class="wmuSliderPrev">Previous</a><a class="wmuSliderNext">Next</a>
	             <script src="/Big_Assignments/js/jquery.wmuSlider.js"></script> 
				  <script>
	       			$('.example1').wmuSlider();         
	   		     </script> 	           	      
              </div>
         </div>
</div> 
<div class="footer">
	<div class="container">
		<div class="col-md-3 box_3" style="margin-left: 0%;">
			<h3>About Us</h3>
			<p>We are the best car factory in the world.We do the best service for your car.Thank you for your coming.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-------Boss Zhang</p>
		</div>
		<div class="col-md-3 box_5">
			<h3>Site Map</h3>
			<div class="footer-list1">
			    <ul>
				    <li><a href="/Big_Assignments/car/index">Home</a></li>
					<li><a href="/Big_Assignments/car/carfiles">Files</a></li>
					<li><a href="/Big_Assignments/parts/Warehouse">Warehouse</a></li>
					<li><a href="/Big_Assignments/worker/worker">Worker</a></li>
					<li><a href="/Big_Assignments/car/showProfit?year=<%=year%>">Statistics</a></li>	
		       </ul>
			</div>
		</div>
	</div>
</div>
<div class="footer_bottom">
	<div class="container">
		<div class="copy">
				<font color="#78909c">点击退出系统☛</font>
				<a
				style="hover: transparent; text-decoration: none; outline: none;"
				href="/Big_Assignments/car/login1"><font size="6">🔒</font></a>
		</div>
		<ul class="footer_social">
		  <li><a href=""> <i class="fb"> </i> </a></li>
		  <li><a href=""><i class="tw"> </i> </a></li>
		  <li><a href=""><i class="instagram"> </i> </a></li>
		  <li><a href=""><i class="linkedin"> </i> </a></li>
		</ul>
	</div>
</div>	
</body>
</html>		