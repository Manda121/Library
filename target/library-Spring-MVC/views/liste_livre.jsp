<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Liste des Livres</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Liste des Livres</h2>
    <table>
        <tr>
            <th>ID Livre</th>
            <th>Nombre de Pages</th>
            <th>Titre</th>
        </tr>
        <c:forEach items="${livres}" var="livre">
            <tr>
                <td>${livre.idLivre}</td>
                <td>${livre.nbPage}</td>
                <td>${livre.exemplaire.titre}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>