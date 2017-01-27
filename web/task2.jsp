<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">

<style>
	body {
    		font-family: "Josefin Sans";
		background-color:white;
	}

	.sidenav {
		text-align:center;
	    	height: 100%;
   	 	width:0px;
    		position: absolute ;
    		z-index: 1;
    		top: 52px;
    		left: 0;
    		background-color:white;
    		overflow-x: hidden;
    		transition: 0.5s;
   	 	padding-top: 10px;
	}
	tr{
		cursor:pointer;
	}
	.sidenav a {
    		padding: 8px 8px 8px 32px;
   	 	text-decoration: none;
    		font-size: 18px;
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
		margin-left:0px;
	}
	#project {
	transition: margin-left .5s;
	margin-left:0px;
	}
	#messages {
		transition: margin-left .5s;
		margin-left:0px;
	}
	#analytics {
		transition: margin-left .5s;
		margin-left:0px;
	}
	#tasks {
		transition: margin-left .5s;
		margin-left:0px;
	}
	#calender {
		transition: margin-left .5s;
		margin-left:0px;
	}
	#layouts {
		transition: margin-left .5s;
		margin-left:0px;
	}
	#accounts {
		transition: margin-left .5s;
		margin-left:0px;
	}
	.jumbotron1{	
	
	box-shadow: 4px 4px 32px 2px rgba(0,0,0,0.75);
			
	}
	th{
		border-bottom: 1px solid #ddd;
	}
	td{
		line-height:55px;
	}

	.jumbotron2{
	
	box-shadow: 0;			
	}

	@media screen and (max-height: 450px) {
  		.sidenav {padding-top: 15px;}
 	 	.sidenav a {font-size: 18px;}
	}
	.jumbotron{
		margin-top:2px;	
		box-shadow: 4px 4px 32px 2px rgba(0,0,0,0.75); 	
	}

	.center {
    		display: block;
    		margin: auto;
 	  	border: 3px solid green;
	}
	.img-circle {
  		  border-radius: 50%;
		height:10%;
	}
	.img-circle1 {
  		  border-radius: 80%;
		  height:60px;
	}
	.img-project {
		height:15%;
		width:100%;
	}

	.project{
		 display: block;
   		 margin: auto;
  		 border: 3px solid green;
		width:100%;
		height:40%;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse" style="background-color: #111;" >
  		<div class="container-fluid">
	    		<div class="navbar-header">
				<a class="navbar-brand" href="#" id="open"> 
					 <span id="close" style="font-size: 36px;cursor:pointer" onclick="openNav()">&#9776;
				</a>
    				<a class="navbar-brand" href="#" style="font-size:36px; color: #f1f1f1;">
					<b>Cruze</b>
				</a>
     			</div>
   
  		</div>
	</nav>

	<div id="mySidenav" class="sidenav">
		<a id="sidedash"href="#" >
			<div class="col-sm-5">
				<img class="img-circle" src="david.jpg">
			</div>
			<div class="col-sm-4" style="font-size:15px;padding:18px;">
				<b><%=(String.valueOf(session.getAttribute("fname"))+String.valueOf(session.getAttribute("lname")))%></b>
				<br>
			</div>
		</a>
		<hr>
  		<a id="sidedash"href="dashboard2.jsp" onclick="dashboard()">
			Dashboard
		</a>
  		<a href="dashboard2.jsp#project" onclick="project()">
			Project
		</a>
  		<a href="dashboard2.jsp#messages" onclick="messages()">	
			Messages
		</a>
  		<a href="dashboard2.jsp#analytics" onclick="analytics()">
			Analytics
		</a>
		<a href="dashboard2.jsp#tasks" onclick="tasks()">
			Tasks
		</a>
		<a href="dashboard2.jsp#calender" onclick="calender()">
			Calender
		</a>
		<a href="dashboard2.jsp#accounts" onclick="accounts()">
			Accounts
		</a>
		<hr align="center" >
		<a href="#" onclick="closeNav()">
			Sign&nbspOut
		</a>
	</div>

	<div class="container-fluid" id="dashboard" style="display:block;">
		<div  class="col-sm-12" >
			<div class="jumbotron"  style="background-color:white; color:black;padding:25px;">
				<h3>
					<b>All Tasks of <%=session.getAttribute("pname")%></b>
				</h3>
				<hr align="left">
				<div class="row">
					<div class="col-sm-3" style="text-align: justify;text-justify: inter-word;">
						<img style="width:100%;" src="image.jsp?imgid=<%=session.getAttribute("pid")%>"><br><br>
						<h4>
							<b>Project Description</b>
							<hr align="left">
						</h4>
						<p style="font-size:15px;">
							<%=session.getAttribute("pdescription")%>
						</p>
					</div>
					<div id=jumbotask class="col-sm-8" style="padding-left:35px; display:none;" >
						<div class="table-responsive">
							<table id="MyTable" class="table table-hover table-inverse" style="overflow-y: hidden;">
  								<thead>
   						 			<tr>
     							 			<th>#</th>
      										<th>TASK</th>
										<th>DEADLINE</th>
										<th>STATUS</th>
    									</tr>
  								</thead>
								<tbody id="tbody">
								</tbody>
							</table>		
						</div>
					</div>
					<div id=insidetask class="col-sm-8" style="display:block" >
						<h3><%=session.getAttribute("subtaskNAME")%></h3>
						<hr align="left">
						<form action="SubDescEditHttpServlet">
						<div class="row" style="font-size:125%;padding-left:25px;">
						
							<div class="form-group">
      				 				 <label for="disabledTextInput" class="col-sm-2 control-label">
									Description
								</label>
      								<label for="disabledTextInput" class="col-sm-10 control-label" style="font-weight: normal;">
       									   <%=session.getAttribute("subtaskdescrip")%>
        								</label>
      							</div><br><br><br><br>
							<div class="form-group">
      				 				 <label for="disabledTextInput" class="col-sm-2 control-label">
									Start Date
								</label>
      								<label for="disabledTextInput" class="col-sm-10 control-label" style="font-weight: normal;">
       									   <%=session.getAttribute("subtaskstartdate")%> 
        								</label>
      							</div><br><br>
							<div class="form-group">
      				 				 <label for="disabledTextInput" class="col-sm-2 control-label">
									 End Date
								</label>
      								<label for="disabledTextInput" class="col-sm-10 control-label" style="font-weight: normal;">
       									  <%=session.getAttribute("subtaskdeadli")%>  
        								</label>
      							</div><br><br>
							<div class="form-group">
      				 				 <label for="status" class="col-sm-2 control-label">
									Status
								</label>
								<div class="col-sm-10">
                                                                    <select class="form-control" id="status" name="selectstatus">
       										<option default>Pending</option>
    									  	<option>Completed</option>
									 	<option>Other</option>
 								 	</select>
        								</div>
      							</div><br><br>
							<div class="form-group">
  								<label for="comment" class="col-sm-2 control-label">
									Comment:
								</label>
								<div class="col-sm-10">
                                                                    <textarea class="form-control" rows="5" id="comment" name="textarea"><%=session.getAttribute("subtaskcomment")%></textarea>
								</div>
							</div>
				</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
    
       var Id;
        
	var tableno;
        var rowcount=<%=session.getAttribute("row")%>
	
			var num = document.getElementById("MyTable").rows.length;
                        <%
                            String []subtaskid=(String[])session.getAttribute("subtaskid");
                            String []subtaskname=(String[])session.getAttribute("subtaskname");
                            String []subtaskdeadline=(String[])session.getAttribute("subtaskdeadline");
                            String []subtaskstatus=(String[])session.getAttribute("subtaskstatus");
                            int number=Integer.parseInt(String.valueOf(session.getAttribute("row")));
                            for(int i=0;i<number;i++)
                            {
                        %>
                                var ea="<%=subtaskid[i]%>";
                                var fa="<%=subtaskname[i]%>";
                                var ga="<%=subtaskdeadline[i]%>";
                                var ha="<%=subtaskstatus[i]%>";
        			console.log(num);
                                
        			var x = document.createElement("tr");
			var a = document.createElement("th");
       			a.scope="row";
        			var anode = document.createTextNode(ea + '.');
      			a.appendChild(anode);
        			x.appendChild(a);
                                x.id=ea;
        			var b = document.createElement("td");
        			var bnode = document.createTextNode(fa);
	  		b.appendChild(bnode);
        			x.appendChild(b);
        			b = document.createElement("td");
        			bnode = document.createTextNode(ga);
  			b.appendChild(bnode);
        			x.appendChild(b);
     			b = document.createElement("td");
			bnode = document.createTextNode(ha);    
			b.appendChild(bnode);
        			x.appendChild(b);
     			document.getElementById("tbody").appendChild(x);
                        <%
                            }
                        %>
  
   $("tr").click(function table(){
                
		document.getElementById("jumbotask").style.display="none";
		document.getElementById("insidetask").style.display="block";
                /*Id =$(this).attr('id');
                var proid=Id;
                var url = "SubTaskDescHttpServlet?proid="+proid;
                window.location.href =url;*/


        });
/*$("tr").on("click", "x", function() {
                document.getElementById("jumbotask").style.display="none";
                 Id = $(this).attr('ID');
                //document.getElementById("insidetasks").innerHTML=Id;
                 var proid=Id;
            var url = "SubTaskDescHttpServlet?proid="+proid;
            window.location.href =url;
                });*/
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

closeNav();
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
closeNav();
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
closeNav();
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
closeNav();
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
closeNav();
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
closeNav();
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
closeNav();
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
closeNav();
document.getElementById("dashboard").style.display="none";
document.getElementById("project").style.display="none";
document.getElementById("messages").style.display="none";
document.getElementById("analytics").style.display="none";
document.getElementById("tasks").style.display="none";
document.getElementById("calender").style.display="none";
document.getElementById("layouts").style.display="none";
document.getElementById("accounts").style.display="block";
}
</script>
     
</body>
</html>

