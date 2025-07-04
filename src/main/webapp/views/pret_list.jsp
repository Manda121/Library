<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Liste des Prêts</title>
</head>
<body>
    <h2>Liste des Prêts en Cours</h2>

    <c:if test="${not empty message}">
        <c:choose>
            <c:when test="${fn:contains(message, 'succès')}">
                <p style="color: green">${message}</p>
            </c:when>
            <c:otherwise>
                <p style="color: red">${message}</p>
            </c:otherwise>
        </c:choose>
    </c:if>
    <table border="1">
        <tr>
            <th>ID Prêt</th>
            <th>Adhérent</th>
            <th>Exemplaire</th>
            <th>Date de Prêt</th>
            <th>Date de Remise Prévue</th>
            <th>Action</th>
        </tr>
        <c:forEach var="pret" items="${prets}">
            <tr>
                <td>${pret.idPret}</td>
                <td>${pret.adherent.nom} ${pret.adherent.prenom}</td>
                <td>${pret.exemplaire.titre}</td>
                <td>${pret.datePret}</td>
                <td>${pret.dateRemise}</td>
                <td>
                    <form action="pret-return" method="post" style="display:inline;">
                        <input type="hidden" name="pretId" value="${pret.idPret}">
                        <input type="submit" value="Rendre">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="exemplaires">Retour</a>
</body>
</html>