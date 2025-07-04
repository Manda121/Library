<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Demande de Prolongement</title>
</head>
<body>
    <h2>Demande de Prolongement</h2>

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
    <form action="prolongement" method="post">
        <label>Prêt:
            <select name="pretId" required>
                <option value="">Sélectionner un prêt</option>
                <c:forEach var="pret" items="${prets}">
                    <option value="${pret.idPret}">${pret.exemplaire.titre} (Remise: ${pret.dateRemise})</option>
                </c:forEach>
            </select>
        </label><br>
        <label>Nombre de jours de prolongement:
            <input type="number" name="nbJourProlongement" min="1" required>
        </label><br>
        <input type="submit" value="Demander Prolongement">
    </form>
    <a href="exemplaires">Retour</a>
</body>
</html>