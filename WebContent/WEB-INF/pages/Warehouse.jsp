<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Parts"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>WAREHOUSE</title>
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
<style>
		body{ background:#263238; font-family:'Raleway', Arial, sans-serif;}
		section{ padding:20px; font-size:150%; text-align:center;}
    	h2{ color:#78909c}
    	th{color: orange;text-align: center;}
</style>
<!-- start plugins -->
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
String str_date1 = formatter.format(currentTime); //将日期时间格式化
String year=str_date1.substring(0,4);//取第0+1位至第4位
    int j=0;
    int []partID=new int[100];
    int []partNumber=new int[100];
    Double[]price=new Double[100];
    Double[]Bprice=new Double[100];
	List<String> partName=new ArrayList<String>();
	List<String> oprationLog=new ArrayList<String>();
	List<String> venderInfo=new ArrayList<String>();
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
            		rs=stmt.executeQuery("select * from parts") ;
            	else
            		rs=stmt.executeQuery("select * from parts where partsName like '%"+keywords+"%'") ;
           	    while(rs.next()){
           	    	partName.add(rs.getString("partsName"));
           	    	oprationLog.add(rs.getString("oprationLog"));
           	    	venderInfo.add(rs.getString("venderInfo"));
           	    	partID[j]=rs.getInt("partsID");
           	    	partNumber[j]=rs.getInt("partsNumber");
           	    	price[j]=rs.getDouble("partsPrice");
           	    	Bprice[j]=rs.getDouble("buyingPrice");
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
		 <li><a href="/Big_Assignments/car/carfiles">车辆档案</a></li>
		 <li  class="current"><a href="/Big_Assignments/parts/Warehouse">配件仓库</a></li>
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
			<li class="about_head-left"><h1>配件仓库</h1></li>
			<li class="about_head-right"><p>THIS PAGE IS FOR CAR FITTINGS.</p></li>
		</ul>	
	</div>	  
</div> 
<div class="container" align="center" style="border-bottom:1px solid #CCC">
   	<div class="col-md-3 sidebar" style="top: 50%;left: 30%;width: 40%;" >
   	   <div>
   	   	<form action="/Big_Assignments/parts/Warehouse" style="width: 110%;">
   	   	<button class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC;margin-top: 6.9%;height: 48px;" type="submit">
   	   		🔍
   	   	</button>
   	   	<span class="input input--chisato">
   	   		<input class="input__field input__field--chisato" type="text" id="keywords" name="keywords">
   	   		<label class="input__label input__label--chisato" for="keywords">
   	   			<span class="input__label-content input__label-content--chisato" data-content="Fittings Search">Fittings Search</span>
   	   		</label>
   	   	</span>
   	   	</form>
		<button class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC" onclick="window.location.href='/Big_Assignments/parts/addfittings'">
		+配件
		</button>
   	  </div>
	  <br>
   	<div class="clearfix"> </div>
   </div>
</div>
	<br>
<div class="container" align="center">
	<table border="1px" style="border: transparent;color: white;text-align:center;width: 100%;">
		<tr style="border-bottom: gray;">
			<th style="width: 10%;">
				配件编号
			</th>
			<th style="width: 20%;">
				配件名称
			</th>
			<th style="width: 10%;">
				配件单价
			</th>
			<th style="width: 10%;">
				进货单价
			</th>
			<th style="width: 10%;">
				配件数量
			</th>
			<th style="width: 15%;">
				厂家信息
			</th>
			<th style="width: 20%;">
				操作日志
			</th>
			<th>
				操作
			</th>
		</tr>
		<%
		for(int i=0;i<partName.size();i++){
		%>
		<tr style="border-bottom: gray;">
			<td>
				<%=partID[i]%>
			</td>
			<td>
				<%=partName.get(i)%>
			</td>
			<td>
				<%=price[i]%>
			</td>
			<td>
				<%=Bprice[i]%>
			</td>
			<td>
				<%=partNumber[i]%>
			</td>
			<td>
				<%=venderInfo.get(i)%>
			</td>
			<td>
				<%=oprationLog.get(i)%>
			</td>
			<td>
				<form action="/Big_Assignments/parts/modifyfittings">
	            <input type="hidden" id="partsID" name="partsID" value="<%=partID[i]%>"/>
	            <button type="submit" style="background-color: darkcyan;border:1px solid #CCC;margin-top: 5px;">修改</button>
	            </form>
	            <form action="/Big_Assignments/parts/deleteParts">
	            <input type="hidden" id="partsID" name="partsID" value="<%=partID[i]%>"/>
	            <button type="submit" style="background-color: brown;border:1px solid #CCC;margin-top: 5px;margin-bottom: 5px;">删除</button>
	            </form>
			</td>
		</tr>
		<%}%>
	</table>
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