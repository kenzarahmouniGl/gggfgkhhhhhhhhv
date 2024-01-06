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
    <title>Liste des Emprunteur</title>
       <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            background-image: url('livre.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        header {
            background-color: #DEB887;
            color: #CD853F;
            padding: 10px;
            text-align: right;
            width: 100%;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin-top: 20px;
            background-color: #DEB887;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #A9A9A9;
            color: #00000;
        }

        a {
            text-decoration: none;
            color: #F08080;
        }

        a:hover {
            text-decoration: underline;
        }

        .add-button {
            background-color: #F08080;
            color: #fff;
            padding: 10px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            margin-top: 20px;
        }

        .add-button:hover {
            background-color: #ff6666;
        }
    </style>
</head>
<body>
     <header>
        Bonjour <%=login %><br>
        <a href="Logout">Logout</a>
    </header>
    <h1>Liste des Emprunteur</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Date Inscription</th>
            <th>Adresse</th>
            <th>Mobile</th>
            <th>Email</th>
              <th>type</th>
            <th>Action</th>
        </tr>
        <%
        String url  = "jdbc:mysql://localhost:3306/gestion";
        String user = "root";
        String pwd  = "";
        int number = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pwd);
            PreparedStatement pst=con.prepareStatement("SELECT * FROM emprunteur");
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
                    <td><%=rs.getString(8) %></td>
                   <td><a href="Delete?id=<%=rs.getString(1)%>">Supprimer</a>
                   <a href="Modifier?id=<%=rs.getString(1)%>">Modifier</a></td>
                   
                </tr>
                
                <%
            }
            pst=con.prepareStatement("SELECT COUNT(*) FROM emprunteur");
            rs = pst.executeQuery();
            rs.next();
            number = rs.getInt(1);
            rs.close();
            pst.close();
            con.close();
        } catch(Exception e) {
            System.out.print(e);
        }
        %>
    </table>
    Nombre des emprunteur : <%=number %><br>
    <a href="ajouter.jsp">Ajouter un emprunteur</a>
</body>
</html>
