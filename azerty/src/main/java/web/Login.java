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



@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String login = request.getParameter("login");
		String passw = request.getParameter("pwd");
		
		String url  = "jdbc:mysql://localhost:3306/gestion";
		String user = "root";
		String pwd  = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pwd);
			PreparedStatement pst=con.prepareStatement("SELECT id FROM users WHERE login=? AND password=?");
			pst.setString(1,login);
			pst.setString(2,passw);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("login", login);
				response.sendRedirect("index.jsp");
			}else response.sendRedirect("auth.jsp");
			
			rs.close();
			pst.close();
			con.close();
		}catch(Exception e) {
			System.out.print(e);
		}
	}
}