
<html >
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script src="canvasjs.min.js"></script>


<style>
	body {
    		font-family: "Josefin Sans";
		background-color:white;
	}

.sidenav {
	    height: 100%;
   	 width:150px;
    	position: absolute ;
    	z-index: 1;
    	top: 52px;
    	left: 0;
    	
	background-color:white;
    	overflow-x: hidden;
    	transition: 0.5s;
   	 padding-top: 20px;
}

.sidenav a {
    	padding: 8px 8px 8px 32px;
   	 text-decoration: none;
    	font-size: 20px;
   	 
    	display: block;
    	transition: 0.3s;
	color:black;
}

.sidenav a:hover, .offcanvas a:focus{
 color: black;
font-size:26px;
font-style:bold;
}
hr{

 
width:70%;

}

.sidenav .closebtn {
   
    top: 0;
  
   
    margin-left: 0px;
}

#dashboard {
transition: margin-left .5s;
margin-left:150px;
}
#project {
transition: margin-left .5s;
margin-left:150px;
}
#messages {
transition: margin-left .5s;
margin-left:150px;
}
#analytics {
transition: margin-left .5s;
margin-left:150px;
}
#tasks {
transition: margin-left .5s;
margin-left:150px;
}
#calender {
transition: margin-left .5s;
margin-left:150px;
}
#layouts {
transition: margin-left .5s;
margin-left:150px;
}
#accounts {
transition: margin-left .5s;
margin-left:150px;
}
.jumbotron1{
	background-image:url("first.png");

	-webkit-box-shadow: 4px 4px 32px 2px rgba(0,0,0,0.75);
	
-moz-box-shadow: 4px 4px 32px 2px rgba(0,0,0,0.75);
	
box-shadow: 4px 4px 32px 2px rgba(0,0,0,0.75);
			
}




@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.jumbotron{
margin-top:-2px;
-webkit-box-shadow: 4px 4px 32px 2px rgba(0,0,0,0.75);
-moz-box-shadow: 4px 4px 32px 2px rgba(0,0,0,0.75);
box-shadow: 4px 4px 32px 2px rgba(0,0,0,0.75);
			
}

</style>

<body>
<nav class="navbar navbar-inverse" style="background-color: #111;" >
  <div class="container-fluid">
    <div class="navbar-header">
<a class="navbar-brand" href="#" id="open">  <span id="close" style="font-size: 36px;cursor:pointer" onclick="openNav()">&#9776;</a>
      <a class="navbar-brand" href="#" style="font-size:36px; color: #f1f1f1;"><b>Cruze</b></a>
     </div>
   
  </div>
</nav>

<div id="mySidenav" class="sidenav">
  <a href="#" onclick="dashboard()">Dashboard</a>
  <a href="#" onclick="project()">Project</a>
  <a href="#" onclick="messages()">Messages</a>
  <a href="#" onclick="analytics()">Analytics</a>
<a href="#" onclick="tasks()">Tasks</a>
<a href="#" onclick="calender()">Calender</a>
<a href="#" onclick="layouts()">Layouts</a>
<a href="#" onclick="accounts()">Accounts</a>
<br>
<hr align="center" >
<a href="#" onclick="closeNav()">Sign&nbspOut</a>
</div>
  </div>
</div>

<div class="container-fluid" id="dashboard" style="display:block;">
		<div  class="col-sm-12" >
			<div class="jumbotron"  style="background-color:white; color:black;height:300px;padding:15px;">
				<div id="container"  style="height: 280px;width:100%;" >
				</div>
			</div>
		</div>
		<div  class="col-sm-6" >
			<div class="jumbotron" style="background-color:white; color:black;height:240px;padding:15px;">
				<h4><b>Team Involved</b><hr align="left"></h4>
			</div>
		</div>
		<div  class="col-sm-6" >
			<div class="jumbotron" style="background-color:white; color:black;height:240px;padding:15px;">
				<div  id="chartContainer" style=" height: 220px; ">
				</div>
			
</div>
		</div>
