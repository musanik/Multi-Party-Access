﻿<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
try{

   String fname = null,sname=null,userid=null,id=null;
   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
 	int pid=(Integer)(session.getAttribute("pid"));
   //fname=(String)session.getAttribute("fname");
   //sname=(String)session.getAttribute("sname");
   userid=(String)session.getAttribute("userid");
  
   String s = "select id,fname,sname,userid from reg where userid='"+userid+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   id=rs.getString(1);
   fname=rs.getString(2);
   sname=rs.getString(3);
   userid=rs.getString(4);
   System.out.println(fname);
   System.out.println(sname);
  session.setAttribute("fname1",fname);
  session.setAttribute("sname1",sname);
  session.setAttribute("id",id);
   
   }
   else
   out.print("Please check your login credentials");
  
   
  %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Multiparty Access Control for Online Social
Networks: Model and Mechanisms</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<script language="JavaScript">
function validation()
{
var a = document.f1.relationship.value;

if(document.f1.relationship.selectedIndex==0)
{
alert("Please select The relationship ");
document.f1.relationship.focus();
return false;
}
}
</script>
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		
    <h1><font size="+3">Multiparty Access Control for Online Social Networks: Model 
      and Mechanisms</font></h1>
		
	</div>
	
</div>

<div style="position:absolute; left:780px; top:250px"><img src="images/own.JPG" width="300"></div>
<div style="position:absolute; left:780px; top:450px"><img src="images/stake.JPG" width="300"></div>

<div class='cssmenu'>
<ul>
   <li class='active '><a href="userpage.jsp"><span>Access</span></a></li>
   <li><a href="userpage.jsp"><span>Owned</span></a></li>

   <li><a href="contributor.jsp"><span>Contributed</span></a></li>
   <li><a href="disseminator.jsp"><span>Disseminated</span></a></li>
 
</ul>
</div>
<div id="page">
<h2>Welcome!&nbsp; 
       <font color="#FFFFCC"><font size="5"> <%=fname%></font></font>
        
        <font color="#FFFFCC"><font size="5"><%=sname%></font></font></h2>
		<div><img src="viewimage.jsp?id=<%=id%>" alt="" width="120" height="99" /></div>
		<%
 
}
catch(Exception e)
{
System.out.println(e);
}
%>
	<div id="leftbar" class="sidebar">
		<ul>
			<li>
				
				<ul>
					<br><br>
                   <li><a href="friends.jsp"><font color="#FFFFFF" size="3">Find Friends</font></a></li>
		<li><a href="viewrequest.jsp"><font color="#FFFFFF" size="3">ViewFriendRequest</font></a></li>
        <li><a href="upload.jsp"><font color="#FFFFFF" size="3">Upload Image</font></a></li>
		<li><a href="upload.jsp"><font color="#FFFFFF" size="3">Share Photo</font></a></li>
	    <li><a href="holder.jsp"><font color="#FFFFFF" size="3">FriendsList(Stakeholder)</font></a></li>
				</ul>
			</li>
			
			
			
		</ul>
	</div>
			
	
	</div>

<br><br>

	<div id="content">
	<!--fragment-2-->
		<div style="position:absolute; left:360px; top:240px;"><font color="#FFFFFF" size="5"><font color="#FFFFCC"> 
    View FriendProfile</font></font></div>
	<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
	<div style="position:absolute; left:360px; top:325px; width: 358px; height: 166px;">
		
		<fieldset>
      
    <legend><font color="#FFFFFF"><strong><font size="4">View</font></strong></font></legend>
		
		<form name="f1" action="holder1.jsp" method="post">
		
		<table align="center" height="111">
		
			
			<tr><td>
				<select name="relationship">
					<option value="select">------Relationship------</option>
					<option value="Friends">Friends</option>
					<option value="Family">Family</option>
				</select>
				</td>
			</tr>
			<tr></tr>
			<tr></tr>
			
			<tr><td><input name="submit" type="submit" class="button2" value="View List"/></td></tr>

		</table>

		</form>

		</fieldset>
		</div>
		
		<div style="position:absolute; left:360px; top:520px; width: 400px; height: 166px;">
			<fieldset>
      
    <legend><font color="#FFFFFF"><strong><font size="4">Your FriendProfile</font></strong></font></legend>
		<table width="285" height="298" align="center">
			<%
	
 	String did=request.getParameter("id");
 	Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
	String sql="select * from reg where id='"+did+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork","root","root");;
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
		while(rs2.next()){
		String name1=rs2.getString("name");
		session.setAttribute("name1",name1);
		%>	<tr>
				<td>Name:</td>
				<td><%=rs2.getString("name")%></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td>Profile Image:</td>
				<td><img src="viewimage.jsp?id=<%=rs2.getInt("id")%>" alt="" width="120" height="99" /></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td>Gender:</td>
				<td><%=rs2.getString("gender")%></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td>Date of birth:</td>
				<td><%=rs2.getString("date")%>-<%=rs2.getString("month")%>-<%=rs2.getString("year")%></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td>School:</td>
				<td><%=rs2.getString("secondary")%></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td>College:</td>
				<td><%=rs2.getString("university")%></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td>Employee:</td>
				<td><%=rs2.getString("employee")%></td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr><td><a href="holder3.jsp?id=<%=rs2.getInt("id")%>"><blink>View his/her Post</blink></a></td></tr>
			<%
			}
		}
catch(Exception ex)
	{
		System.out.println(ex);
	}
	  finally
	{
		con2.close();
		st2.close();
	}
 
  %>
		</table>

		
</fieldset>
</div>
		</div><!--end fragment-2-->
			
		</div>

	</div>
	<!-- end content -->
	<!-- start rightbar -->
	
	<!-- end rightbar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->


</body>
</html>
