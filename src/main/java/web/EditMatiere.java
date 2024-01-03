package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditMatiere")
public class EditMatiere extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            String id = request.getParameter("id");

            String url = "jdbc:mysql://localhost:9091/JEE_Etudiant";
            String user = "root";
            String pwd = "Admin";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pwd);
                PreparedStatement pst = con.prepareStatement("SELECT * FROM matiere WHERE id=?");
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    // Set matiere details as attributes
                    request.setAttribute("id", rs.getString("id"));
                    request.setAttribute("nom_matiere", rs.getString("nom_matiere"));
                    request.setAttribute("note_ds", rs.getString("note_ds"));
                    request.setAttribute("note_examen", rs.getString("note_examen"));
                    request.setAttribute("moyen", rs.getString("moyen"));
                    request.setAttribute("etudiant_id", rs.getString("etudiant_id"));
                    request.setAttribute("enseignant_id", rs.getString("enseignant_id"));

                    // Forward to the edit_matiere.jsp
                    RequestDispatcher rd = request.getRequestDispatcher("edit_matiere.jsp");
                    rd.forward(request, response);
                } else {
                    response.sendRedirect("index.jsp"); // Or handle the case where matiere not found
                }

                rs.close();
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
