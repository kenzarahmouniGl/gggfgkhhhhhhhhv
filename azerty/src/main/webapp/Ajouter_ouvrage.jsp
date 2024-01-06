<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Ajouter</title>
       <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('livre.jpg'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #DEB887;
        }

        form {
            background-color: rgba(1, 1, 0, 0.7); 
            padding: 80px;
            border-radius: 20px;
            /*box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);*/
            width: 500px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 5px;
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border: none;
            padding: 12px;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
  
    <form method="POST" action="Ajouter">
        <table>
            <tr>
                <td>Titre</td>
                <td><input type="text" name="titre" required></td>
            </tr>
            <tr>
                <td>Auteur</td>
                <td><input type="text" name="auteur" required></td>
            </tr>
            <tr>
                <td>Rayon</td>
                <td><input type="text" name="rayon" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Ajouter"></td>
            </tr>
        </table>
    </form>
</body>

</html>