package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Modifier")
public class Modifier extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            String id = request.getParameter("id");

            String url = "jdbc:mysql://localhost:3306/gestion";
            String user = "root";
            String pwd = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pwd);

                PreparedStatement pst = con.prepareStatement("SELECT * FROM emprunteur WHERE id=?");
                pst.setString(1, id);

                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    // Vous pouvez stocker les données dans des attributs de requête pour les utiliser dans la page de modification
                    request.setAttribute("id", rs.getString(1));
                    request.setAttribute("nom", rs.getString(2));
                    request.setAttribute("prenom", rs.getString(3));
                    request.setAttribute("date", rs.getString(4));
                    request.setAttribute("prenom", rs.getString(5));
                    request.setAttribute("adresse", rs.getString(6));
                    request.setAttribute("mobile", rs.getString(7));
                    request.setAttribute("email", rs.getString(8));
                    request.setAttribute("type", rs.getString(9));
                   

                    // Redirigez vers la page de modification
                    request.getRequestDispatcher("/modifier.jsp").forward(request, response);
                } else {
                    // L'emprunteur avec cet ID n'existe pas
                    // Ajoutez ici la gestion des erreurs ou des messages appropriés
                    response.sendRedirect("index.jsp");
                }

                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace(); // Gérer les exceptions de manière appropriée
            }
        } else {
            response.sendRedirect("auth.jsp");
        }
    }
}
