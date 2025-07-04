<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion</title>
</head>
<body>
    <h2>Connexion</h2>
    <c:if test="${not empty error}">
        <p style="color: red">${error}</p>
    </c:if>
    <form action="login" method="post">
        <label>Email: <input type="email" name="email" required value="jean.durand@email.com"></label><br>
        <label>Mot de passe: <input type="password" name="password" required value="mdp"></label><br>
        <input type="submit" value="Se connecter">
    </form>
</body>
</html>