<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%
String login = "";
if(session.getAttribute("login")!=null){
    login = session.getAttribute("login").toString();
}else{
    response.sendRedirect("auth.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div align="right" class="container pt-4 ps-2 pe-2">
    Bonjour <%=login %><br>   
	 <a href="settings.jsp" class="btn btn-primary">Settings</a>         
    <a href="Logout">Logout</a>
</div>
    <div class="container pt-4 ps-2 pe-2">
        <h1>Settings</h1>
        <form method="post" action="ChangePassword">
            <div class="mb-3">
                <label for="newPassword" class="form-label">New Password</label>
                <input type="password" name="newPassword" id="newPassword" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Change Password</button>
        </form>
    </div>
</body>
</html>