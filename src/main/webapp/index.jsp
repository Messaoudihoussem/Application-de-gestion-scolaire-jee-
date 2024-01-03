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
    <title>Home Page</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div align="right" class="container pt-4 ps-2 pe-2">
    Bonjour <%=login %><br>   
	 <a href="settings.jsp" class="btn btn-primary">Settings</a>         
    <a href="Logout">Logout</a>
</div>


<div class="container ps-2 pe-2">
    <h1>Liste des Etudiants</h1>
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Date Inscription</th>
            <th>Sexe</th>
            <th>Action</th>
        </tr>

        <%
        String url  = "jdbc:mysql://localhost:9091/JEE_Etudiant";
        String user = "root";
        String pwd  = "Admin";
        int number = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pwd);
            PreparedStatement pst=con.prepareStatement("SELECT * FROM etudiant");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                %>

                <tr>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><a href="Delete?id=<%=rs.getString(1) %>" class="btn btn-danger">Supprimer</a>
                    <a href="EditEtudiant?id=<%=rs.getString("id") %>" class="btn btn-primary">Edit</a>

                    
                </tr>

                <%
            }
            pst=con.prepareStatement("SELECT COUNT(*) FROM etudiant");
            rs = pst.executeQuery();
            rs.next();
            number = rs.getInt(1);
            rs.close();
            pst.close();
            con.close();
        }catch(Exception e) {
            System.out.print(e);
        }
        %>
    </table>
    Nomber des etudiants : <%=number %><br>
    <a href="ajouter.jsp" class="btn btn-primary">Ajouter un etudiant</a>

<div style="margin-top: 40px;"></div>


    <h1>Liste des Matieres</h1>
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Nom Matiere</th>
            <th>Note DS</th>
            <th>Note Examen</th>
            <th>Moyen</th>
            <th>Etudiant ID</th>
            <th>Enseignant ID</th>
            <th>Action</th>
        </tr>

        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pwd);
            PreparedStatement pst=con.prepareStatement("SELECT * FROM matiere");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                %>

                <tr>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getString(5) %></td>
                    <td><%=rs.getString(6) %></td>
                    <td><%=rs.getString(7) %></td>
                    <td>
    					<a href="Deletematiere?id=<%=rs.getString(1) %>" class="btn btn-danger">Supprimer</a>
    					<a href="EditMatiere?id=<%=rs.getString("id") %>" class="btn btn-primary">Edit</a>
                </tr>

                <%
            }
            pst=con.prepareStatement("SELECT COUNT(*) FROM matiere");
            rs = pst.executeQuery();
            rs.next();
            number = rs.getInt(1);
            rs.close();
            pst.close();
            con.close();
        }catch(Exception e) {
            System.out.print(e);
        }
        %>
    </table>
    Nomber des matieres : <%=number %><br>
    <a href="ajoutermatiere.jsp" class="btn btn-primary">Ajouter une matiere</a>
    
    
    <div style="margin-top: 40px;"></div>


    <h1>Liste des enseignants</h1>
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Nom enseignant</th>
            <th>Action</th>
        </tr>

        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pwd);
            PreparedStatement pst=con.prepareStatement("SELECT * FROM enseignant");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                %>

                <tr>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td>
    					<a href="Deleteenseignant?id=<%=rs.getString(1) %>" class="btn btn-danger">Supprimer</a>
    					<a href="EditEnseignant?id=<%=rs.getString("id") %>" class="btn btn-primary">Edit</a>
    					
                </tr>

                <%
            }
            pst=con.prepareStatement("SELECT COUNT(*) FROM enseignant");
            rs = pst.executeQuery();
            rs.next();
            number = rs.getInt(1);
            rs.close();
            pst.close();
            con.close();
        }catch(Exception e) {
            System.out.print(e);
        }
        %>
    </table>
    Nomber des matieres : <%=number %><br>
    <a href="ajouterenseignant.jsp" class="btn btn-primary">Ajouter un enseignant</a>

    
    
</div>
<div style="margin-top: 80px;"></div>

</body>
