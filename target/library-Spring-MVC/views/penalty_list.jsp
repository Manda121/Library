<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Liste des Exemplaires - Bibliothèque</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/styles.css">
    <script src="/resources/js/scripts.js"></script>
</head>

<body>
    <jsp:include page="sidebar.jsp" />
    <div class="container">
        <jsp:include page="header.jsp" />
        <h2>Liste des Adhérents Pénalisés</h2>
        <c:if test="${not empty message}">
            <c:choose>
                <c:when test="${fn:contains(message, 'succès')}">
                    <p class="message-success">${message}</p>
                </c:when>
                <c:otherwise>
                    <p class="message-error">${message}</p>
                </c:otherwise>
            </c:choose>
        </c:if>
        <table>
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
        <a href="exemplaires" class="return-link">Retour</a>
    </div>
</body>
</html>