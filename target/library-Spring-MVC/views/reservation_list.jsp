<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Liste des Réservations en Attente</title>
</head>
<body>
    <h2>Liste des Réservations en Attente</h2>
    
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
            <th>ID Réservation</th>
            <th>Adhérent</th>
            <th>Exemplaire</th>
            <th>Date de Prêt Souhaitée</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="reservation" items="${reservations}">
            <tr>
                <td>${reservation.idReservation}</td>
                <td>${reservation.adherent.nom} ${reservation.adherent.prenom}</td>
                <td>${reservation.exemplaire.titre}</td>
                <td>${reservation.datePret}</td>
                <td>
                    <form action="reservation-action" method="post" style="display:inline;">
                        <input type="hidden" name="reservationId" value="${reservation.idReservation}">
                        <input type="hidden" name="action" value="accept">
                        <input type="submit" value="Accepter">
                    </form>
                    <form action="reservation-action" method="post" style="display:inline;">
                        <input type="hidden" name="reservationId" value="${reservation.idReservation}">
                        <input type="hidden" name="action" value="reject">
                        <input type="submit" value="Refuser">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="exemplaires">Retour</a>
</body>
</html>