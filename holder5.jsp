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
		<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
		<form name="f1" action="holder1.jsp" method="post">
		
		<table align="center" height="150">
		
			
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
		<form name="f2" ENCTYPE="multipart/form-data" action="uploadpage1.jsp" method="post">
		
		<table align="center" height="150">
			<tr><td>Photo id:&nbsp;&nbsp;&nbsp;<%=(Integer)(session.getAttribute("pid"))%></td></tr>
			<tr></tr>
			<tr></tr>
			<tr><td>You are the owner of this photo</td></tr>
			<tr></tr>
			<tr></tr>
			<tr><td><img src="view.jsp?id=<%=(Integer)(session.getAttribute("pid"))%>" alt="" width="250" height="250" /></td></tr>
			<tr></tr>
			<tr></tr>
			<tr><td><select name="setting">
					<option value="select">-----Select settings-----</option>
					<option value="private">private</option>
					<option value="public">public</option>
					</select>
			</td></tr>
			<tr></tr>
			<tr></tr>
			<tr><td><input name="submit" type="submit" class="button2" value="Save privacy settings"/></td></tr>
		</table>

		</form>

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
