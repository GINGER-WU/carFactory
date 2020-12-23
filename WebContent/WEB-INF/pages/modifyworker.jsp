<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Car"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>Modify worker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Uibrush Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="/Big_Assignments/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="/Big_Assignments/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/Big_Assignments/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/Big_Assignments/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/Big_Assignments/css/set2.css" />
<link href='/Big_Assignments/css/demo/4fc55ad7dfca484f9418ba597fd6a006.css' rel='stylesheet' type='text/css'>
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
		body{ background:#263238; font-family:'Raleway', Arial, sans-serif;}
		section{ padding:20px; font-size:150%; text-align:center;}
    	h3{ color:#78909c}
		th{color: orange;text-align: center;}
		input{background-color: transparent}
</style>
</head>
<body>
<% 
	String workerName=new String (); 
    String workerPhoneNumber=new String (); 
	String str=request.getParameter("workerID"); 
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
            	rs=stmt.executeQuery("select * from worker where workerID="+id+" ") ; 
            	while(rs.next())
            	{
            	workerName=rs.getString("workerName");
            	workerPhoneNumber=rs.getString("workerPhoneNumber");
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
		<a href="/Big_Assignments/car/index"><img src="/Big_Assignments/images/电击篮球修理厂.png" alt=""></a>
	</div>						
    <div class="clearfix"> </div>
	<!----//End-top-nav---->
  </div>
</div>
<div class="about">
	<div class="container">
		<ul class="about_head">
			<li class="about_head-left"><h1>修改员工信息</h1></li>
			<li class="about_head-right"><p>THIS PAGE IS FOR MODIFY WORKER.</p></li>
		</ul>	
	</div>	  
</div> 
<div style="display:inline-block;margin-left:19%">
	<button class="btn btn-primary rippler rippler-default"
					style="border: 2px solid #CCC"
					onclick="window.location.href = '/Big_Assignments/worker/worker'">
	◀</button>
	</div>
<form action="/Big_Assignments/worker/changeWorker" name="table"> 
<input type="hidden" name="workerID" value="<%=id%>">
<div class="container" align="center" style="border-bottom:1px solid #CCC">
   	<div class="col-md-3 sidebar" style="top: 50%;left: 30%;width: 40%;" >
   	   <div>
		<a class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC" onclick="finish();">
		完成
		</a>
   	  </div>
	  <br>
   	<div class="clearfix"> </div>
   </div>
</div>
	<br>
<div class="container" style="border:1px solid #CCC;margin-left: auto;margin-right: auto;"align="center">
	<br>
	<table border="1px" style="border:1px solid #CCC;color: white;text-align: center;width: 40%;">
		<tr>
			<th style="width: 20%;">
				工号
			</th>
			<th style="width: 40%;">
				姓名
				<br>
				<div id="t1" style="visibility: hidden; height: 0px"><font color="red" size="3">姓名不能为空</font></div>
			</th>
			<th style="width: 40%;">
				电话
				<br>
				<div id="t2" style="visibility: hidden; height: 0px"><font color="red" size="3">电话不能为空</font></div>
			</th>
		</tr>
		<tr>
			<td>
				<%=id%>
			</td>
			<td>
				<input type="text" name="workerName" value="<%=workerName%>"  style="text-align: center;width:100%;background-color: yellow;color:black;" />
			</td>
			<td>
				<input type="text" name="workerPhoneNumber" value="<%=workerPhoneNumber%>" style="text-align: center;width:100%;background-color: yellow;color:black;" />
			</td>
		</tr>
	</table>
	<br>
</div>
</form>
<script src="/Big_Assignments/js/classie.js"></script>
<script>
		(function() {
			// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
			if (!String.prototype.trim) {
				(function() {
					// Make sure we trim BOM and NBSP
					var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
					String.prototype.trim = function() {
						return this.replace(rtrim, '');
					};
				})();
			}

			[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
				// in case the input is already filled..
				if( inputEl.value.trim() !== '' ) {
					classie.add( inputEl.parentNode, 'input--filled' );
				}

				// events:
				inputEl.addEventListener( 'focus', onInputFocus );
				inputEl.addEventListener( 'blur', onInputBlur );
			} );

			function onInputFocus( ev ) {
				classie.add( ev.target.parentNode, 'input--filled' );
			}

			function onInputBlur( ev ) {
				if( ev.target.value.trim() === '' ) {
					classie.remove( ev.target.parentNode, 'input--filled' );
				}
			}
		})();
		function finish(){
			var flag=0;
			var flag1=0;
			if(table.workerName.value=="")flag=1;
			if(table.workerPhoneNumber.value=="")flag1=1;
			if(table.workerName.value!="")flag=0;
			if(table.workerPhoneNumber.value!="")flag1=0;
			if(flag==1){
				document.getElementById("t1").style.visibility = "visible";
				document.getElementById("t1").style.height = 30 + "px";
			}
			if(flag==0){
				document.getElementById("t1").style.visibility = "hidden";
				document.getElementById("t1").style.height = 0 + "px";
			}
			if(flag1==1){
				document.getElementById("t2").style.visibility = "visible";
				document.getElementById("t2").style.height = 30 + "px";
			}
			if(flag1==0){
				document.getElementById("t2").style.visibility = "hidden";
				document.getElementById("t2").style.height = 0 + "px";
			}
			if(flag==0&&flag1==0){
				table.submit();
			}
		}
</script>
</body>
</html>		