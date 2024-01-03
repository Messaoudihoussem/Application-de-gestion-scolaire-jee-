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
<title>ajoutermatiere</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div align="right" class="container pt-4 ps-2 pe-2">
    Bonjour <%=login %><br>   
	 <a href="settings.jsp" class="btn btn-primary">Settings</a>         
    <a href="Logout">Logout</a>
</div>
<div class="container ps-3 pe-3">
    <h1>Ajouter une Matiere</h1>
    <form method="POST" action="Ajoutermatiere">
        <table class="table">
            <tr>
                <td>nom_matiere</td>
                <td><input type="text" name="nom_matiere" required></td>
            </tr>
            <tr>
                <td>note_ds</td>
                <td><input type="number" step="0.5" name="note_ds" required></td>
            </tr>
            <tr>
                <td>note_examen</td>
                <td><input type="number" step="0.5" name="note_examen" required></td>
            </tr>
 			<tr>
                    <td>etudiant_id</td>
                    <td>
                        <!-- Dropdown list for etudiant_id -->
                        <select name="etudiant_id" class="form-select" required>
                            <%
                            String url  = "jdbc:mysql://localhost:9091/JEE_Etudiant";
                            String user = "root";
                            String pwd  = "Admin";
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection(url, user, pwd);
                                PreparedStatement pst=con.prepareStatement("SELECT id FROM etudiant");
                                ResultSet rs = pst.executeQuery();
                                while(rs.next()){
                                    %>
                                    <option value="<%= rs.getInt("id") %>"><%= rs.getInt("id") %></option>
                                    <%
                                }
                                rs.close();
                                pst.close();
                                con.close();
                            } catch(Exception e) {
                                System.out.print(e);
                            }
                            %>
                        </select>
                    </td>
                </tr>
            <tr>
            
           <tr>
    <td>enseignant_id</td>
    <td>
        <!-- Dropdown list for enseignant_id -->
        <select name="enseignant_id" class="form-select" required>
            <%
            try {
                // Assuming you have an enseignant table with columns id and nom

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pwd);
                PreparedStatement pst = con.prepareStatement("SELECT id, nom FROM enseignant");
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
            %>
            <option value="<%= rs.getInt("id") %>"><%= rs.getString("nom") %></option>
            <%
                }
                rs.close();
                pst.close();
                con.close();
            } catch(Exception e) {
                System.out.print(e);
            }
            %>
        </select>
    </td>
</tr>

            <tr>
                <td colspan="2">
                    <input type="submit" value="Ajouter" class="btn btn-primary">
                    <input type="reset" value="Retablir" class="btn btn-secondary">
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>