</div>
<div class="container-fluid" id="project" style="display:none;">
		<div  class="col-sm-12" >
			
				<div class="jumbotron"  style="background-color:white; color:black;padding:35px;">
					<div  class="col-sm-12" >
					<div  class="jumbotron1"><br><br><br><br><br><br><br></div>
					</div >
				</div>
		</div>
</div>
<div class="container-fluid" id="messages" style="display:none;">
		<div  class="col-sm-12" >
			<div class="jumbotron"  style="background-color:white; color:black;height:300px;padding:15px;">
				<div id="container"  style="height: 280px;width:100%;" >
					messages

				</div>
			</div>
		</div>
</div>
<div class="container-fluid" id="analytics" style="display:none;">
		<div  class="col-sm-12" >
			<div class="jumbotron"  style="background-color:white; color:black;height:300px;padding:15px;">
				<div id="container"  style="height: 280px;width:100%;" >
					analytics
				</div>
			</div>
		</div>
</div>
<div class="container-fluid" id="tasks" style="display:none;">
		<div  class="col-sm-12" >
			<div class="jumbotron"  style="background-color:white; color:black;height:300px;padding:15px;">
				<div id="container"  style="height: 280px;width:100%;" >
					tasks
				</div>
			</div>
		</div>
</div>
<div class="container-fluid" id="calender" style="display:none;">
		<div  class="col-sm-12" >
			<div class="jumbotron"  style="background-color:white; color:black;height:300px;padding:15px;">
				<div id="container"  style="height: 280px;width:100%;" >
					calender
				</div>
			</div>
		</div>
</div>
<div class="container-fluid" id="layouts" style="display:none;">
		<div  class="col-sm-12" >
			<div class="jumbotron"  style="background-color:white; color:black;height:300px;padding:15px;">
				<div id="container"  style="height: 280px;width:100%;" >
					Layouts
				</div>
			</div>
		</div>
</div>

<div class="container-fluid" id="accounts" style="display:none; ">

	<div  class="col-sm-12" >
		<div class="jumbotron"  style="background-color:white; color:black;padding:35px;">
			<form action="EditAccountHttpServlet" method="POST">
			<h4>
				Profile Settings<hr align="left" width="70%">
			</h4>
			<div class="form-group">
      				  <label for="disabledTextInput" class="col-sm-1 control-label">
					First Name
				</label>
      				<div class="col-sm-5">
                                    <input type="text" id="disabledTextInput" class="form-control" name="fname" value="<%=session.getAttribute("fname")%>" readonly="readonly">
        				</div>
				<label for="disabledTextInput" class="col-sm-1 control-label">
					Last Name
				</label>
      				<div class="col-sm-5">
       					   <input type="text" id="disabledTextInput" class="form-control" name="lname" value="<%=session.getAttribute("lname")%>" readonly="readonly">
        				</div>
      			</div><br><br><br>
			<div class="form-group">
      				  <label for="disabledTextInput" class="col-sm-1 control-label">
					Address
				</label>
      				<div class="col-sm-5">
       					   <input type="text" id="disabledTextInput" class="form-control" name="address" value="<%=session.getAttribute("address")%>" >
        				</div>
				<label for="disabledTextInput" class="col-sm-1 control-label">
					PinCode
				</label>
      				<div class="col-sm-5">
       					   <input type="text" id="disabledTextInput" class="form-control" name="pincode" value="<%=session.getAttribute("pincode")%>" >
        				</div>
      			</div><br><br>	
			<div class="form-group">
      				  <label for="disabledTextInput" class="col-sm-1 control-label">
					Contact-No.
				</label>
      				<div class="col-sm-5">
                                    <input type="text" id="disabledTextInput" class="form-control" name="contactno" value="<%=session.getAttribute("contactno")%>" readonly="readonly">
        				</div>
      				  <label for="disabledTextInput" class="col-sm-1 control-label">
					E-mail
				</label>
      				<div class="col-sm-5">
                                    <input type="text" id="disabledTextInput" class="form-control" name="email" value="<%=session.getAttribute("email")%>" readonly="readonly">
        				</div>
      			</div><br><br>	
			<div class="form-group">
      				  <label for="disabledTextInput" class="col-sm-1 control-label">
					Designation
				</label>
      				<div class="col-sm-5">
       					   <input type="text" id="disabledTextInput" class="form-control" name="designation" value="<%=session.getAttribute("designation")%>" readonly="readonly">
        				</div>
           				  <label for="disabledTextInput" class="col-sm-1 control-label">
					Emp-ID
				</label>
      				<div class="col-sm-5">
                                    <input type="text" id="disabledTextInput" class="form-control" name="empid" value="<%=session.getAttribute("empid")%>" readonly="readonly" >
        				</div>
      			</div><br><br>
			<h4>
				Account Settings<hr align="left" width="70%">
			</h4>
			<div class="form-group">
      				  <label for="disabledTextInput" class="col-sm-2 control-label">
					Current Password
				</label>
      				<div class="col-sm-8">
       					   <input type="password" id="password" class="form-control" name="cpassword" value="<%=session.getAttribute("upassword")%>" >
        				</div>
      			</div><br><br><br>
			<div class="form-group">
      				  <label for="disabledTextInput" class="col-sm-2 control-label">
					New-Password
				</label>
      				<div class="col-sm-8">
                                    <input type="password" id="password" class="form-control" placeholder="New password" name="npassword" >
        				</div>
      			</div><br><br>
			<div class="form-group">
      				  <label for="disabledTextInput" class="col-sm-2 control-label">
					Confirm Password
				</label>
      				<div class="col-sm-8">
       					   <input type="password" id="password" class="form-control" placeholder="Confirm-password" name="ccpassword">
        				</div>
      			</div><br><br><br>
			<input type="submit" style="background-color:red;width:100px;padding:7px;color:white;margin-left:80%;"  value="Save">&nbsp;
                        <input type="submit" style="background-color:grey;width:100px;padding:7px;color:white; "  value="Cancel">
			</form>
		</div>
	</div>
