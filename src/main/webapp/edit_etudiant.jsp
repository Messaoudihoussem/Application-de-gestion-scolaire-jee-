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
    <title>Edit Etudiant</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div align="right" class="container pt-4 ps-2 pe-2">
        Bonjour <%=login %><br>   
        <a href="settings.jsp" class="btn btn-primary">Settings</a>         
        <a href="Logout">Logout</a>
    </div>
    <div class="container pt-4 ps-2 pe-2">
        <h1>Edit Etudiant</h1>
        <form method="POST" action="UpdateEtudiant">
            <input type="hidden" name="id" value="${id}" />
            <div class="mb-3">
                <label for="nom" class="form-label">Nom:</label>
                <input type="text" name="nom" value="${nom}" class="form-control" required />
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Date inscription:</label>
                <input type="date" name="date" value="${date}" class="form-control" required />
            </div>
            <div class="mb-3">
                    <input type="radio" name="sexe" value="Femme" checked> Femme
                    <input type="radio" name="sexe" value="Homme"> Homme
            </div>
            <input type="submit" value="Update" class="btn btn-primary" />
            <a href="index.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
    <!-- Add any additional content you need at the bottom of the page -->
</body>
</html>