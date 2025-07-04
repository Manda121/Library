<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Demande de Réservation</title>
</head>
<body>
    <h2>Demande de Réservation</h2>

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
    <form action="reservation" method="post">
        <label>Exemplaire:
            <select name="exemplaireId" required>
                <option value="">Sélectionner un exemplaire</option>
                <c:forEach var="exemplaire" items="${exemplaires}">
                    <option value="${exemplaire.idExemplaire}">${exemplaire.titre} (${exemplaire.nom})</option>
                </c:forEach>
            </select>
        </label><br>
        <label>Date de prêt souhaitée:
            <input type="date" name="datePret" required>
        </label><br>
        <input type="submit" value="Réserver">
    </form>
    <a href="exemplaires">Retour</a>
</body>
</html>