</div>





<script>
var x=1;
function myfunction(){
		

	if(x=="1"){
		     x=0;
	 
	closeNav(); 
			}
	 if(x=="0" ) {
		    x=1;
		openNav();

            }

}
function openNav() {


    document.getElementById("mySidenav").style.width = "150px";
    document.getElementById("dashboard").style.marginLeft = "150px";
   document.getElementById("project").style.marginLeft = "150px";
  document.getElementById("messages").style.marginLeft = "150px";
  document.getElementById("analytics").style.marginLeft = "150px";
  document.getElementById("tasks").style.marginLeft = "150px";
  document.getElementById("calender").style.marginLeft = "150px";
  document.getElementById("layouts").style.marginLeft = "150px";
  document.getElementById("accounts").style.marginLeft = "150px";

}
function closeNav() {
 document.getElementById("mySidenav").style.width = "0px";
document.getElementById("dashboard").style.marginLeft = "0px";
document.getElementById("project").style.marginLeft = "0px";
document.getElementById("messages").style.marginLeft = "0px";
document.getElementById("analytics").style.marginLeft = "0px";
document.getElementById("tasks").style.marginLeft = "0px";
document.getElementById("calender").style.marginLeft = "0px";
document.getElementById("layouts").style.marginLeft = "0px";
document.getElementById("accounts").style.marginLeft = "0px";

}
function dashboard() {
document.getElementById("dashboard").style.display="block";
document.getElementById("project").style.display="none";
document.getElementById("messages").style.display="none";
document.getElementById("analytics").style.display="none";
document.getElementById("tasks").style.display="none";
document.getElementById("calender").style.display="none";
document.getElementById("layouts").style.display="none";
document.getElementById("accounts").style.display="none";

}
function project() {
document.getElementById("dashboard").style.display="none";
document.getElementById("project").style.display="block";
document.getElementById("messages").style.display="none";
document.getElementById("analytics").style.display="none";
document.getElementById("tasks").style.display="none";
document.getElementById("calender").style.display="none";
document.getElementById("layouts").style.display="none";
document.getElementById("accounts").style.display="none";

}

