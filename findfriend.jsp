﻿<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
 String name = null,userid=null,id=null;
try{

  
   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
 
   //fname=(String)session.getAttribute("fname");
   //sname=(String)session.getAttribute("sname");
   userid=(String)session.getAttribute("userid");
  
   String s = "select id,name,userid from reg where userid='"+userid+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   id=rs.getString(1);
   name=rs.getString(2);
   userid=rs.getString(3);

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
       <font color="#FFFFCC"><font size="5"> <%=name%></font></font>
</h2>
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
           <li><a href="checkfriend.jsp"><font color="#FFFFFF" size="3">Find Friends</font></a></li>
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
		<div style="position:absolute; left:360px; top:240px;"><font color="#FFFFFF" size="5"><font color="#FFFFCC"> 
      Find Friends</font></font></div>
		<div style="position:absolute; left:361px; top:310px; width: 358px; height: 166px;">
		
		<fieldset>
      
    <legend><font color="#FFFFFF" size="4"><strong>Send Request</strong></font></legend>
		<%
	int fid=0;
	String rid=null,fname=null;
 	Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
	String sql="select * from reg where id != '"+id+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork","root","root");
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
		
		%>
		<form name="f1" ENCTYPE="multipart/form-data" action="#" method="post">
		
		<table width="318" height="150" align="center">
			<%while(rs2.next()){
			fid=rs2.getInt("id");
			fname=rs2.getString("name");
			rid=id+","+name+","+Integer.toString(fid)+","+fname;
			%>
			<tr><td width="134">Name:&nbsp;&nbsp;<%=rs2.getString("name")%></td></tr>
			<tr><td><img src="viewimage.jsp?id=<%=fid%>" alt="" width="120" height="99" /></td>
            <td width="109"><a href="request.jsp?id=<%=rid%>"><font color="#FFFFCC" size="3"><strong>Send 
              Request</strong></font></a></td>
          </tr>
			
			<%}%>
		</table>

		</form>
		<%
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
