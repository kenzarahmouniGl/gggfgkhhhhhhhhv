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
    <title>Ajouter un Emprunteur</title>
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

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 80%;
            margin: 20px;
            padding: 20px;
            background-color: #DEB887;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            margin-top: 20px;
            background-color: #DEB887;
            box-shadow:#DEB887;
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

        input[type="text"],
        input[type="date"],
        input[type="number"],
        select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #F08080;
            color: #fff;
            cursor: pointer;
            border: none;
            padding: 12px;
            border-radius: 4px;
            width: 50%;
            align-self: center;
        }

        input[type="submit"]:hover {
            background-color: #ff6666;
        }
    </style>
</head>
<body>
    <header>
        Bonjour <%=login %><br>
        <a href="Logout">Logout</a>
    </header>
    <h1>Ajouter un Emprunteur</h1>
    <form method="POST" action="Ajouter">
        <table>
            <tr>
                <td>Nom</td>
                <td><input type="text" name="nom" required></td>
                <td>Prénom</td>
                <td><input type="text" name="prenom" required></td>
            </tr>
            <tr>
                <td>Date de naissance</td>
                <td><input type="date" name="date" required></td>
                <td>Adresse</td>
                <td><input type="text" name="adresse" required></td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td><input type="number" name="mobile" required></td>
                <td>Email</td>
                <td><input type="text" name="email" required></td>
            </tr>
            <tr>
                <td>Type</td>
                <td colspan="3">
                    <select name="type" required>
                        <option value="etudiant">Étudiant</option>
                        <option value="etudiant etranger">Étudiant étranger</option>
                        <option value="enseignant">Enseignant</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <input type="submit" value="Ajouter">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