function messages() {
document.getElementById("dashboard").style.display="none";
document.getElementById("project").style.display="none";
document.getElementById("messages").style.display="block";
document.getElementById("analytics").style.display="none";
document.getElementById("tasks").style.display="none";
document.getElementById("calender").style.display="none";
document.getElementById("layouts").style.display="none";
document.getElementById("accounts").style.display="none";

}

function analytics() {
document.getElementById("dashboard").style.display="none";
document.getElementById("project").style.display="none";
document.getElementById("messages").style.display="none";
document.getElementById("analytics").style.display="block";
document.getElementById("tasks").style.display="none";
document.getElementById("calender").style.display="none";
document.getElementById("layouts").style.display="none";
document.getElementById("accounts").style.display="none";

}

function tasks() {
document.getElementById("dashboard").style.display="none";
document.getElementById("project").style.display="none";
document.getElementById("messages").style.display="none";
document.getElementById("analytics").style.display="none";
document.getElementById("tasks").style.display="block";
document.getElementById("calender").style.display="none";
document.getElementById("layouts").style.display="none";
document.getElementById("accounts").style.display="none";

}

function calender() {
document.getElementById("dashboard").style.display="none";
document.getElementById("project").style.display="none";
document.getElementById("messages").style.display="none";
document.getElementById("analytics").style.display="none";
document.getElementById("tasks").style.display="none";
document.getElementById("calender").style.display="block";
document.getElementById("layouts").style.display="none";
document.getElementById("accounts").style.display="none";

}

function layouts() {
document.getElementById("dashboard").style.display="none";
document.getElementById("project").style.display="none";
document.getElementById("messages").style.display="none";
document.getElementById("analytics").style.display="none";
document.getElementById("tasks").style.display="none";
document.getElementById("calender").style.display="none";
document.getElementById("layouts").style.display="block";
document.getElementById("accounts").style.display="none";

}

function accounts() {
document.getElementById("dashboard").style.display="none";
document.getElementById("project").style.display="none";
document.getElementById("messages").style.display="none";
document.getElementById("analytics").style.display="none";
document.getElementById("tasks").style.display="none";
document.getElementById("calender").style.display="none";
document.getElementById("layouts").style.display="none";
document.getElementById("accounts").style.display="block";

}
$(function () {
    Highcharts.chart('container', {
        chart: {
            type: 'area'
        },
        title: {
            text: 'Project Activity'
        },
      
        xAxis: {
            allowDecimals: false,
            labels: {
                formatter: function () {
                    return this.value; // clean, unformatted number for year
                }
            }
        },
        yAxis: {
            title: {
                text: 'Hours'
            },
            labels: {
                formatter: function () {
                    return this.value / 10000;
                }
            }
        },
        tooltip: {
            pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
        },
        plotOptions: {
            area: {
                pointStart:1,
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        },
        series: [{
            name: 'Task1',
            data: [null, null, null, null, null, 6, 11, 32, 110, 235, 369, 640,
                1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
                27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
                26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
                24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
                22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
                10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104]
        }, {
            name: 'Task2',
            data: [null, null, null, null, null, null, null, null, null, null,
                5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,
                4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,
                15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,
                33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,
                35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
                21000, 20000, 19000, 18000, 18000, 17000, 16000]
        }]
    });
});
window.onload = function () {
			var chart = new CanvasJS.Chart("chartContainer", {
				title: {
					text: ""
				},
				axisX: {
					interval: 10
				},
				dataPointWidth: 60,
				data: [{
					type: "column",
					indexLabelLineThickness: 2,
					dataPoints: [
						  { x: 10, y: 230, indexLabel: "Lowest" },
						  { x: 20, y: 710, indexLabel: "Highest" },
						  { x: 30, y: 380 },
						  { x: 40, y: 567 },
						  { x: 50, y: 280 },
						  	]
				}]
			});
			chart.render();
		}

</script>
     
</body>
</html>

