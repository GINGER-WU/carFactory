<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Worker"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html style="height: 100%; background: #263238;">
<head>
<title>Modifyfile-2</title>
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
	    String str=request.getParameter("recordID"); 
		int recordID=Integer.parseInt(str);
		int[] workerID = new int[100];
		int[] workerIDAll = new int[100];
		Statement stmt = null;
		Statement st = null;
		Statement s = null;
		ResultSet rs = null;
		ResultSet result = null;
		ResultSet r = null;
		List<String> workersNameAll = new ArrayList<String>();
		List<String> workersName = new ArrayList<String>();
		List<String> workersPhoneNumber = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); ////驱动程序名
			String url = "jdbc:mysql://127.0.0.1:3306/carfactory?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC"; //数据库名
			String username = "root"; //数据库用户名
			String password = "root"; //数据库用户密码
			Connection conn = DriverManager.getConnection(url, username, password); //连接状态
			Connection con = DriverManager.getConnection(url, username, password); //连接状态
			Connection co = DriverManager.getConnection(url, username, password); //连接状态
			stmt = conn.createStatement();
			st = con.createStatement();
			s = co.createStatement();
			if (conn != null) {
				rs = stmt.executeQuery("select * from list where recordID=" + recordID + " and partsID is null");
				while (rs.next()) {
					workerID[j] = rs.getInt("workerID");
					j++;
				}
				session.setAttribute("wid",workerID);
			}
			if (con != null) {
				for (int p = 0; p < j; p++) {
					st = conn.createStatement();
					result = st.executeQuery("select * from worker where workerID=" + workerID[p] + "");
					while (result.next()) {
						workersName.add(result.getString("workerName"));
						workersPhoneNumber.add(result.getString("workerPhoneNumber"));
					}

				}
			}
			if (co != null) {
				r = stmt.executeQuery("select * from worker where workingNumber=0");
				while (r.next()) {
					workerIDAll[g] = r.getInt("workerID");
					workersNameAll.add(r.getString("workerName"));
					g++;
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
				<li class="about_head-left"><h1>修改档案-2</h1></li>
				<li class="about_head-right"><p>HIS PAGE IS FOR
						modifyfile-2.</p></li>
			</ul>
		</div>
	</div>

	<br>
	<div class="container" align="center"
		style="border-bottom: 2px dashed #CCC">
		<h2>当前车辆维修负责人员</h2>
	</div>
	<br>
	<div class="container" align="center">
		<table border="1px"
			style="border: transparent; color: white; text-align: center; width: 50%">
			<tr style="border-bottom: gray;">
				<th style="width: 20%;">员工编号</th>
				<th style="width: 30%;">员工姓名</th>
				<th style="width: 30%;">员工电话</th>
				<th style="width: 20%;">操作</th>
			</tr>
			<%
				for (int i = 0; i < workersName.size(); i++) {
			%>
			<tr style="border-bottom: gray;">
				<td><%=workerID[i]%></td>
				<td><%=workersName.get(i)%></td>
				<td><%=workersPhoneNumber.get(i)%></td>
				<td>
					<form action="/Big_Assignments/car/deleteListWorker">
						<input type="hidden" id="workerID" name="workerID"
							value="<%=workerID[i]%>" /> <input type="hidden" id="recordID"
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
	<div class="container" align="center"
		style="border-bottom: 1px solid #CCC">
		<form action="/Big_Assignments/car/changeRecord_part2" name="table">
			<input type="hidden" id="recordID" name="recordID"
				value="<%=recordID%>" />
			<div id="fuck">
			<input type="hidden" name="id1" id="id1" value=""> 
				<input type="hidden" name="id2" id="id2" value=""> <input
					type="hidden" name="id3" id="id3" value="">
			</div>
			<div class="container" align="center"
				style="border-bottom: 1px solid #CCC">
				<div class="col-md-3 sidebar"
					style="top: 50%; left: 30%; width: 40%;">
					<div>
						<font color="#78909c" size="4">点击添加员工☛</font><a class="btn btn-primary rippler rippler-default"
							style="border: 2px solid #CCC;" href="#" id="AddMoreTextBox">+人</a>
						<a class="btn btn-primary rippler rippler-default"
							style="border: 2px solid #CCC" onclick="next();"> 下一步</a>
					</div>
					<br>
					<div class="clearfix"></div>
				</div>
			</div>
			<br>
			<div style="width: 100%; display: inline-block" id="worker"
				align="center">
			</div>
			<br>
		</form>
		<br>
	</div>
	<script src="/Big_Assignments/js/classie.js"></script>
	<script type="text/javascript">
	function next(){
		var workerid=new Array();
		var flag=new Array();
		workerid[0]=${wid[0]};
		workerid[1]=${wid[1]};
		workerid[2]=${wid[2]};
		if(workerid[1]==0||workerid[2]==0){
			if($("#id1").val()==$("#id2").val()||$("#id1").val()==$("#id3").val()||$("#id3").val()==$("#id2").val()){
				alert("工人选择重复");
				return;
			}
		}
		if(workerid[0]!=0&&workerid[1]!=0&&workerid[2]!=0){
			if($("#id1").val()==""&&$("#id2").val()==""&&$("#id3").val()=="") table.submit();
			else{
				flag[4]=1;
			    alert("修车人员已满");
			}
		}
		if(workerid[0]==0||workerid[1]==0||workerid[2]==0){
			flag[4]=0;
		}
		if(workerid.includes(parseInt($("#id1").val()))){
				alert("编号为"+$("#id1").val()+"已在档案中");
				flag[0]=1;
		}
		if(workerid.includes(parseInt($("#id2").val()))){
			alert("编号为"+$("#id2").val()+"已在档案中");
			flag[1]=1;
			}
		if(workerid.includes(parseInt($("#id3").val()))){
			alert("编号为"+$("#id3").val()+"已在档案中");
			flag[2]=1;
	    }
		if(!workerid.includes(parseInt($("#id1").val()))){
			flag[0]=0;
	    }
		if(!workerid.includes(parseInt($("#id2").val()))){
			flag[1]=0;
	    }
		if(!workerid.includes(parseInt($("#id3").val()))){
			flag[2]=0;
	    }
		if(flag.includes(1)){
			return;
		}
		else table.submit();
	}
		$(document)
				.ready(
						function() {

							var MaxInputs = 3; //maximum input boxes allowed  
							var InputsWrapper = $("#worker"); //Input boxes wrapper ID  
							var AddButton = $("#AddMoreTextBox"); //Add button ID  
							var x = InputsWrapper.length; //initlal text box count  
							var FieldCount = 0; //to keep track of text box added
							$(AddButton)
									.click(
											function(e) //on add input button click  
											{
												if (x <= MaxInputs) //max input box allowed  
												{
													FieldCount++; //text box added increment
													$("#id"+FieldCount).remove();//取得对象bai移除
													//add input box
													$(InputsWrapper)
													.append('<div style="width:30%;display: inline-block;"><font color="#78909c" size="6">维修人员:</font>&nbsp<select name="id'+ FieldCount+ '" id="id'+ FieldCount+ '" style="width: 50%;height: 50px;background-color:#303C47;color: white;font-size:larger;"><%for(int i=0;i<g;i++){%><option value="<%=workerIDAll[i]%>"><%=workersNameAll.get(i)%></option><%}%></select><a href="#" class="removeclass"><font color="white" size="6">×</font></a><div>');
													x++; //text box increment  
												}
												return false;
											});

							$("body")
									.on(
											"click",
											".removeclass",
											function(e) { //user click on remove text  
												if (x > 1) {
													$(this).parent('div')
															.remove(); //remove text box
													$("#fuck")
															.append(
																	'<input type="hidden" name="id'+FieldCount+'" id="id'+FieldCount+'" value=""  />');
													x--; //decrement textbox
													FieldCount--;
												}
												return false;
											})

						});
	</script>
</body>
</html>
