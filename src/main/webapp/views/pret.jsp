<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Enregistrer un prêt</title>
</head>
<body>
    <h2>Enregistrer un prêt</h2>
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

    <form action="pret" method="post">
        <label>Exemplaire:
            <select name="exemplaireId" required>
                <option value="">Sélectionner un exemplaire</option>
                <c:forEach var="exemplaire" items="${exemplaires}">
                    <option value="${exemplaire.idExemplaire}">${exemplaire.titre} (${exemplaire.nom})</option>
                </c:forEach>
            </select>
        </label><br>
        <label>Adhérent:
            <select name="adherentId" required>
                <option value="">Sélectionner un adhérent</option>
                <c:forEach var="adherent" items="${adherents}">
                    <option value="${adherent.idAdherent}">${adherent.nom} ${adherent.prenom}</option>
                </c:forEach>
            </select>
        </label><br>
        <label>Date de remise prévue:
            <input type="date" name="dateRemise" required>
        </label><br>
        <input type="submit" value="Enregistrer le prêt">
    </form>
    <a href="exemplaires">Retour</a>
</body>
</html>