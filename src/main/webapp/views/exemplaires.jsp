<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Exemplaires</title>
</head>
<body>
    <h2>Liste des Exemplaires</h2>
    <table border="1">
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

    <h3>Actions</h3>
    <c:choose>
        <c:when test="${sessionScope.user['class'].simpleName == 'Adherent'}">
            <ul>
                <li><a href="reservation">Réserver</a></li>
                <li><a href="prolongement">prolongement</a></li>
                <li><a href="adherent-status-update">Mettre à jour le statut</a></li>
                <li><a href="#">Voir mes réservations</a></li>
                <li><a href="#">Se réabonner</a></li>
                <li><a href="logout">Se déconnecter</a></li>
            </ul>
        </c:when>
        <c:when test="${sessionScope.user['class'].simpleName == 'Bibliothecaire'}">
            <ul>
                <li><a href="pret">faire un pret</a></li>
                <li><a href="pret-list">remise de pret</a></li>
                <li><a href="penalty-list">Voir les adhérents pénalisés</a></li>
                <li><a href="reservation-list">Voir les réservations en attente</a></li>
                <li><a href="prolongement-list">Gérer les demandes de prolongement</a></li>
                <li><a href="adherent-status-update">Mettre à jour les statuts des adhérents</a></li>
                <li><a href="exemplaire-crud">Gérer les exemplaires</a></li>
                <li><a href="#">Voir les prêts en cours</a></li>
                <li><a href="logout">Se déconnecter</a></li>
            </ul>
        </c:when>
    </c:choose>
</body>
</html>