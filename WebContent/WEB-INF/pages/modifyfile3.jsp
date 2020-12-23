<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Worker"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html style="height: 100%; background: #263238;">
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
	color: orange
}

th {
	color: orange;
	text-align: center;
}
</style>
<!-- start plugins -->
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
	<%
		int j = 0;
		int g = 0;
		int count=0;
		String str = request.getParameter("recordID");
		int recordID = Integer.parseInt(str);
		int[] partsID = new int[100];
		int[] useNumber = new int[100];
		double[] price = new double[100];
		Statement stmt = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet result = null;
		List<String> partsName = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); ////驱动程序名
			String url = "jdbc:mysql://127.0.0.1:3306/carfactory?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC"; //数据库名
			String username = "root"; //数据库用户名
			String password = "root"; //数据库用户密码
			Connection conn = DriverManager.getConnection(url, username, password); //连接状态
			Connection con = DriverManager.getConnection(url, username, password); //连接状态
			stmt = conn.createStatement();
			st = con.createStatement();
			if (conn != null) {
				rs = stmt.executeQuery("select * from list where recordID=" + recordID + " and workerID is null");
				while (rs.next()) {
					partsID[j] = rs.getInt("partsID");
					useNumber[j] = rs.getInt("useNumber");
					j++;
				}
			}
			if (con != null) {
				for (int p = 0; p < j; p++) {
					result = st.executeQuery("select * from parts where partsID=" + partsID[p] + "");
					while (result.next()) {
						partsName.add(result.getString("partsName"));
						price[p] = result.getDouble("partsPrice");
					}

				}
			}
		} catch (Exception e) {
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
				<li class="about_head-left"><h1>修改档案-3</h1></li>
				<li class="about_head-right"><p>HIS PAGE IS FOR
						modifyfile-3.</p></li>
			</ul>
		</div>
	</div>
	<div class="container" align="center"
		style="border-bottom: 2px dashed #CCC">
		<h2>当前车辆维修使用配件</h2>
	</div>
	<br>
	<div class="container" align="center">
		<table border="1px"
			style="border: transparent; color: white; text-align: center; width: 50%">
			<tr style="border-bottom: gray;">
				<th style="width: 20%;">配件编号</th>
				<th style="width: 30%;">配件名称</th>
				<th style="width: 20%;">使用数量</th>
				<th style="width: 20%;">配件单价</th>
				<th style="width: 20%;">操作</th>
			</tr>
			<%
				for (int i = 0; i < j; i++) {
					count++;
			%>
			<tr style="border-bottom: gray;">
				<td><%=partsID[i]%></td>
				<td><%=partsName.get(i)%></td>
				<td>
					<form action="/Big_Assignments/car/changeListPartsNumber">
					<input type="hidden" id="parts<%=i%>" name="parts<%=i%>"
							value="<%=partsID[i]%>" />
						<input type="hidden" id="partsID" name="partsID"
							value="<%=partsID[i]%>" /> <input type="hidden" id="recordID"
							name="recordID" value="<%=recordID%>" /> <input type="text"
							id="n" name="n" value="<%=useNumber[i]%>"
							style="text-align: center; color: black; width: 50%" />
						<button type="submit"
							style="background-color: darkcyan; border: 1px solid #CCC; margin-top: 5px;">√</button>
					</form>
				</td>
				<td><%=price[i]%></td>
				<td>
					<form action="/Big_Assignments/car/deleteListParts">
						<input type="hidden" id="partsID" name="partsID"
							value="<%=partsID[i]%>" /> <input type="hidden" id="recordID"
							name="recordID" value="<%=recordID%>" />
						<button type="submit"
							style="background-color: brown; border: 1px solid #CCC; margin-top: 5px; margin-bottom: 5px;">删除</button>
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<br>
	<form action="/Big_Assignments/car/changeRecord_part3" name="table">
	    <input type="hidden" id="count" name="count"
			value="<%=count%>" />
		<input type="hidden" id="recordID" name="recordID"
			value="<%=recordID%>" />
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
		<div id="page" align="center" style="visibility: hidden">
			<div id="warehouse">
				<iframe id="wa" src="/Big_Assignments/parts/search"
					style="width: 70%; height: 300px"></iframe>
			</div>
		</div>
		<br>
		<div id="fittings" align="center">
			<div id="def">
				<input type="hidden" name="useParts[0].partsIDs" value="0" /> <input
					type="hidden" name="useParts[0].useNumber" value="0" />
			</div>
		</div>
		<br>
	</form>
	</div>
	<br>
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
													document
															.getElementById("page").style.visibility = "hidden";
													document
															.getElementById("page").style.height = 0 + "px";
													flag = 0;
												} else {
													document
															.getElementById("page").style.visibility = "visible";
													document
															.getElementById("page").style.height = 300 + "px";
													flag = 1;
												}
												return false;
											})
						});
		function finish() {
			var sum = $('#wa').eq(0)[0].contentWindow.FieldCount;
			var index = $('#wa').eq(0)[0].contentWindow.index;
			var pID=new Array();
			var count=document.getElementById("count").value;
			var wrong = new Array();
			var flag=new Array();
			for (i = 0; i < sum; i++) {
				if (document.getElementById('useParts[' + index[i]
						+ '].useNumber').value == "") {
					document.getElementById('t' + index[i] + '').style.visibility = "visible";
					document.getElementById('t' + index[i] + '').style.height = 5 + "px";
					wrong[i] = 1;
				}
				if (document.getElementById('useParts[' + index[i]
						+ '].useNumber').value != "") {
					document.getElementById('t' + index[i] + '').style.visibility = "hidden";
					document.getElementById('t' + index[i] + '').style.height = 0 + "px";
					wrong[i] = 0;
				}
			}
			for(i=0;i<count;i++){
				if(document.getElementById('parts'+i+'').value!=""){
					pID[i]=document.getElementById('parts'+i+'').value;
				}
			}
			for(i=0;i<sum;i++){
				if(pID.includes(index[i])){
					alert("iD为"+index[i]+"，的配件已在列表中");
					flag[i]=1;
				}
				else flag[i]=0;
			}
			if(flag.includes(1)||wrong.includes(1)) {
				return;
			}
			else table.submit();
			
		}
	</script>
</body>
</html>
