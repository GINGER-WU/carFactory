<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html style="height:100%;background:#263238;">
<head>
<title>Addfittings</title>
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
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
		body{ background:#263238; font-family:'Raleway', Arial, sans-serif;}
		section{ padding:20px; font-size:150%; text-align:center;}
    	h2{ color:#78909c}
</style>
<!-- start plugins -->
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
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
			<li class="about_head-left"><h1>配件入仓</h1></li>
			<li class="about_head-right"><p>THIS PAGE IS FOR ADDTFITTINGS.</p></li>
		</ul>	
	</div>	  
</div>
 	<br>
 	<div style="display:inline-block;margin-left:19%">
	<button class="btn btn-primary rippler rippler-default"
					style="border: 2px solid #CCC"
					onclick="window.location.href = '/Big_Assignments/parts/Warehouse'">
	◀</button>
	</div>
 	<form action="/Big_Assignments/parts/addParts" name="table">
<div class="container" align="center" style="border-bottom:1px solid #CCC">
   	<div class="col-md-3 sidebar" style="top: 50%;left: 30%;width: 40%;" >
   	   <div>
		<a class="btn btn-primary rippler rippler-default" style="border:2px solid #CCC;" href="#" id="AddMoreTextBox" >继续添加</a>
		<a class="btn btn-primary rippler rippler-default"
						style="border: 2px solid #CCC" onclick="finish();"> 完成</a>
   	  </div>
	  <br>
   	<div class="clearfix"> </div>
   </div>
</div>
<br>
<div id="fittings" align="center">
<div style="border:1px solid #CCC;width:20%;margin-left: auto;margin-right: auto;display: inline-block;">
<br>
	<font color="white" size="5">配件名称</font>
	<div id="a0" style="visibility: hidden; height: 0px"><font color="red" size="3">配件名称不能为空</font></div>
	<span class="input input--ruri">
		<input class="input__field input__field--ruri" type="text" name="parts[0].partsName" id="parts[0].partsName" style="text-align: center;" />
		<label class="input__label input__label--ruri" for="parts[0].partsName">
			<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
	</span>
	<br>
	<font color="white" size="5">配件数量</font>
	<div id="b0" style="visibility: hidden; height: 0px"><font color="red" size="3">配件数量不能为空</font></div>
	<span class="input input--ruri">
		<input class="input__field input__field--ruri" type="text" name="parts[0].partsNumber" id="parts[0].partsNumber" style="text-align: center;" />
		<label class="input__label input__label--ruri" for="parts[0].partsNumber">
			<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
	</span>
	<font color="white" size="5">配件单价</font>
	<div id="c0" style="visibility: hidden; height: 0px"><font color="red" size="3">配件单价不能为空</font></div>
	<span class="input input--ruri">
		<input class="input__field input__field--ruri" type="text" name="parts[0].partsPrice" id="parts[0].partsPrice" style="text-align: center;" />
		<label class="input__label input__label--ruri" for="parts[0].partsPrice">
			<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
	</span>
	<font color="white" size="5">进货单价</font>
	<div id="d0" style="visibility: hidden; height: 0px"><font color="red" size="3">进货单价不能为空</font></div>
	<span class="input input--ruri">
		<input class="input__field input__field--ruri" type="text" name="parts[0].buyingPrice" id="parts[0].buyingPrice" style="text-align: center;" />
		<label class="input__label input__label--ruri" for="parts[0].buyingPrice">
			<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
	</span>
	<font color="white" size="5">厂家信息</font>
	<div id="e0" style="visibility: hidden; height: 0px"><font color="red" size="3">厂家信息不能为空</font></div>
	<span class="input input--ruri">
		<input class="input__field input__field--ruri" type="text" name="parts[0].venderInfo" id="parts[0].venderInfo" style="text-align: center;" />
		<label class="input__label input__label--ruri" for="parts[0].venderInfo">
			<span class="input__label-content input__label-content--ruri">&nbsp</span>
		</label>
	</span>
	<br>
	<br>
	<br>
</div>
</div>
</form>
<script src="/Big_Assignments/js/classie.js"></script>
<script>
var FieldCount=0; //to keep track of text box added  
$(document).ready(function() {
  
var MaxInputs       = 8; //maximum input boxes allowed  
var InputsWrapper   = $("#fittings"); //Input boxes wrapper ID  
var AddButton       = $("#AddMoreTextBox"); //Add button ID  
  
var x = InputsWrapper.length; //initlal text box count  
var fuck=0; 
$(AddButton).click(function (e)  //on add input button click  
{  
        if(x <= MaxInputs) //max input box allowed  
        {  
            FieldCount++; //text box added increment
            fuck=FieldCount-1
            $("#id"+fuck).remove();//取得对象bai移除
            $("#box"+fuck).append('<div id="id'+ fuck+ '"><font color="grey" size="10">×</font></div>');
            //add input box
            $(InputsWrapper).append('<div id="box'+ FieldCount+ '" style="border:1px solid #CCC;width:20%;margin-left: auto;margin-right: auto;display: inline-block;"> <br> <font color="white" size="5">配件名称</font><div id="a'+FieldCount+'" style="visibility: hidden; height: 0px"><font color="red" size="3">配件名称不能为空</font></div> <span class="input input--ruri"> <input class="input__field input__field--ruri" type="text" id="parts['+ FieldCount +'].partsName" name="parts['+ FieldCount +'].partsName" style="text-align: center;" /> <label class="input__label input__label--ruri" for="parts['+ FieldCount +'].partsName"> <span class="input__label-content input__label-content--ruri">&nbsp</span> </label> </span> <br> <font color="white" size="5">配件数量</font><div id="b'+FieldCount+'" style="visibility: hidden; height: 0px"><font color="red" size="3">配件数量不能为空</font></div> <span class="input input--ruri"> <input class="input__field input__field--ruri" type="text" name="parts['+ FieldCount +'].partsNumber" id="parts['+ FieldCount +'].partsNumber" style="text-align: center;" /> <label class="input__label input__label--ruri" for="parts['+ FieldCount +'].partsNumber"> <span class="input__label-content input__label-content--ruri">&nbsp</span> </label> </span><font color="white" size="5">配件单价</font> <div id="c'+FieldCount+'" style="visibility: hidden; height: 0px"><font color="red" size="3">配件单价不能为空</font></div> <span class="input input--ruri"> <input class="input__field input__field--ruri" type="text" name="parts['+ FieldCount +'].partsPrice" id="parts['+ FieldCount +'].partsPrice" style="text-align: center;" /> <label class="input__label input__label--ruri" for="parts['+ FieldCount +'].partsPrice"> <span class="input__label-content input__label-content--ruri">&nbsp</span> </label> </span><font color="white" size="5">进货单价</font> <div id="d'+ FieldCount +'" style="visibility: hidden; height: 0px"><font color="red" size="3">进货单价不能为空</font></div> <span class="input input--ruri"> <input class="input__field input__field--ruri" type="text" name="parts['+ FieldCount +'].buyingPrice" id="parts['+ FieldCount +'].buyingPrice" style="text-align: center;" /> <label class="input__label input__label--ruri" for="parts['+ FieldCount +'].buyingPrice"> <span class="input__label-content input__label-content--ruri">&nbsp</span> </label> </span> <font color="white" size="5">厂家信息</font> <div id="e'+ FieldCount +'" style="visibility: hidden; height: 0px"><font color="red" size="3">厂家信息不能为空</font></div> <span class="input input--ruri"> <input class="input__field input__field--ruri" type="text" name="parts['+ FieldCount +'].venderInfo" id="parts['+ FieldCount +'].venderInfo" style="text-align: center;" /> <label class="input__label input__label--ruri" for="parts['+ FieldCount +'].venderInfo"> <span class="input__label-content input__label-content--ruri">&nbsp</span> </label> </span> <br><a href="#" class="removeclass" id="id'+ FieldCount+ '"><font color="white" size="10">×</font></a></div>');  
            x++; //text box increment  
        }  
return false;  
});  
  
$("body").on("click",".removeclass", function(e){ //user click on remove text  
        if( x > 1 ) {
        	    fuck=FieldCount-1
                $(this).parent('div').remove(); //remove text box
                $("#id"+fuck).remove();//取得对象bai移除
                $("#box"+fuck).append('<a href="#" class="removeclass" id="id'+ fuck+ '"><font color="white" size="10">×</font></a>');
                FieldCount--;
                x--; //decrement textbox 
        }  
return false;  
})    
}); 
function finish(){
	var flag =new Array();
	var flag1 =new Array();
	var flag2 =new Array();
	var flag3 =new Array();
	var flag4 =new Array();
	for(i=0;i<=FieldCount;i++){
		if(document.getElementById('parts['+i+'].partsName').value==""){
			flag[i]=1;
			document.getElementById('a' + i + '').style.visibility = "visible";
			document.getElementById('a' + i + '').style.height = 5 + "px";
		}
		if(document.getElementById('parts['+i+'].partsName').value!=""){
			flag[i]=0;
			document.getElementById('a' + i + '').style.visibility = "hidden";
			document.getElementById('a' + i + '').style.height = 0 + "px";
		}
		if(document.getElementById('parts['+i+'].partsNumber').value==""){
			flag1[i]=1;
			document.getElementById('b' + i + '').style.visibility = "visible";
			document.getElementById('b' + i + '').style.height = 5 + "px";
		}
		if(document.getElementById('parts['+i+'].partsNumber').value!=""){
			flag1[i]=0;
			document.getElementById('b' + i + '').style.visibility = "hidden";
			document.getElementById('b' + i + '').style.height = 0 + "px";
		}
		if(document.getElementById('parts['+i+'].partsPrice').value==""){
			flag2[i]=1;
			document.getElementById('c' + i + '').style.visibility = "visible";
			document.getElementById('c' + i + '').style.height = 5 + "px";
		}
		if(document.getElementById('parts['+i+'].partsPrice').value!=""){
			flag2[i]=0;
			document.getElementById('c' + i + '').style.visibility = "hidden";
			document.getElementById('c' + i + '').style.height = 0 + "px";
		}
		if(document.getElementById('parts['+i+'].buyingPrice').value==""){
			flag3[i]=1;
			document.getElementById('d' + i + '').style.visibility = "visible";
			document.getElementById('d' + i + '').style.height = 5 + "px";
		}
		if(document.getElementById('parts['+i+'].buyingPrice').value!=""){
			flag3[i]=0;
			document.getElementById('d' + i + '').style.visibility = "hidden";
			document.getElementById('d' + i + '').style.height = 0 + "px";
		}
		if(document.getElementById('parts['+i+'].venderInfo').value==""){
			flag4[i]=1;
			document.getElementById('e' + i + '').style.visibility = "visible";
			document.getElementById('e' + i + '').style.height = 5 + "px";
		}
		if(document.getElementById('parts['+i+'].venderInfo').value!=""){
			flag4[i]=0;
			document.getElementById('e' + i + '').style.visibility = "hidden";
			document.getElementById('e' + i + '').style.height = 0 + "px";
		}
		
	}
	if(flag.includes(1)||flag1.includes(1)||flag2.includes(1)||flag3.includes(1)||flag4.includes(1))return;
	else table.submit();
}
</script>
</body>
</html>		