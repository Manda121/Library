<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
        <title>Connexion - Bibliothèque</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="styles.css">
    </head>
    <style>
            :root {
    --primary-color: #8B4513;
    --secondary-color: #D2691E;
    --accent-color: #F4A460;
    --text-color: #2F1B14;
    --background-color: #FDF5E6;
    --sidebar-bg: #FAEBD7;
    --card-bg: #FFFFFF;
    --border-color: #DEB887;
    --hover-color: #A0522D;
    --success-color: #228B22;
    --error-color: #B22222;
    --shadow-color: rgba(139, 69, 19, 0.1);
    --shadow-hover: rgba(139, 69, 19, 0.2);
    --gradient-primary: linear-gradient(135deg, #8B4513 0%, #D2691E 100%);
    --gradient-secondary: linear-gradient(135deg, #F4A460 0%, #DEB887 100%);
}

/* Reset des styles par défaut */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Style général du body de login */
.login-body {
    font-family: 'Merriweather', serif;
    line-height: 1.6;
    color: var(--text-color);
    background: var(--gradient-secondary);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
    position: relative;
}

/* Motif de livres en arrière-plan pour la cohérence */
.login-body::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: 
        repeating-linear-gradient(
            45deg,
            transparent,
            transparent 30px,
            rgba(139, 69, 19, 0.03) 30px,
            rgba(139, 69, 19, 0.03) 35px,
            transparent 35px,
            transparent 40px,
            rgba(139, 69, 19, 0.05) 40px,
            rgba(139, 69, 19, 0.05) 45px,
            transparent 45px,
            transparent 80px
        ),
        repeating-linear-gradient(
            -45deg,
            transparent,
            transparent 40px,
            rgba(139, 69, 19, 0.02) 40px,
            rgba(139, 69, 19, 0.02) 45px,
            transparent 45px,
            transparent 90px
        );
    z-index: 1;
}

/* Conteneur du formulaire */
.login-container {
    background-color: var(--card-bg);
    padding: 2.5rem;
    border-radius: 15px;
    box-shadow: 0 8px 25px var(--shadow-color);
    max-width: 420px;
    width: 100%;
    text-align: center;
    position: relative;
    z-index: 2;
    border: 1px solid var(--border-color);
    animation: slideUp 0.6s ease-out;
}

/* Animation d'entrée */
@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Titre */
.login-title {
    font-size: 2.2rem;
    font-weight: 700;
    margin-bottom: 1.8rem;
    color: var(--primary-color);
    text-shadow: 1px 1px 2px var(--shadow-color);
}

/* Message d'erreur */
.error-message {
    color: var(--error-color);
    margin-bottom: 1.5rem;
    font-size: 0.95rem;
    background-color: rgba(178, 34, 34, 0.1);
    padding: 0.75rem;
    border-radius: 8px;
    border-left: 4px solid var(--error-color);
    text-align: left;
}

/* Style du formulaire */
.login-form {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

.form-label {
    display: flex;
    flex-direction: column;
    text-align: left;
    font-size: 1rem;
    color: var(--text-color);
    font-weight: 600;
}

.form-input {
    padding: 12px 15px;
    margin-top: 0.5rem;
    border: 2px solid var(--border-color);
    border-radius: 8px;
    font-size: 1rem;
    font-family: 'Merriweather', serif;
    background-color: var(--background-color);
    color: var(--text-color);
    transition: all 0.3s ease;
}

.form-input:focus {
    border-color: var(--primary-color);
    outline: none;
    box-shadow: 0 0 0 3px rgba(139, 69, 19, 0.1);
    background-color: var(--card-bg);
}

.form-input:hover {
    border-color: var(--secondary-color);
}

/* Bouton de soumission */
.btn-primary {
    padding: 15px 20px;
    background: var(--gradient-primary);
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    box-shadow: 0 4px 15px var(--shadow-color);
}

.btn-primary:hover {
    background: var(--hover-color);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px var(--shadow-hover);
}

.btn-primary:active {
    transform: translateY(0);
    box-shadow: 0 2px 10px var(--shadow-color);
}

/* États de validation */
.form-input:valid {
    border-color: var(--success-color);
}

.form-input:invalid:not(:placeholder-shown) {
    border-color: var(--error-color);
}

/* Responsive design */
@media (max-width: 768px) {
    .login-container {
        padding: 2rem;
        margin: 10px;
    }
    
    .login-title {
        font-size: 1.8rem;
    }
    
    .btn-primary {
        font-size: 1rem;
        padding: 12px 18px;
    }
    
    .form-input {
        font-size: 0.95rem;
    }
}

@media (max-width: 480px) {
    .login-container {
        padding: 1.5rem;
    }
    
    .login-title {
        font-size: 1.6rem;
    }
    
    .form-label {
        font-size: 0.9rem;
    }
}
        </style>

    <body class="login-body">
        <div class="login-container">
            <h2 class="login-title">Connexion</h2>
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>
            <form action="login" method="post" class="login-form">
                <label class="form-label">
                    Email:
                    <input type="email" name="email" required value="jean.durand@email.com" class="form-input">
                </label>
                <label class="form-label">
                    Mot de passe:
                    <input type="password" name="password" required value="mdp" class="form-input">
                </label>
                <input type="submit" value="Se connecter" class="btn-primary">
            </form>
        </div>
    </body>

    </html>