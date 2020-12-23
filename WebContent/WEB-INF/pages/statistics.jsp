<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE HTML>
<html style="height: 100%; background: #263238;">
<head>
<title>STATISTICS</title>
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
<link
	href='/Big_Assignments/css/demo/4fc55ad7dfca484f9418ba597fd6a006.css'
	rel='stylesheet' type='text/css'>
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

h3 {
	color: #78909c
}

th {
	color: orange;
	text-align: center;
}
</style>
</head>
<body>
<%
String str = request.getParameter("year");
session.setAttribute("year1",str);
List<String> yearlist=new ArrayList<String>();
List<String> nyearlist=new ArrayList<String>();
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
        	rs=stmt.executeQuery("select * from car where finishService is not null") ; 
        	while(rs.next()){
        		yearlist.add(rs.getString("finishService").substring(0,4));
        	}
       	    }
        for (String cd:yearlist) {
            if(!nyearlist.contains(cd)){
            	nyearlist.add(cd);
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
		 <li><a href="/Big_Assignments/car/carfiles">车辆档案</a></li>
		 <li><a href="/Big_Assignments/parts/Warehouse">配件仓库</a></li>
		 <li><a href="/Big_Assignments/worker/worker">员工管理</a></li>
		 <li class="current"><a href="/Big_Assignments/car/statistics?year=<%=str%>">利润统计</a></li>								
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
				<li class="about_head-left"><h1>利润统计界面</h1></li>
				<li class="about_head-right"><p>THIS PAGE IS FOR STATISTICS.</p></li>
			</ul>
		</div>
	</div>
	<br>
	<div class="container" align="center"
		style="border-bottom: 0px dashed #CCC">
		<font color="orange" size="4">●较昨日利润变化：</font>
		<font color="white" size="4">${dayCompare}</font>
		&nbsp&nbsp
		<font color="orange" size="4">●较上月利润变化：</font>
		<font color="white" size="4">${monthCompare}</font>
		&nbsp&nbsp
		<font color="orange" size="4">●较上年利润变化：</font>
		<font color="white" size="4">${yearCompare}</font>
	</div>
	<div class="container" align="center"
		style="border-bottom: 1px solid #CCC">
		<div class="col-md-3 sidebar" style="top: 50%; left: 30%; width: 40%;">
		<br>
			<div>
			<form action="/Big_Assignments/car/showProfit" id="table" name="table">
			<select style="width: 20%; height: 50px; background-color: #303C47; color: white; font-size: larger;border-radius:10px" name="year" id="year" onchange="formsubmit();">
			<%for(int i=0;i<nyearlist.size();i++){%>
			<option value="<%=nyearlist.get(i)%>"><%=nyearlist.get(i)%></option>
			<%}%>
			</select>
			<font color="white" size="4">年</font>
			</form>
			</div>
			<br>
			<div class="clearfix"></div>
		</div>
	</div>
	<br>
	<div align="center">
		<canvas id="a_canvas" width="1000" height="500"></canvas>
	</div>
	<script src="/Big_Assignments/js/classie.js"></script>
	<script>
	document.getElementsByName("year")[0].value=${year1};
	function formsubmit(){
		table.submit();
	}
(function (){
    window.addEventListener("load", function(){
      var data = [${year[0]},${year[1]},${year[2]},${year[3]},${year[4]},${year[5]},${year[6]},${year[7]},${year[8]},${year[9]},${year[10]},${year[11]}];
      var xinforma = ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'];

      // 获取上下文
      var a_canvas = document.getElementById('a_canvas');
      var context = a_canvas.getContext("2d");
      //字体
      context.font = "15px Arial";


      // 绘制背景
      var gradient = context.createLinearGradient(0,0,0,300);


     // gradient.addColorStop(0,"#e0e0e0");
      //gradient.addColorStop(1,"#ffffff");


      context.fillStyle = gradient;

      context.fillRect(0,0,a_canvas.width,a_canvas.height);

      var realheight = a_canvas.height-15;
      var realwidth = a_canvas.width-40;
      // 描绘边框
      var grid_cols = data.length + 1;
      var grid_rows = 4;
      var cell_height = realheight / grid_rows;
      var cell_width = realwidth / grid_cols;
      context.lineWidth = 1;
      context.strokeStyle = "#a0a0a0";

      // 结束边框描绘
      context.beginPath();
      // 准备画横线
      /*for(var row = 1; row <= grid_rows; row++){
        var y = row * cell_height;
        context.moveTo(0,y);
        context.lineTo(a_canvas.width, y);
      }*/
      
        //划横线
        context.moveTo(0,realheight);
        context.lineTo(realwidth,realheight);
            
         
        //画竖线
      context.moveTo(0,20);
       context.lineTo(0,realheight);
      context.lineWidth = 1;
      context.strokeStyle = "white";
      context.stroke();
          

      var max_v =0;
      
      for(var i = 0; i<data.length; i++){
        if (data[i] > max_v) { max_v =data[i]};
      }
      max_v = max_v * 1.1;
      // 将数据换算为坐标
      var points = [];
      for( var i=0; i < data.length; i++){
        var v= data[i];
        var px = cell_width *(i +1);
        var py = realheight - realheight*(v / max_v);
        //alert(py);
        points.push({"x":px,"y":py});
      }

      //绘制坐标图形
      for(var i in points){
        var p = points[i];
        context.beginPath();
        context.fillStyle="green";
        context.fillRect(p.x,p.y,15,realheight-p.y);
         
        context.fill();
      }
      //添加文字
      for(var i in points)
      {  var p = points[i];
        context.beginPath();
        context.fillStyle="white";
        context.fillText(data[i], p.x + 1, p.y - 15);
         context.fillText(xinforma[i],p.x + 1,realheight+12);
         context.fillText('月份',realwidth,realheight+12);
         context.fillText('利润',0,20);
          }
    },false);
  })();
</script>
</body>
</html>
