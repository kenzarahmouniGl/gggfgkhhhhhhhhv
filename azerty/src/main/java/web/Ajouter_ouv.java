package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Ajouter")
public class Ajouter_ouv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String titre = request.getParameter("titre");
        String auteur = request.getParameter("auteur");
        String rayon = request.getParameter("rayon"); // Correction ici

        String url = "jdbc:mysql://localhost:3306/gestion";
        String user = "root";
        String pwd = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pwd);
            PreparedStatement pst = con.prepareStatement("INSERT INTO ouvrage (titre,auteur,rayon) VALUES (?,?,?)");
            pst.setString(1, titre);
            pst.setString(2, auteur);
            pst.setString(3, rayon);
            pst.executeUpdate();
            response.sendRedirect("index.jsp");
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace(); // Utilisation de e.printStackTrace() au lieu de System.out.print(e)
        }
    }
}
