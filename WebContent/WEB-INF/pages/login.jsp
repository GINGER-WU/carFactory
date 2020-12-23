<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html lang="zh" style="background-color: #263238">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">

<title>login</title>
<!-- <link rel="stylesheet" type="text/css" href="css/normalize.css" /> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
<style type="text/css">
html, body {
	height: 100%;
}

html {
	display: table;
	margin: auto;
}

body {
	display: table-cell;
	vertical-align: middle;
	color: #404d5b;
}

.margin {
	margin: 0 !important;
}

.card-panel {
	min-width: 350px;
}
</style>
<!--[if IE]>
		<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body style="background-color: #263238;">
	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form name="table" class="login-form"
				action="/Big_Assignments/car/login" method="post">
				<div class="row margin">
					<div class="input-field col s12" id="tip">
						<i class="mdi-social-person-outline prefix"></i> <input
							class="validate" name="Account" id="Account" type="text">
						<label for="Account" class="center-align">Account</label>
						<div id="t1" style="visibility: hidden; height: 0px">
							<font color="red" size="2">用户名不能为空</font>
						</div>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12" id="tip1">
						<i class="mdi-action-lock-outline prefix"></i> <input
							id="Password" name="Password" type="password"> <label
							for="password" class="center-align">Password</label>
						<div id="t2" style="visibility: hidden; height: 0px">
							<font id="t2" color="red" size="2">密码不能为空</font>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<a onclick="clicklogin();"
							class="btn waves-effect waves-light col s12">login</a>
					</div>
					<div id="t3" style="visibility: hidden; height: 0px;">
							<font id="t2" color="red" size="2">账号或密码错误</font>
						</div>
				</div>

			</form>
		</div>
	</div>
	<script>
	var flag=0;
	var flag1=0;
	var flag2=0;
		function clicklogin() {
			if (table.Account.value == "") {
				flag=1;
			}
			if (table.Password.value == "") {
				flag1=1;
			}
			if (table.Account.value != "") {
				flag=0;
			}
			if (table.Password.value != "") {
				flag1=0;
			}
			if (table.Password.value == "admin"&&table.Account.value == "admin") {
				flag=0;
				flag1=0;
				flag2=0;
			}
			if(table.Account.value != ""&&table.Password.value != ""&&table.Account.value != "admin"&&table.Password.value != "admin"){
				flag2=1;
				flag=0;
				flag1=0;
			}
			if(flag==1){
				document.getElementById("t1").style.visibility = "visible";
				document.getElementById("t1").style.height = 10 + "px";
			}
			if(flag==0){
				document.getElementById("t1").style.visibility = "hidden";
				document.getElementById("t1").style.height = 0 + "px";
			}
			if(flag1==1){
				document.getElementById("t2").style.visibility = "visible";
				document.getElementById("t2").style.height = 10 + "px";
			}
			if(flag1==0){
				document.getElementById("t2").style.visibility = "hidden";
				document.getElementById("t2").style.height = 0 + "px";
			}
			if(flag2==1){
				document.getElementById("t3").style.visibility = "visible";
				document.getElementById("t3").style.height = 10 + "px";
				document.getElementById("t3").style.textAlign="center";
			}
			if(flag2==0){
				document.getElementById("t3").style.visibility = "hidden";
				document.getElementById("t3").style.height = 0 + "px";
			}
			if(flag==0&&flag1==0&&flag2==0) table.submit();
		}
	</script>
	<script type="text/javascript"
		src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>

	<!--materialize js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
</body>
</html>