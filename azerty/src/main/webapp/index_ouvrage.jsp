<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>La liste des ouvrages</title>
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
            font-weight: bold;
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
             font-weight: bold;
        }
        tr:first-child {
            background-color: gray; /* Set the background color for the first row */
            color: black ; /* Set the text color for the first row */
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
  
    <h1>La liste des ouvrages</h1>
    
    <table border="1" width="100%">
        <tr>
            <td>ID</td>
            <td>Titre</td>
            <td>Auteur</td>
            <td>Rayon</td>
            
        </tr>
        <%
            String url  = "jdbc:mysql://localhost:3306/gestion";
            String user = "root";
            String pwd  = "";
            int number = 0;
            Connection con = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, pwd);
                PreparedStatement pst = con.prepareStatement("SELECT * FROM ouvrage");
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
        %>
                    <tr>
                        <td><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                        <td><%=rs.getString(3) %></td>
                        <td><%=rs.getString(4) %></td>
                        
                        
                    </tr>
        <%
                }
                pst = con.prepareStatement("SELECT COUNT(*) FROM ouvrage");
                rs = pst.executeQuery();
                rs.next();
                number = rs.getInt(1);
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
    Nombre des ouvrages : <%=number %><br>
    <a href="Ajouter_ouv.jsp">Ajouter un ouvrage</a>
</body>
</html>
