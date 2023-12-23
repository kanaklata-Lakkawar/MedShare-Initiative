
<%@page import="model.Medicine"%>
<%@page import="controller.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
<%
HttpSession h=request.getSession();
String email=(String) h.getAttribute("email");
String pass = (String) h.getAttribute("pswd");
ArrayList<Medicine> list = new UserDao().trackReqMedicine();
%>
<%
String role=new UserDao().signin(email,pass);
    if ("admin@gmail.com".equals(email)) {
%>
    <%@ include file="header.html" %>
    <%@ include file="adminNav.html" %>
<%

    } 

else if (role.equals("Donar")){
	%>
	 <%@ include file="donar.jsp" %>
<%}
    else {
%>


    <%@ include file="ngo.jsp" %>
<%
    }
%>
<table class="table table-bordered">
        <thead>
            <tr>
               
                <th>Sr. No.</th>
                <th>NGO Name</th>
                <th>Sender's Name</th>
                <th>Medicine Brand Name</th>
                <th>Medicine Generic Name</th>
                <th>Sender's Mobile no.</th>
                <th>Quantity</th>
                
            </tr>
        </thead>
        <tbody>
            <% for (Medicine m : list) { %>
                <tr>
                    
                    <td><%= m.getMedId() %></td>
                    <td><%= m.getNgo() %></td>   
                    <td><%= (m.getSenderMail() != null) ? m.getSenderMail() : "-" %></td>
                    <td><%= m.getBrand() %></td>
                     <td><%= m.getGeneric() %></td>
                    <td><%= (m.getMob() != null) ? m.getMob() : "-" %></td>
                    <td><%=m.getQty() %></td>
                  
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>