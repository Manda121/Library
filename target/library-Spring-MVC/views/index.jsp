<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bibliothèque - Gestion des Prêts</title>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
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

        /* Style général du body */
        body {
            font-family: 'Merriweather', serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: var(--background-color);
        }

        /* Hero section */
        .hero {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: var(--gradient-primary);
            position: relative;
            text-align: center;
            color: #fff;
            padding: 20px;
            overflow: hidden;
        }

        /* Motif de livres en arrière-plan */
        .hero::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: 
                /* Livres inclinés à 45 degrés */
                repeating-linear-gradient(
                    45deg,
                    transparent,
                    transparent 20px,
                    rgba(255, 255, 255, 0.05) 20px,
                    rgba(255, 255, 255, 0.05) 25px,
                    transparent 25px,
                    transparent 30px,
                    rgba(255, 255, 255, 0.08) 30px,
                    rgba(255, 255, 255, 0.08) 35px,
                    transparent 35px,
                    transparent 40px,
                    rgba(255, 255, 255, 0.06) 40px,
                    rgba(255, 255, 255, 0.06) 45px,
                    transparent 45px,
                    transparent 50px,
                    rgba(255, 255, 255, 0.04) 50px,
                    rgba(255, 255, 255, 0.04) 55px,
                    transparent 55px,
                    transparent 80px
                ),
                /* Livres inclinés à -45 degrés */
                repeating-linear-gradient(
                    -45deg,
                    transparent,
                    transparent 30px,
                    rgba(255, 255, 255, 0.03) 30px,
                    rgba(255, 255, 255, 0.03) 35px,
                    transparent 35px,
                    transparent 40px,
                    rgba(255, 255, 255, 0.05) 40px,
                    rgba(255, 255, 255, 0.05) 45px,
                    transparent 45px,
                    transparent 70px
                );
            z-index: 1;
        }

        /* Overlay pour assurer la lisibilité */
        .hero::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.3);
            z-index: 2;
        }

        /* Contenu du hero */
        .hero-content {
            position: relative;
            z-index: 3;
        }

        /* Style du texte de bienvenue */
        .hero h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            animation: fadeInUp 1s ease-out;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            animation: fadeInUp 1s ease-out 0.3s both;
        }

        /* Style du lien de login */
        .hero a {
            display: inline-block;
            padding: 15px 30px;
            background: var(--card-bg);
            color: var(--primary-color);
            text-decoration: none;
            font-size: 1.2rem;
            font-weight: 700;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px var(--shadow-color);
            animation: fadeInUp 1s ease-out 0.6s both;
        }

        .hero a:hover {
            background: var(--accent-color);
            color: var(--text-color);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px var(--shadow-hover);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .hero p {
                font-size: 1rem;
            }
            
            .hero a {
                font-size: 1rem;
                padding: 12px 24px;
            }
        }

        @media (max-width: 480px) {
            .hero h1 {
                font-size: 2rem;
            }
            
            .hero::before {
                background-image: 
                    repeating-linear-gradient(
                        45deg,
                        transparent,
                        transparent 15px,
                        rgba(255, 255, 255, 0.05) 15px,
                        rgba(255, 255, 255, 0.05) 20px,
                        transparent 20px,
                        transparent 25px,
                        rgba(255, 255, 255, 0.08) 25px,
                        rgba(255, 255, 255, 0.08) 30px,
                        transparent 30px,
                        transparent 60px
                    ),
                    repeating-linear-gradient(
                        -45deg,
                        transparent,
                        transparent 20px,
                        rgba(255, 255, 255, 0.03) 20px,
                        rgba(255, 255, 255, 0.03) 25px,
                        transparent 25px,
                        transparent 50px
                    );
            }
        }
    </style>
</head>
<body>
    <section class="hero">
        <div class="hero-content">
            <h1>Bienvenue à la Bibliothèque</h1>
            <p>Découvrez un monde de connaissances et d'aventures</p>
            <a href="login">Connexion</a>
        </div>
    </section>
</body>
</html>