
package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateEnseignant")
public class UpdateEnseignant extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            String id = request.getParameter("id");
            String nom = request.getParameter("nom");
            // Get other attributes as needed

            String url = "jdbc:mysql://localhost:9091/JEE_Etudiant";
            String user = "root";
            String pwd = "Admin";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pwd);
                PreparedStatement pst = con.prepareStatement("UPDATE enseignant SET nom=? WHERE id=?");
                pst.setString(1, nom);
                pst.setString(2, id);
                // Set other parameters and update the SQL query accordingly

                pst.executeUpdate();
                response.sendRedirect("index.jsp");

                pst.close();
                con.close();
            } catch (Exception e) {
                System.out.print(e);
            }
        } else {
            response.sendRedirect("auth.jsp");
        }
    }
}
