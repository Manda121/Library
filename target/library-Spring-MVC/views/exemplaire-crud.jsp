<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Liste des Adhérents Pénalisés</title>
</head>
<body>
    <h2>Liste des Adhérents Pénalisés</h2>
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
    <h3>Liste des Exemplaires</h3>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Description</th>
            <th>Age minimal</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="exemplaire" items="${exemplaires}">
            <tr>
                <form action="exemplaire-update" method="post">
                    <td>${exemplaire.idExemplaire}<input type="hidden" name="idExemplaire" value="${exemplaire.idExemplaire}"></td>
                    <td><input type="text" name="nom" value="${exemplaire.nom}" required></td>
                    <td><input type="text" name="description" value="${exemplaire.description}"></td>
                    <td><input type="number" name="ageMinimal" value="${exemplaire.ageMinimal}"></td>
                    <!-- <td>
                        <select name="livreId" required>
                            <c:forEach var="livre" items="${livres}">
                                <option value="${livre.idLivre}" ${livre.idLivre == exemplaire.livre.idLivre ? 'selected' : ''}>${livre.titre}</option>
                            </c:forEach>
                        </select>
                    </td> -->
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
        <label>Nom: <input type="text" name="nom" required></label><br>
        <label>Description: <input type="text" name="description"></label><br>
        <label>AgeMinimal: <input type="number" name="ageMinimal"></label><br>
        <input type="submit" value="Ajouter Exemplaire">
    </form>

    <!-- <h3>Ajouter un Livre</h3>
    <form action="livre-create" method="post">
        <label>Titre: <input type="text" name="titre" required></label><br>
        <label>ISBN: <input type="text" name="isbn" required></label><br>
        <label>Auteur: <input type="text" name="auteur"></label><br>
        <label>Année de Publication: <input type="number" name="anneePublication" min="0"></label><br>
        <input type="submit" value="Ajouter Livre">
    </form> -->

    <a href="exemplaires">Retour</a>
</body>
</html>