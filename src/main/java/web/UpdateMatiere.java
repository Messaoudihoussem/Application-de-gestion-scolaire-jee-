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

@WebServlet("/UpdateMatiere")
public class UpdateMatiere extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nom_matiere = request.getParameter("nom_matiere");
            double note_ds = Double.parseDouble(request.getParameter("note_ds"));
            double note_examen = Double.parseDouble(request.getParameter("note_examen"));
            int etudiant_id = Integer.parseInt(request.getParameter("etudiant_id"));
            int enseignant_id = Integer.parseInt(request.getParameter("enseignant_id"));

            // Calculate moyen
            double moyen = note_ds * 0.3 + note_examen * 0.7;

            String url = "jdbc:mysql://localhost:9091/JEE_Etudiant";
            String user = "root";
            String pwd = "Admin";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pwd);
                PreparedStatement pst = con.prepareStatement(
                        "UPDATE matiere SET nom_matiere=?, note_ds=?, note_examen=?, moyen=?, etudiant_id=?, enseignant_id=? WHERE id=?");
                pst.setString(1, nom_matiere);
                pst.setDouble(2, note_ds);
                pst.setDouble(3, note_examen);
                pst.setDouble(4, moyen);
                pst.setInt(5, etudiant_id);
                pst.setInt(6, enseignant_id);
                pst.setInt(7, id);
                pst.executeUpdate();
                response.sendRedirect("index.jsp");
                pst.close();
                con.close();
            } catch (Exception e) {
                System.out.print(e);
            }
        } else
            response.sendRedirect("auth.jsp");
    }
}
