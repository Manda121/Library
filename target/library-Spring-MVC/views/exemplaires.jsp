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
        <h2>Liste des Exemplaires</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Titre</th>
                <th>Description</th>
                <th>Âge Minimal</th>
            </tr>
            <c:forEach var="exemplaire" items="${exemplaires}">
                <tr>
                    <td>${exemplaire.idExemplaire}</td>
                    <td>${exemplaire.nom}</td>
                    <td>${exemplaire.titre}</td>
                    <td>${exemplaire.description}</td>
                    <td>${exemplaire.ageMinimal}</td>
                </tr>
            </c:forEach>
        </table>
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