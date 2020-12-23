<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE HTML>
<html style="height: 100%; background: #263238;">
<head>
<title>INSERTFILE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Uibrush Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<link href="/Big_Assignments/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="/Big_Assignments/css/style.css" rel='stylesheet'
	type='text/css' />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="/Big_Assignments/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="/Big_Assignments/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/Big_Assignments/css/set2.css" />
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
body {
	background: #263238;
	font-family: 'Raleway', Arial, sans-serif;
}

section {
	padding: 20px;
	font-size: 150%;
	text-align: center;
}

h2 {
	color: #78909c
}
</style>
<!-- start plugins -->
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
	<div class="header" style="background-color: darkslategray">
		<div class="container">
			<div class="logo">
				<a href="/Big_Assignments/car/index"><img
					src="/Big_Assignments/images/电击篮球修理厂.png" alt=""></a>
			</div>
			<div class="clearfix"></div>
			<!----//End-top-nav---->
		</div>
	</div>
	<div class="about">
		<div class="container">
			<ul class="about_head">
				<li class="about_head-left"><h1>配件使用</h1></li>
				<li class="about_head-right"><p>THIS PAGE IS FOR
						INSERTFITTINGS.</p></li>
			</ul>
		</div>
	</div>
	<br>
	<form action="/Big_Assignments/car/addRecord_part2" method="post" name="table">
		<div class="container" align="center"
			style="border-bottom: 1px solid #CCC">
			<div class="col-md-3 sidebar"
				style="top: 50%; left: 30%; width: 40%;">
				<div>
					<a class="btn btn-primary rippler rippler-default"
						style="border: 2px solid #CCC" onclick="finish();"> 完成</a>
				</div>
				<br>
				<div class="clearfix"></div>
			</div>
		</div>
		<div
			style="border-bottom: 0px solid #CCC; width: 40%; margin-left: auto; margin-right: auto;">
			<font color="#78909c" size="5">点击添加配件☛</font><a
				style="hover: transparent; text-decoration: none; outline: none;"
				href="#" class="clear"><font size="10">🔍</font></a>
		</div>
		<div id="page" align="center" style="visibility:hidden">
		<div id="warehouse"><iframe id="wa" src="/Big_Assignments/parts/search" style="width:70%;height:300px;"></iframe></div>
		</div>
		<br>
		<div id="fittings" align="center">
		<div
					id="def">
					 <input type="hidden" name="useParts[0].partsIDs" value="0"/>
					 <input type="hidden" name="useParts[0].useNumber" value="0"/>
				</div>
		</div>
	</form>
	<script src="/Big_Assignments/js/classie.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var flag = 0;
							$("body")
									.on(
											"click",
											".clear",
											function(e) { //user click on remove text  
												if (flag == 1) {
													document.getElementById("page").style.visibility="hidden";
													document.getElementById("page").style.height=0+"px";
													flag = 0;
												} else {
													document.getElementById("page").style.visibility="visible";
													document.getElementById("page").style.height=300+"px";
													flag = 1;
												}
												return false;
											})

						});
		function finish() {
			var sum = $('#wa').eq(0)[0].contentWindow.FieldCount ;
			var index = $('#wa').eq(0)[0].contentWindow.index ;
			var wrong=new Array();
			for (i = 0; i < sum; i++) {
				if (document.getElementById('useParts['+index[i]+'].useNumber').value == "") {
					document.getElementById('t'+index[i]+'').style.visibility = "visible";
					document.getElementById('t'+index[i]+'').style.height = 5 + "px";
					wrong[i]=1;
				}
				if (document.getElementById('useParts['+index[i]+'].useNumber').value != "") {
					document.getElementById('t'+index[i]+'').style.visibility = "hidden";
					document.getElementById('t'+index[i]+'').style.height = 0 + "px";
					wrong[i]=0;
				}
			}
			if(wrong.includes(1)){
				return;
			}
			else {
				table.submit();
			}
		}
	</script>
</body>
</html>
