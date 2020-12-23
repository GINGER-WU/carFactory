<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.CarService.domain.Parts"%>
<%@ page import="com.CarService.service.PartsService"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>WAREHOUSE</title>
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
	color: #78909c
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
		int ad = 0;
		int j = 0;
		int[] partID_ = new int[100];
		int[] partNumber_ = new int[100];
		Double[] price_ = new Double[100];
		List<String> partName_ = new ArrayList<String>();
		String keywords = request.getParameter("keywords");
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); ////驱动程序名
			String url = "jdbc:mysql://127.0.0.1:3306/carfactory?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC"; //数据库名
			String username = "root"; //数据库用户名
			String password = "root"; //数据库用户密码
			Connection conn = DriverManager.getConnection(url, username, password); //连接状态
			stmt = conn.createStatement();
			if (conn != null) {
				if (keywords == null)
					rs = stmt.executeQuery("select * from parts");
				else
					rs = stmt.executeQuery("select * from parts where partsName like '%" + keywords + "%'");
				while (rs.next()) {
					partName_.add(rs.getString("partsName"));
					partID_[j] = rs.getInt("partsID");
					partNumber_[j] = rs.getInt("partsNumber");
					price_[j] = rs.getDouble("partsPrice");
					j++;
				}
			}
		} catch (Exception e) {
			out.print("数据库连接异常！");
			e.printStackTrace();
		}
	%>
	<div class="container" align="center"
		style="border-bottom: 1px solid #CCC">
		<div class="col-md-3 sidebar" style="top: 50%; left: 30%; width: 40%;">
			<div>
				<form action="/Big_Assignments/parts/search" style="width: 110%;">
					<button class="btn btn-primary rippler rippler-default"
						style="border: 2px solid #CCC; margin-top: 6.9%; height: 48px;"
						type="submit">🔍</button>
					<span class="input input--chisato"> <input
						class="input__field input__field--chisato" type="text"
						id="keywords" name="keywords"> <label
						class="input__label input__label--chisato" for="keywords">
							<span class="input__label-content input__label-content--chisato"
							data-content="Fittings Search">Fittings Search</span>
					</label>
					</span>
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container" align="center">
		<table border="1px"
			style="border: transparent; color: white; text-align: center">
			<tr style="border-bottom: gray;">
				<th style="width: 10%;">配件编号</th>
				<th style="width: 30%;">配件名称</th>
				<th style="width: 20%;">配件单价</th>
				<th style="width: 10%;">配件数量</th>
				<th style="width: 20%;">操作</th>
			</tr>
			<%
				for (int i = 0; i < partName_.size(); i++) {
			%>
			<tr style="border-bottom: gray;">
				<td><%=partID_[i]%></td>
				<td><%=partName_.get(i)%></td>
				<td><%=price_[i]%></td>
				<td><%=partNumber_[i]%></td>
				<td>
					<form action="/Big_Assignments/parts/search" name="ho">
						<div id="fff<%=partID_[i]%>">
							<input type="hidden" id="ho<%=partID_[i]%>"
								name="ho<%=partID_[i]%>" value="<%=partID_[i]%>">
								<input type="hidden" id="po<%=partID_[i]%>"
								name="po<%=partID_[i]%>" value="<%=partName_.get(i)%>"> <button
								type="submit" id="a<%=partID_[i]%>"
								style="background-color: darkcyan; border: 1px solid #CCC; margin-top: 5px;margin-bottom: 5px;width:30%"
								onclick="adds(<%=partID_[i]%>);">+</button>
						</div>
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<script src="/Big_Assignments/js/classie.js"></script>
	<script type="text/javascript">
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
		var FieldCount = 0;
		var index=new Array();
		function adds(x) {
			var domInput = document.getElementById('ho'+x);
			var domInput1 = document.getElementById('po'+x);
			var a =  domInput.value;
			var b =  domInput1.value;
			var MaxInputs = 8; //maximum input boxes allowed  
			var InputsWrapper = $("#fittings", window.parent.document); //Input boxes wrapper ID
			    index[FieldCount]=a;
				FieldCount++; //text box added increment
				$("#def",window.parent.document).remove();
				$("#a"+x).remove();
				$("#fff"+x).append('<button type="submit" id="r'+x+'" style="background-color: brown; border: 1px solid #CCC; margin-top: 5px;margin-bottom: 5px;width:30%" onclick="removes('+x+');">×</button>');
				//add input box
				$(InputsWrapper)
						.append(
								'<div id="box'
										+ a
										+ '" style="border:1px solid #CCC;width:15%;height:200px;margin-left: auto;margin-right: auto;display: inline-block;text-align:left"><br>&nbsp&nbsp<font color="orange" size="5">配件编号：</font><font color="white" size="5">'+a+'</font> <br> <br> &nbsp&nbsp<font color="orange" size="5">配件名称：</font><font color="white" size="5">'+b+'</font><input value="'+a+'" type="hidden" name="useParts['+ a +'].partsIDs" /><br><br>&nbsp&nbsp<font color="orange" size="5">使用数量：</font> <input type="text" name="useParts['+ a +'].useNumber" id="useParts['+ a +'].useNumber" style="text-align: center; background-color: darkcyan;color:white;width:20%;border-radius:4px;border:1px solid #c8cccf;" /><br><div style="visibility: hidden; height: 0px" id="t'+a+'" align="center"><font color="red" size="3">使用数量不能为空</font></div></div>');
		}
		function removes(x) {
			var InputsWrapper = $("#fittings", window.parent.document);
			var domInput = document.getElementById('ho'+x);
			var a =  domInput.value;
			index = index.filter(item=>item != a);
				$("#box"+a, window.parent.document)
						.remove(); //remove text box
				$("#r"+x).remove();//取得对象bai移除
				$("#fff"+x)
						.append(
								'<button type="submit" id="a'+x+'" style="background-color: darkcyan; border: 1px solid #CCC; margin-top: 5px;margin-bottom: 5px;width:30%" onclick="adds('+x+');">+</button>');
				FieldCount--;
				if(FieldCount==0){
					$(InputsWrapper).append('<div id="def"> <input type="hidden" name="useParts[0].partsIDs" value="0"/><input type="hidden" name="useParts[0].useNumber" value="0"/></div>');
				}
		}
	</script>
</body>
</html>
