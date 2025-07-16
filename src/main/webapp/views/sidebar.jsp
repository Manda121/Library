<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<button id="toggleSidebar" onclick="toggleSidebar()">☰</button>
<nav id="sidebar" class="sidebar">
    <div class="sidebar-header">
        <h3>Bibliothèque</h3>
        <p>Système de Gestion</p>
        <button class="theme-toggle" onclick="toggleTheme()">
            Changer le thème
        </button>
    </div>
    <c:choose>
        <c:when test="${sessionScope.user['class'].simpleName == 'Adherent'}">
            <ul>
                <li><a href="reservation">📚 Réserver</a></li>
                <li><a href="prolongement">⏱️ Prolongement</a></li>
                <li><a href="adherent-status-update">🔄 Mettre à jour le statut</a></li>
                <li><a href="#">📋 Voir mes réservations</a></li>
                <li><a href="reabonnement">🔄 Se réabonner</a></li>
                <li><a href="logout">🚪 Se déconnecter</a></li>
            </ul>
        </c:when>
        <c:when test="${sessionScope.user['class'].simpleName == 'Bibliothecaire'}">
            <ul>
                <li><a href="exemplaires">📖 Liste des exemplaires</a></li>
                <li><a href="pret">➕ Faire un prêt</a></li>
                <li><a href="pret-list">📝 Remise de prêt</a></li>
                <li><a href="penalty-list">⚠️ Voir les adhérents pénalisés</a></li>
                <li><a href="reservation-list">📋 Voir les réservations en attente</a></li>
                <li><a href="prolongement-list">⏰ Gérer les demandes de prolongement</a></li>
                <li><a href="adherent-status-update">👥 Mettre à jour les statuts des adhérents</a></li>
                <li><a href="exemplaire-crud">🛠️ Gérer les exemplaires</a></li>
                <li><a href="livres">📊 Voir la liste des livres</a></li>
                <li><a href="logout">🚪 Se déconnecter</a></li>
            </ul>
        </c:when>
    </c:choose>
</nav>