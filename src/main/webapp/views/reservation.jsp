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
        <h2>Demande de Réservation</h2>
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
        <form action="reservation" method="post" class="form">
            <label class="form-label">
                Exemplaire:
                <select name="exemplaireId" required class="form-select">
                    <option value="">Sélectionner un exemplaire</option>
                    <c:forEach var="exemplaire" items="${exemplaires}">
                        <option value="${exemplaire.idExemplaire}">${exemplaire.titre} (${exemplaire.nom})</option>
                    </c:forEach>
                </select>
            </label>
            <label class="form-label">
                Date de prêt souhaitée:
                <input type="date" name="datePret" required class="form-input">
            </label>
            <input type="submit" value="Réserver" class="action-button">
        </form>
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