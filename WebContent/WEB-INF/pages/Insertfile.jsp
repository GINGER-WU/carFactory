<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Car"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>INSERTFILE</title>
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
	List<String> list=new ArrayList<String>();
	int []a=new int[100];
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
            	rs=stmt.executeQuery("select * from worker where workingNumber=0") ;
           	    while(rs.next()){
           	    	list.add(rs.getString("workerName"));
           	    	a[j]=rs.getInt("workerID");
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
				<li class="about_head-left"><h1>添加档案</h1></li>
				<li class="about_head-right"><p>THIS PAGE IS FOR
						INSERTFILES.</p></li>
			</ul>
		</div>
	</div>
	<br>
	<div style="display:inline-block;margin-left:19%">
	<button class="btn btn-primary rippler rippler-default"
					style="border: 2px solid #CCC"
					onclick="window.location.href = '/Big_Assignments/car/carfiles'">
	◀</button>
	</div>
	<form action="/Big_Assignments/car/addRecord_part1" name="table">
	<div id="fuck">
	<input type="hidden" name="id2" id="id2" value="">
	<input type="hidden" name="id3" id="id3" value="">
	</div>
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
	<div style="margin-left: 40%;">
		<a class="btn btn-primary rippler rippler-default"
			style="border: 2px solid #CCC;" href="#" id="AddMoreTextBox">+人</a>
	</div>
	<div style="width: 20%; margin-left: auto; margin-right: auto;"id="worker">
		<font color="#78909c" size="6">维修人员:</font>
		<select style="width: 50%; height: 50px; background-color: #303C47; color: white; font-size: larger;" name="id1">
		<%for(int i=0;i<list.size();i++){%>
		<option value="<%=a[i]%>"><%=list.get(i)%></option>
		<%}%>
		</select>
	</div>
	<br>
	<div
		style="border: 1px solid #CCC; width: 20%; margin-left: auto; margin-right: auto;">
		<div id="t1" style="visibility: hidden; height: 0px"><font color="red" size="3">车牌号不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="carID" name="carID" />
			<label class="input__label input__label--ruri" for="carID">
				<span class="input__label-content input__label-content--ruri">车牌号</span>
		</label>
		</span>
		<div id="t2" style="visibility: hidden; height: 0px"><font color="red" size="3">客户名称不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="userName" name="userName"  />
			<label class="input__label input__label--ruri" for="userName">
				<span class="input__label-content input__label-content--ruri">客户名称</span>
		</label>
		</span> 
		<div id="t3" style="visibility: hidden; height: 0px"><font color="red" size="3">客户电话不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="userPhoneNumber" name="userPhoneNumber" />
			<label class="input__label input__label--ruri" for="userPhoneNumber">
				<span class="input__label-content input__label-content--ruri">客户电话</span>
		</label>
		</span>
		<div id="t4" style="visibility: hidden; height: 0px"><font color="red" size="3">车辆型号不能为空</font></div> 
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="carType" name="carType"/>
			<label class="input__label input__label--ruri" for="carType">
				<span class="input__label-content input__label-content--ruri">车辆型号</span>
		</label>
		</span> 
		<div id="t5" style="visibility: hidden; height: 0px"><font color="red" size="3">里程表数不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="carMileage" name="carMileage"  />
			<label class="input__label input__label--ruri" for="carMileage">
				<span class="input__label-content input__label-content--ruri">里程表数</span>
		</label>
		</span> 
		<div id="t6" style="visibility: hidden; height: 0px"><font color="red" size="3">工时费不能为空</font></div>
		<span class="input input--ruri"> <input
			class="input__field input__field--ruri" type="text" id="laborCost" name="laborCost"  />
			<label class="input__label input__label--ruri" for="laborCost">
				<span class="input__label-content input__label-content--ruri">工时费</span>
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

			[].slice.call(document.querySelectorAll('input.input__field'))
					.forEach(function(inputEl) {
						// in case the input is already filled..
						if (inputEl.value.trim() !== '') {
							classie.add(inputEl.parentNode, 'input--filled');
						}

						// events:
						inputEl.addEventListener('focus', onInputFocus);
						inputEl.addEventListener('blur', onInputBlur);
					});

			function onInputFocus(ev) {
				classie.add(ev.target.parentNode, 'input--filled');
			}

			function onInputBlur(ev) {
				if (ev.target.value.trim() === '') {
					classie.remove(ev.target.parentNode, 'input--filled');
				}
			}
		})();
		$(document)
				.ready(
						function() {

							var MaxInputs = 2; //maximum input boxes allowed  
							var InputsWrapper = $("#worker"); //Input boxes wrapper ID  
							var AddButton = $("#AddMoreTextBox"); //Add button ID  
							var x = InputsWrapper.length; //initlal text box count  
							var FieldCount = 1; //to keep track of text box added
							$(AddButton)
									.click(
											function(e) //on add input button click  
											{
												if (x <= MaxInputs) //max input box allowed  
												{
													FieldCount++; //text box added increment
													//add input box
													$("#id"+FieldCount).remove();//取得对象bai移除
													$(InputsWrapper)
													.append('<div><br><font color="#78909c" size="6">维修人员:</font>&nbsp<select name="id'+ FieldCount+ '" style="width: 50%;height: 50px;background-color:#303C47;color: white;font-size:larger;"><%for(int i=0;i<list.size();i++){%><option value="<%=a[i]%>"><%=list.get(i)%></option><%}%></select><a href="#" class="removeclass"><font color="white" size="6">×</font></a><div>');
													x++; //text box increment  
												}
												return false;
											});

							$("body").on("click", ".removeclass", function(e) { //user click on remove text  
								if (x > 1) {
									$(this).parent('div').remove(); //remove text box
									$("#fuck").append('<input type="hidden" name="id'+x+'" id="id'+x+'" value=""  />');
									x--; //decrement textbox
									FieldCount--;
								}
								return false;
							})

						});
	</script>
</body>
</html>
