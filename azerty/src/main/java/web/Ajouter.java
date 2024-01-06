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
import jakarta.servlet.http.HttpSession;


@WebServlet("/Ajouter")
public class Ajouter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null){
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String date = request.getParameter("date");
			String adresse = request.getParameter("adresse");
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String type = request.getParameter("type");
			
			String url  = "jdbc:mysql://localhost:3306/gestion";
			String user = "root";
			String pwd  = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, pwd);
				PreparedStatement pst=con.prepareStatement("INSERT INTO emprunteur (nom,prenom,date_naissance,adresse,mobile,email,type) VALUES (?,?,?,?,?,?,?)");
				pst.setString(1,nom);
				pst.setString(2,prenom);
				pst.setString(3,date);
				pst.setString(4,adresse);
				pst.setString(5,mobile);
				pst.setString(6,email);
				pst.setString(7,type);
				pst.executeUpdate();
				response.sendRedirect("index.jsp");
				pst.close();
				con.close();
			}catch(Exception e) {
				System.out.print(e);
			}
		}else response.sendRedirect("auth.jsp");
	}

}
