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
<title>Ajouter un enseignant</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div align="right" class="container pt-4 ps-2 pe-2">
    Bonjour <%=login %><br>   
	 <a href="settings.jsp" class="btn btn-primary">Settings</a>         
    <a href="Logout">Logout</a>
</div>
<div class="container ps-3 pe-3">
        <h1>Ajouter un Enseignant</h1>
        <form method="POST" action="Ajouterenseignant">
            <table class="table">
                <tr>
                    <td>Nom</td>
                    <td><input type="text" name="nom" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Ajouter" class="btn btn-primary">
                        <input type="reset" value="Rétablir" class="btn btn-secondary">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>