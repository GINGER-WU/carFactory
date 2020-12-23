<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Car"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>Modifyfile-1</title>
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
	<% 
	String carID=new String ();
	String userName=new String (); 
	String userPhoneNumber=new String (); 
	String carType=new String (); 
	double carMileage=0.0;
	double laborCost=0.0;
	String str=request.getParameter("recordID"); 
	int id=Integer.parseInt(str);
	Statement stmt=null;
	ResultSet rs=null;
	int j=0;
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/carfactory?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC"; //数据库名
            String username = "root";  //数据库用户名
            String password = "root";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
            stmt=conn.createStatement();
            if(conn != null){  
            	rs=stmt.executeQuery("select * from car where recordID="+id+" ") ; 
            	while(rs.next())
            	{
            	carID=rs.getString("carID");
            	userName=rs.getString("userName");
            	userPhoneNumber=rs.getString("userPhoneNumber");
            	carType=rs.getString("carType");
            	carMileage=rs.getDouble("carMileage");
            	laborCost=rs.getDouble("laborCost");
            	}
           	    }  
        }catch (Exception e) {        
            out.print("数据库连接异常！");  
            e.printStackTrace();
        }
%>
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
				<li class="about_head-left"><h1>修改档案-1</h1></li>
				<li class="about_head-right"><p>THIS PAGE IS FOR
						modifyfile-1.</p></li>
			</ul>
		</div>
	</div>
	<br>
	<div style="display:inline-block;margin-left:19%">
	<button class="btn btn-primary rippler rippler-default"
					style="border: 2px solid #CCC"
					onclick="window.location.href = '/Big_Assignments/car/showBill?recordID=<%=id%>'">
	◀</button>
	</div>
	<form action="/Big_Assignments/car/changeRecord_part1" name="table">
	<input type="hidden" name="recordID" value="<%=id%>">
	<div class="container" align="center"
		style="border-bottom: 1px solid #CCC">
		<div class="col-md-3 sidebar" style="top: 50%; left: 30%; width: 40%;">
			<div>
				<a class="btn btn-primary rippler rippler-default"
					style="border: 2px solid #CCC"
					onclick="next();">
					下一步</a>
			</div>
			<br>
			<div class="clearfix"></div>
		</div>
	</div>
	<br>
	<br>
	<div style="border: 1px solid #CCC; width:30%; margin-left: auto; margin-right: auto;text-align:center">
		<span class="input input--ruri"> 
		<font color="orange" size="5">车牌号</font>
		</span>
		<div id="t1" style="visibility: hidden; height: 0px"><font color="red" size="3">车牌号不能为空</font></div>
		<span class="input input--ruri">
		<input class="input__field input__field--ruri" type="text" id="carID" name="carID" value="<%=carID%>" style="text-align: center;"/>
		<label class="input__label input__label--ruri" for="carID">
				<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
		</span>
		<span class="input input--ruri"> 
		<font color="orange" size="5">客户名称</font>
		</span>
		<div id="t2" style="visibility: hidden; height: 0px"><font color="red" size="3">客户名称不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="userName" name="userName" value="<%=userName%>"  style="text-align: center;"/>
			<label class="input__label input__label--ruri" for="userName">
				<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
		</span>
		<span class="input input--ruri"> 
		<font color="orange" size="5">客户电话</font>
		</span> 
		<div id="t3" style="visibility: hidden; height: 0px"><font color="red" size="3">客户电话不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="userPhoneNumber" name="userPhoneNumber" value="<%=userPhoneNumber%>" style="text-align: center;"/>
			<label class="input__label input__label--ruri" for="userPhoneNumber">
				<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
		</span>
		<span class="input input--ruri"> 
		<font color="orange" size="5">车辆型号</font>
		</span> 
		<div id="t4" style="visibility: hidden; height: 0px"><font color="red" size="3">车辆型号不能为空</font></div> 
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="carType" name="carType" value="<%=carType%>" style="text-align: center;"/>
			<label class="input__label input__label--ruri" for="carType">
				<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
		</span>
		<span class="input input--ruri"> 
		<font color="orange" size="5">里程表数</font>
		</span>
		<div id="t5" style="visibility: hidden; height: 0px"><font color="red" size="3">里程表数不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="carMileage" name="carMileage" value="<%=carMileage%>"  style="text-align: center;"/>
			<label class="input__label input__label--ruri" for="carMileage">
				<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
		</span>
		<span class="input input--ruri"> 
		<font color="orange" size="5">工时费</font>
		</span> 
		<div id="t6" style="visibility: hidden; height: 0px"><font color="red" size="3">工时费不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="laborCost" name="laborCost" value="<%=laborCost%>"  style="text-align: center;"/>
			<label class="input__label input__label--ruri" for="laborCost">
				<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
		</span>
	</div>
	</form>
	<script src="/Big_Assignments/js/classie.js"></script>
	<script>
	function next(){
		var flag=0;
		var flag1=0;
		var flag2=0;
		var flag3=0;
		var flag4=0;
		var flag5=0;
		if(table.carID.value=="")flag=1;
		if(table.userName.value=="")flag1=1;
		if(table.userPhoneNumber.value=="")flag2=1;
		if(table.carType.value=="")flag3=1;
		if(table.carMileage.value=="")flag4=1;
		if(table.laborCost.value=="")flag5=1;
		if(table.carID.value!="")flag=0;
		if(table.userName.value!="")flag1=0;
		if(table.userPhoneNumber.value!="")flag2=0;
		if(table.carType.value!="")flag3=0;
		if(table.carMileage.value!="")flag4=0;
		if(table.laborCost.value!="")flag5=0;
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
		}
		if(flag2==0){
			document.getElementById("t3").style.visibility = "hidden";
			document.getElementById("t3").style.height = 0 + "px";
		}
		if(flag3==1){
			document.getElementById("t4").style.visibility = "visible";
			document.getElementById("t4").style.height = 10 + "px";
		}
		if(flag3==0){
			document.getElementById("t4").style.visibility = "hidden";
			document.getElementById("t4").style.height = 0 + "px";
		}
		if(flag4==1){
			document.getElementById("t5").style.visibility = "visible";
			document.getElementById("t5").style.height = 10 + "px";
		}
		if(flag4==0){
			document.getElementById("t5").style.visibility = "hidden";
			document.getElementById("t5").style.height = 0 + "px";
		}
		if(flag5==1){
			document.getElementById("t6").style.visibility = "visible";
			document.getElementById("t6").style.height = 10 + "px";
		}
		if(flag5==0){
			document.getElementById("t6").style.visibility = "hidden";
			document.getElementById("t6").style.height = 0 + "px";
		}
		if(flag==0&&flag1==0&&flag2==0&&flag3==0&&flag4==0&&flag5==0){
			table.submit();
		}
	}
	</script>
</body>
</html>
