<%@page import="com.CarService.domain.Car"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Parts"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>Details CARFILES</title>
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
</style>
</head>
<body>
<c:set var="cI" value="${car.recordID}" scope="request"></c:set>
<c:set var="cII" value="${car.finishService}" scope="request"></c:set>
<% 
	List<String> list=new ArrayList<String>();
	Statement stmt=null;
	ResultSet rs=null;
	int id=(Integer)request.getAttribute("cI"); 
	int j=0;
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/carfactory?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC"; //数据库名
            String username = "root";  //数据库用户名
            String password = "root";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
            stmt=conn.createStatement();
            if(conn != null){  
            	rs=stmt.executeQuery("select * from list where recordID="+id+" and workerID is null") ;
           	    while(rs.next()){
           	    	list.add(rs.getString("useNumber"));
           	    	j++;
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
			<li class="about_head-left"><h1>车辆详细档案</h1></li>
			<li class="about_head-right"><p>THIS PAGE IS FOR DETAILS CARFILES.</p></li>
		</ul>	
	</div>	  
</div> 
<div class="container" align="center" style="border-bottom:1px solid #CCC">
   	<div class="col-md-3 sidebar" style="top: 50%;left: 30%;width: 40%;" >
   	   <div>
		 <br>
		 <div style="display:inline-block;">
	<button class="btn btn-primary rippler rippler-default"
					style="border: 2px solid #CCC"
					onclick="window.location.href = '/Big_Assignments/car/carfiles'">
	◀</button>
	</div>
		 <div style="display:inline-block">
		 <form action="/Big_Assignments/car/modifyfile1">
		      <input type="hidden" name="recordID" value="<%=id%>">
		      <button class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC" type="submit">
		       修改档案
		      </button>
		</form>
		</div>
		<div style="display:inline-block">
		 <form action="/Big_Assignments/car/deleteRecord">
		      <input type="hidden" name="recordID" value="<%=id%>">
		<button class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC" type="submit">
		删除档案
		</button>
		</form>
		</div>
   	  </div>
	  <br>
   	<div class="clearfix"> </div>
   </div>
</div>
	<br>
<div class="container" style="border:1px solid #CCC;margin-left: auto;margin-right: auto;"align="center">
	<table border="1px" style="border:1px solid #CCC;color: white;">
		<tr>
			<th>
				档案编号
			</th>
			<td>
				${car.recordID}
			</td>
			<th>
				车牌号
			</th>
			<td>
				${car.carID}
			</td>
			<th>
				型号
			</th>
			<td>
				${car.carType}
			</td>
			<th>
				里程表数
			</th>
			<td>
				${car.carMileage}
			</td>
		</tr>
		<tr>
			<th>
				客户名称
			</th>
			<td>
				${car.userName}
			</td>
			<th>
				客户电话
			</th>
			<td>
				${car.userPhoneNumber}
			</td>
		</tr>
		<tr>
			<th>
				维修人员
			</th>
			<td>
				${worker[0].workerName} ${worker[1].workerName} ${worker[2].workerName}
			</td>
			<th>
				工时费
			</th>
			<td>
				${car.laborCost}
			</td>
		</tr>
		<tr>
			<th>
				进厂时间
			</th>
			<td>
				${car.startService}
			</td>
			<th>
				出厂时间
			</th>
			<td>
				${car.finishService}
			</td>
		</tr>
		<tr>
			<th>
				是否结账
			</th>
			<%
			String finish=(String)request.getAttribute("cII");
			if(finish==null)
			{
				out.println("<td><font size='5' color='red'>未结账</fond></td>");
			}
			else out.println("<td><font size='5' color='green'>已结账</fond></td>");
			%>
		</tr>
	</table>
	<br>
	<table border="1px" style="border:1px solid #CCC;color: white;text-align: center;width: 40%;">
		<tr>
			<th>
				配件编号<br>
			</th>
			<th>
				配件名称
			</th>
			<th>
				使用数量
			</th>
			<th>
				配件单价
			</th>
		</tr>
		<%
		for(int i=0;i<list.size();i++){
		pageContext.setAttribute("i",i); 
		%>
		<tr>
		<td>
			${parts[i].partsID}
		</td>
		<td>
			${parts[i].partsName}
		</td>
		<td>
			<%=list.get(i)%>
		</td>
		<td>
			${parts[i].partsPrice}
		</td>
		</tr>
		<%}%>
	</table>
	<div style="margin-left: 60%;">
	<form action="/Big_Assignments/car/payMoney">
	<input type="hidden" id="recordID" name="recordID" value="${car.recordID}"/>
	     <%
			String flag=(String)request.getAttribute("cII");
			if(flag==null)
			{%>
				<button class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC" type="submit" >结账</button>
			<%}%>
	</form>
		<br>
		<font color="orange" size="6">总费用:</font>
		<font color="white" size="6">${money}元</font>
	</div>
</div>
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
</script>
</body>
</html>		