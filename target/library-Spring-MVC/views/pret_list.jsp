<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Liste des Adhérents Pénalisés - Bibliothèque</title>
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
        <h2>Liste des Prêts en Cours</h2>
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
                        <form action="pret-return" method="post" class="inline-form">
                            <input type="hidden" name="pretId" value="${pret.idPret}">
                            <input type="submit" value="Rendre" class="action-button">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="exemplaires" class="return-link">Retour</a>
    </div>
    <script>
// Afficher/masquer la sidebar
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('active');
}

// Filtrer le tableau
function filterTable() {
    const input = document.getElementById('searchInput');
    const filter = input.value.toLowerCase();
    const table = document.querySelector('table');
    const rows = table.getElementsByTagName('tr');

    for (let i = 1; i < rows.length; i++) {
        const cells = rows[i].getElementsByTagName('td');
        let match = false;
        for (let j = 0; j < cells.length; j++) {
            if (cells[j].textContent.toLowerCase().includes(filter)) {
                match = true;
                break;
            }
        }
        rows[i].style.display = match ? '' : 'none';
    }
}
    </script>
</body>
</html>