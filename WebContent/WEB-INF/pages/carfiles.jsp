<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Car"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>CARFILES</title>
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
		th{color: orange;}
</style>
</head>
<body>
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
String str_date1 = formatter.format(currentTime); //将日期时间格式化
String year=str_date1.substring(0,4);//取第0+1位至第4位
    int []recordID=new int[100];
    int j=0;
	List<String> carID=new ArrayList<String>();
    List<String> userName=new ArrayList<String>();
    List<String> userPhoneNumber=new ArrayList<String>();
    String keywords=request.getParameter("keywords"); 
	Statement stmt=null;
	ResultSet rs=null;
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/carfactory?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC"; //数据库名
            String username = "root";  //数据库用户名
            String password = "root";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
            stmt=conn.createStatement();
            if(conn != null){
            	if(keywords==null)
            		rs=stmt.executeQuery("select * from car") ;
            	else
            		rs=stmt.executeQuery("select * from car where carID like '%"+keywords+"%' or userName like '%"+keywords+"%' or userPhoneNumber like '%"+keywords+"%' or startService like '%"+keywords+"%' or finishService like '%"+keywords+"%'") ;
           	    while(rs.next()){
           	    	carID.add(rs.getString("carID"));
           	    	userName.add(rs.getString("userName"));
           	    	userPhoneNumber.add(rs.getString("userPhoneNumber"));
           	    	recordID[j]=rs.getInt("recordID");
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
    <div class="menu">
	   <a class="toggleMenu" href="#"><img src="/Big_Assignments/images/menu.png" alt="" /> </a>
	   <ul class="nav" id="nav">
		 <li><a href="/Big_Assignments/car/index">首页</a></li>
		 <li class="current"><a href="/Big_Assignments/car/carfiles">车辆档案</a></li>
		 <li><a href="/Big_Assignments/parts/Warehouse">配件仓库</a></li>
		 <li><a href="/Big_Assignments/worker/worker">员工管理</a></li>
		  <li><a href="/Big_Assignments/car/showProfit?year=<%=year%>">利润统计</a></li>								
	  </ul>
	  <script type="text/javascript" src="/Big_Assignments/js/responsive-nav.js"></script>
	</div>							
    <div class="clearfix"> </div>
	<!----//End-top-nav---->
  </div>
</div>
<div class="about">
	<div class="container">
		<ul class="about_head">
			<li class="about_head-left"><h1>车辆档案</h1></li>
			<li class="about_head-right"><p>THIS PAGE IS FOR CARFILES.</p></li>
		</ul>	
	</div>	  
</div> 
<div class="container" align="center" style="border-bottom:1px solid #CCC">
   	<div class="col-md-3 sidebar" style="top: 50%;left: 30%;width: 40%;" >
   	   <div>
   	   <form action="/Big_Assignments/car/carfiles" style="width: 110%;">
		<button class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC;margin-top: 6.9%;height: 48px;" type="submit">
			🔍
		</button>
   	   	<span class="input input--chisato">
   	   		<input class="input__field input__field--chisato" type="text" id="keywords" name="keywords">
   	   		<label class="input__label input__label--chisato" for="keywords">
   	   			<span class="input__label-content input__label-content--chisato" data-content="Files Search">Files Search</span>
   	   		</label>
   	   	</span>
   	   	</form>
		<button class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC" onclick="window.location.href = '/Big_Assignments/car/Insertfile'">
		+档案
		</button>
   	  </div>
	  <br>
   	<div class="clearfix"> </div>
   </div>
</div>
	<br>
	<div align="center">
		<%
		for(int i=0;i<carID.size();i++){
		%>
		<div class="container" style="border:1px solid #CCC;width: 15%;color: white;display: inline-block;">
		<table border="1px" style="border: transparent;">
		<tr>
			<th>
				档案编号:
			</th>
			<td>
				<%=recordID[i]%>
			</td>
		</tr>
		<tr>
			<th>
				车牌号:
			</th>
			<td>
				<%=carID.get(i)%>
			</td>
		</tr>
		<tr>
			<th>
				客户名称:
			</th>
			<td>
				<%=userName.get(i)%>
			</td>
		</tr>
		<tr>
			<th>
				客户电话:
			</th>
			<td>
				<%=userPhoneNumber.get(i)%>
			</td>
		</tr>
	</table>
	<form action="/Big_Assignments/car/showBill">
	<input type="hidden" id="recordID" name="recordID" value="<%=recordID[i]%>"/>
	<button type="submit" style="margin-left: 80%;background-color: transparent;border:1px solid #CCC;">more</button>
	</form>
	</div>
	<%} %>
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