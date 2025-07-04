<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Liste des Adhérents Pénalisés</title>
</head>
<body>
    <h2>Liste des Prolongement en attente</h2>
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
            <th>ID Prolongement</th>
            <th>Prêt ID</th>
            <th>Adhérent</th>
            <th>Exemplaire</th>
            <th>Date de Remise Actuelle</th>
            <th>Jours Demandés</th>
            <th>Nouvelle Date de Remise</th>
            <th>Action</th>
        </tr>
        <c:forEach var="prolongement" items="${prolongements}">
            <tr>
                <td>${prolongement.idProlongement}</td>
                <td>${prolongement.pret.idPret}</td>
                <td>${prolongement.pret.adherent.nom} ${prolongement.pret.adherent.prenom}</td>
                <td>${prolongement.pret.exemplaire.titre}</td>
                <td>${prolongement.pret.dateRemise}</td>
                <td>${prolongement.nbJourProlongement}</td>
                <td>${prolongement.pret.dateRemise.plusDays(prolongement.nbJourProlongement)}</td>
                <td>
                    <form action="prolongement-decision" method="post" style="display:inline;">
                        <input type="hidden" name="prolongementId" value="${prolongement.idProlongement}">
                        <input type="hidden" name="action" value="accept">
                        <input type="submit" value="Accepter">
                    </form>
                    <form action="prolongement-decision" method="post" style="display:inline;">
                        <input type="hidden" name="prolongementId" value="${prolongement.idProlongement}">
                        <input type="hidden" name="action" value="reject">
                        <input type="submit" value="Rejeter">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="exemplaires">Retour</a>
</body>
</html>