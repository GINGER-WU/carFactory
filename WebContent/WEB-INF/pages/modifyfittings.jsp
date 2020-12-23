<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Car"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>Modify fittings</title>
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
	String partsName=new String (); 
	double partsPrice=0.0;
	int partsNumber=0;
	String str=request.getParameter("partsID"); 
	int id=Integer.parseInt(str);
	Double Bprice=0.0;
	String venderInfo=new String (); 
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
            	rs=stmt.executeQuery("select * from parts where partsID="+id+" ") ; 
            	while(rs.next())
            	{
            	partsName=rs.getString("partsName");
            	partsPrice=rs.getDouble("partsPrice");
            	partsNumber=rs.getInt("partsNumber");
            	Bprice=rs.getDouble("buyingPrice");
            	venderInfo=rs.getString("venderInfo");
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
			<li class="about_head-left"><h1>修改配件信息</h1></li>
			<li class="about_head-right"><p>THIS PAGE IS FOR MODIFY FITTINGS.</p></li>
		</ul>	
	</div>	  
</div>
<div style="display:inline-block;margin-left:19%">
	<button class="btn btn-primary rippler rippler-default"
					style="border: 2px solid #CCC"
					onclick="window.location.href = '/Big_Assignments/parts/Warehouse'">
	◀</button>
	</div>
<form action="/Big_Assignments/parts/changeParts" name="table"> 
<input type="hidden" name="partsID" value="<%=id%>">
<div class="container" align="center" style="border-bottom:1px solid #CCC">
   	<div class="col-md-3 sidebar" style="top: 50%;left: 30%;width: 40%;" >
   	   <div>
		 <br>
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
	<table border="1px" style="border:1px solid #CCC;color: white;text-align: center;width: 80%;">
		<tr>
			<th style="width: 10%;">
				配件编号
			</th>
			<th style="width: 30%;">
				配件名称
				<br>
				<div id="t1" style="visibility: hidden; height: 0px"><font color="red" size="3">配件名称不能为空</font></div>
			</th>
			<th style="width: 20%;">
				配件数量
				<br>
				<div id="t2" style="visibility: hidden; height: 0px"><font color="red" size="3">配件数量不能为空</font></div>
			</th>
			<th style="width: 10%;">
				配件单价
				<br>
				<div id="t3" style="visibility: hidden; height: 0px"><font color="red" size="3">配件单价不能为空</font></div>
			</th>
			<th style="width: 10%;">
				进货单价
				<br>
				<div id="t4" style="visibility: hidden; height: 0px"><font color="red" size="3">进货单价不能为空</font></div>
			</th>
			<th style="width: 20%;">
				厂家信息
				<br>
				<div id="t5" style="visibility: hidden; height: 0px"><font color="red" size="3">厂家信息不能为空</font></div>
			</th>
		</tr>
		<tr>
			<td>
				<%=id%>
			</td>
			<td>
				<input type="text" name="partsName" value="<%=partsName%>"  style="text-align: center;width:100%;background-color: yellow;color:black;" />
			</td>
			<td>
				<input type="text" name="partsNumber" value="<%=partsNumber%>" style="text-align: center;width:100%;background-color: yellow;color:black;" />
			</td>
			<td>
				<input type="text" name="partsPrice" value="<%=partsPrice%>" style="text-align: center;width:100%;background-color: yellow;color:black;" />
			</td>
			<td>
				<input type="text" name="buyingPrice" value="<%=Bprice%>" style="text-align: center;width:100%;background-color: yellow;color:black;" />
			</td>
			<td>
				<input type="text" name="venderInfo" value="<%=venderInfo%>" style="text-align: center;width:100%;background-color: yellow;color:black;" />
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
			var flag2=0;
			var flag3=0;
			var flag4=0;
			if(table.partsName.value=="")flag=1;
			if(table.partsNumber.value=="")flag1=1;
			if(table.partsPrice.value=="")flag2=1;
			if(table.buyingPrice.value=="")flag3=1;
			if(table.venderInfo.value=="")flag4=1;
			if(table.partsName.value!="")flag=0;
			if(table.partsNumber.value!="")flag1=0;
			if(table.partsPrice.value!="")flag2=0;
			if(table.buyingPrice.value!="")flag3=0;
			if(table.venderInfo.value!="")flag4=0;
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
			if(flag2==1){
				document.getElementById("t3").style.visibility = "visible";
				document.getElementById("t3").style.height = 50 + "px";
			}
			if(flag2==0){
				document.getElementById("t3").style.visibility = "hidden";
				document.getElementById("t3").style.height = 0 + "px";
			}
			if(flag3==1){
				document.getElementById("t4").style.visibility = "visible";
				document.getElementById("t4").style.height = 50 + "px";
			}
			if(flag3==0){
				document.getElementById("t4").style.visibility = "hidden";
				document.getElementById("t4").style.height = 0 + "px";
			}
			if(flag4==1){
				document.getElementById("t5").style.visibility = "visible";
				document.getElementById("t5").style.height = 30 + "px";
			}
			if(flag4==0){
				document.getElementById("t5").style.visibility = "hidden";
				document.getElementById("t5").style.height = 0 + "px";
			}
			if(flag==0&&flag1==0&&flag2==0&&flag3==0&&flag4==0){
				table.submit();
			}
		}
</script>
</body>
</html>		