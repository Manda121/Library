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
        <h3>Liste des Exemplaires</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Description</th>
                <th>Âge Minimal</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="exemplaire" items="${exemplaires}">
                <tr>
                    <form action="exemplaire-update" method="post">
                        <td>${exemplaire.idExemplaire}<input type="hidden" name="idExemplaire" value="${exemplaire.idExemplaire}"></td>
                        <td><input type="text" name="nom" value="${exemplaire.nom}" required></td>
                        <td><input type="text" name="description" value="${exemplaire.description}"></td>
                        <td><input type="number" name="ageMinimal" value="${exemplaire.ageMinimal}"></td>
                        <td>
                            <input type="submit" value="Mettre à jour">
                            <a href="exemplaire-delete?idExemplaire=${exemplaire.idExemplaire}" onclick="return confirm('Voulez-vous vraiment supprimer cet exemplaire ?');">Supprimer</a>
                        </td>
                    </form>
                </tr>
            </c:forEach>
        </table>

        <h3>Ajouter un Exemplaire</h3>
        <form action="exemplaire-create" method="post">
            <label>Nom: <input type="text" name="nom" required></label>
            <label>Description: <input type="text" name="description"></label>
            <label>Âge Minimal: <input type="number" name="ageMinimal"></label>
            <input type="submit" value="Ajouter Exemplaire">
        </form>

        <a href="exemplaires">Retour</a>
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