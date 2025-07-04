<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Liste des Adhérents Pénalisés</title>
</head>
<body>
    <h2>Liste des Adhérents Pénalisés</h2>
    <c:if test="${not empty message}">
        <c:choose>
            <c:when test="${fn:contains(message, 'succès')}">
                <p style="color: green;">${message}</p>
            </c:when>
            <c:otherwise>
                <p style="color: red;">${message}</p>
            </c:otherwise>
        </c:choose>
    </c:if>
    <table border="1">
        <tr>
            <th>ID Adhérent</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        <c:forEach var="adherent" items="${adherents}">
            <tr>
                <td>${adherent.idAdherent}</td>
                <td>${adherent.nom}</td>
                <td>${adherent.prenom}</td>
                <td>${adherent.email}</td>
                <td>
                    <form action="remove-penalty" method="post" style="display:inline;">
                        <input type="hidden" name="adherentId" value="${adherent.idAdherent}">
                        <input type="submit" value="Lever Pénalité">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="exemplaires">Retour</a>
</body>
</html>