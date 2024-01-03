package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditEtudiant")
public class EditEtudiant extends HttpServlet {
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
                PreparedStatement pst = con.prepareStatement("SELECT * FROM etudiant WHERE id=?");
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    // Set etudiant details as attributes
                    request.setAttribute("id", rs.getString("id"));
                    request.setAttribute("nom", rs.getString("nom"));
                    request.setAttribute("date", rs.getString("date_ins"));
                    request.setAttribute("sexe", rs.getString("sexe"));
                    // Add more attributes if needed

                    // Forward to the edit_etudiant.jsp
                    request.getRequestDispatcher("edit_etudiant.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp"); // Or handle the case where etudiant not found
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
