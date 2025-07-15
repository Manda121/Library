<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <style>
            /* Variables CSS pour les thèmes */
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

            /* Thème sombre */
            [data-theme="dark"] {
                --primary-color: #CD853F;
                --secondary-color: #F4A460;
                --accent-color: #DEB887;
                --text-color: #F5DEB3;
                --background-color: #1A1A1A;
                --sidebar-bg: #2D2D2D;
                --card-bg: #3D3D3D;
                --border-color: #8B4513;
                --hover-color: #D2691E;
                --success-color: #32CD32;
                --error-color: #FF6B6B;
                --shadow-color: rgba(0, 0, 0, 0.3);
                --shadow-hover: rgba(0, 0, 0, 0.5);
                --gradient-primary: linear-gradient(135deg, #CD853F 0%, #F4A460 100%);
                --gradient-secondary: linear-gradient(135deg, #8B4513 0%, #A0522D 100%);
            }

            /* Reset et base */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Merriweather', serif;
                line-height: 1.7;
                color: var(--text-color);
                background: var(--background-color);
                padding: 2rem;
                min-height: 100vh;
                transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                overflow-x: hidden;
            }

            /* Header amélioré */
            header {
                text-align: center;
                margin-bottom: 3rem;
                position: relative;
                z-index: 1;
            }

            header::before {
                content: '';
                position: absolute;
                top: -20px;
                left: 50%;
                transform: translateX(-50%);
                width: 200px;
                height: 4px;
                background: var(--gradient-primary);
                border-radius: 2px;
                animation: headerGlow 2s ease-in-out infinite alternate;
            }

            @keyframes headerGlow {
                0% {
                    box-shadow: 0 0 5px var(--primary-color);
                }

                100% {
                    box-shadow: 0 0 20px var(--primary-color), 0 0 30px var(--secondary-color);
                }
            }

            header h1 {
                font-size: 3rem;
                font-weight: 700;
                background: var(--gradient-primary);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                margin-bottom: 1rem;
                text-shadow: 2px 2px 4px var(--shadow-color);
                animation: titleFloat 3s ease-in-out infinite;
            }

            @keyframes titleFloat {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-5px);
                }
            }

            /* Champ de recherche stylé */
            .search-container {
                margin-top: 1.5rem;
                position: relative;
            }

            #searchInput {
                padding: 15px 20px;
                width: 400px;
                max-width: 100%;
                border: 2px solid var(--border-color);
                border-radius: 50px;
                font-size: 1.1rem;
                font-family: 'Merriweather', serif;
                background: var(--card-bg);
                color: var(--text-color);
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px var(--shadow-color);
            }

            #searchInput:focus {
                border-color: var(--primary-color);
                outline: none;
                box-shadow: 0 0 0 3px rgba(139, 69, 19, 0.1), 0 8px 25px var(--shadow-hover);
                transform: translateY(-2px);
            }

            #searchInput::placeholder {
                color: var(--text-color);
                opacity: 0.6;
            }

            /* Bouton toggle sidebar amélioré */
            #toggleSidebar {
                position: fixed;
                top: 2rem;
                left: 2rem;
                padding: 15px 20px;
                background: var(--gradient-primary);
                color: #fff;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                font-size: 1.2rem;
                font-weight: 600;
                z-index: 1001;
                box-shadow: 0 8px 25px var(--shadow-color);
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }

            #toggleSidebar:hover {
                transform: translateY(-3px) scale(1.05);
                box-shadow: 0 12px 35px var(--shadow-hover);
            }

            #toggleSidebar:active {
                transform: translateY(-1px) scale(0.98);
            }

            /* Sidebar ultra-professionnelle */
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                width: 320px;
                height: 100vh;
                background: var(--sidebar-bg);
                backdrop-filter: blur(10px);
                box-shadow: 4px 0 25px var(--shadow-color);
                padding: 0;
                transition: left 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                z-index: 1000;
                border-right: 1px solid var(--border-color);
                overflow-y: auto;
                scrollbar-width: thin;
                scrollbar-color: var(--primary-color) var(--sidebar-bg);
            }

            .sidebar::-webkit-scrollbar {
                width: 8px;
            }

            .sidebar::-webkit-scrollbar-track {
                background: var(--sidebar-bg);
            }

            .sidebar::-webkit-scrollbar-thumb {
                background: var(--primary-color);
                border-radius: 4px;
            }

            .sidebar::-webkit-scrollbar-thumb:hover {
                background: var(--hover-color);
            }

            .sidebar.active {
                left: -320px;
            }

            .sidebar.active~.container {
                margin-left: 0;
            }

            /* Header de la sidebar */
            .sidebar-header {
                padding: 2rem;
                background: var(--gradient-primary);
                color: white;
                text-align: center;
                position: sticky;
                top: 0;
                z-index: 10;
            }

            .sidebar-header h3 {
                font-size: 1.5rem;
                font-weight: 700;
                margin-bottom: 0.5rem;
            }

            .sidebar-header p {
                opacity: 0.9;
                font-size: 0.9rem;
            }

            /* Bouton de changement de thème */
            .theme-toggle {
                background: rgba(255, 255, 255, 0.2);
                border: 2px solid rgba(255, 255, 255, 0.3);
                color: white;
                padding: 10px 20px;
                border-radius: 25px;
                cursor: pointer;
                font-size: 0.9rem;
                font-weight: 600;
                margin-top: 1rem;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .theme-toggle:hover {
                background: rgba(255, 255, 255, 0.3);
                transform: scale(1.05);
            }

            .theme-toggle::before {
                content: '☀️';
                font-size: 1.2rem;
            }

            [data-theme="dark"] .theme-toggle::before {
                content: '🌙';
            }

            /* Navigation de la sidebar */
            .sidebar ul {
                list-style: none;
                padding: 1rem;
            }

            .sidebar li {
                margin-bottom: 0.5rem;
            }

            .sidebar li a {
                display: block;
                padding: 15px 20px;
                background: var(--card-bg);
                color: var(--text-color);
                text-decoration: none;
                border-radius: 12px;
                font-size: 1rem;
                font-weight: 500;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                border: 2px solid transparent;
                position: relative;
                overflow: hidden;
            }

            .sidebar li a::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: var(--gradient-secondary);
                transition: left 0.3s ease;
                z-index: -1;
            }

            .sidebar li a:hover::before {
                left: 0;
            }

            .sidebar li a:hover {
                color: var(--text-color);
                transform: translateX(8px);
                border-color: var(--primary-color);
                box-shadow: 0 6px 20px var(--shadow-hover);
            }

            /* Conteneur principal */
            .container {
                max-width: 1400px;
                margin: 0 auto;
                margin-left: 320px;
                transition: margin-left 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                padding: 0 2rem;
            }

            /* Tableaux ultra-stylés */
            table {
                width: 100%;
                border-collapse: collapse;
                background: var(--card-bg);
                box-shadow: 0 10px 30px var(--shadow-color);
                border-radius: 20px;
                overflow: hidden;
                margin-bottom: 2rem;
                position: relative;
            }

            table::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: var(--gradient-primary);
            }

            th,
            td {
                padding: 18px 20px;
                text-align: left;
                border-bottom: 1px solid var(--border-color);
            }

            th {
                background: var(--gradient-primary);
                color: white;
                font-weight: 700;
                font-size: 1.1rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                position: relative;
            }

            th::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                height: 2px;
                background: var(--secondary-color);
            }

            tr {
                transition: all 0.3s ease;
            }

            tr:hover {
                background: var(--accent-color);
                transform: scale(1.01);
                box-shadow: 0 5px 15px var(--shadow-color);
            }

            tr:nth-child(even) {
                background: rgba(244, 164, 96, 0.1);
            }

            /* Formulaires élégants */
            form {
                display: flex;
                flex-direction: column;
                gap: 1.5rem;
                background: var(--card-bg);
                padding: 2.5rem;
                border-radius: 20px;
                box-shadow: 0 15px 40px var(--shadow-color);
                margin-bottom: 2rem;
                border: 1px solid var(--border-color);
                position: relative;
            }

            form::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: var(--gradient-primary);
                border-radius: 20px 20px 0 0;
            }

            label {
                display: flex;
                flex-direction: column;
                font-size: 1.1rem;
                font-weight: 600;
                color: var(--text-color);
                margin-bottom: 0.5rem;
            }

            input[type="text"],
            input[type="number"],
            input[type="email"],
            input[type="password"],
            input[type="date"],
            select {
                padding: 15px 20px;
                margin-top: 0.5rem;
                border: 2px solid var(--border-color);
                border-radius: 12px;
                font-size: 1rem;
                font-family: 'Merriweather', serif;
                background: var(--card-bg);
                color: var(--text-color);
                transition: all 0.3s ease;
            }

            input[type="text"]:focus,
            input[type="number"]:focus,
            input[type="email"]:focus,
            input[type="password"]:focus,
            input[type="date"]:focus,
            select:focus {
                border-color: var(--primary-color);
                outline: none;
                box-shadow: 0 0 0 3px rgba(139, 69, 19, 0.1);
                transform: translateY(-2px);
            }

            /* Boutons premium */
            input[type="submit"],
            button {
                padding: 15px 25px;
                background: var(--gradient-primary);
                color: white;
                border: none;
                border-radius: 12px;
                font-size: 1.1rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                box-shadow: 0 8px 25px var(--shadow-color);
                text-transform: uppercase;
                letter-spacing: 1px;
                position: relative;
                overflow: hidden;
            }

            input[type="submit"]::before,
            button::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
                transition: left 0.5s;
            }

            input[type="submit"]:hover::before,
            button:hover::before {
                left: 100%;
            }

            input[type="submit"]:hover,
            button:hover {
                transform: translateY(-3px) scale(1.02);
                box-shadow: 0 12px 35px var(--shadow-hover);
            }

            input[type="submit"]:active,
            button:active {
                transform: translateY(-1px) scale(0.98);
            }

            /* Messages stylés */
            .message-success {
                color: var(--success-color);
                background: rgba(34, 139, 34, 0.1);
                padding: 15px 20px;
                border-radius: 12px;
                border-left: 4px solid var(--success-color);
                margin-bottom: 1rem;
                font-weight: 600;
                animation: slideIn 0.5s ease;
            }

            .message-error {
                color: var(--error-color);
                background: rgba(178, 34, 34, 0.1);
                padding: 15px 20px;
                border-radius: 12px;
                border-left: 4px solid var(--error-color);
                margin-bottom: 1rem;
                font-weight: 600;
                animation: slideIn 0.5s ease;
            }

            @keyframes slideIn {
                from {
                    transform: translateX(-100%);
                    opacity: 0;
                }

                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }

            /* Liens stylés */
            a {
                color: var(--primary-color);
                text-decoration: none;
                font-weight: 600;
                transition: all 0.3s ease;
                position: relative;
            }

            a::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 0;
                width: 0;
                height: 2px;
                background: var(--primary-color);
                transition: width 0.3s ease;
            }

            a:hover::after {
                width: 100%;
            }

            a:hover {
                color: var(--hover-color);
                transform: translateY(-1px);
            }

            .return-link {
                display: inline-block;
                margin-top: 2rem;
                padding: 12px 24px;
                background: var(--gradient-secondary);
                color: var(--text-color);
                border-radius: 25px;
                text-decoration: none;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 6px 20px var(--shadow-color);
            }

            .return-link:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 30px var(--shadow-hover);
            }

            /* Responsive design */
            @media (max-width: 768px) {
                body {
                    padding: 1rem;
                }

                header h1 {
                    font-size: 2rem;
                }

                #searchInput {
                    width: 100%;
                    font-size: 1rem;
                }

                .sidebar {
                    width: 280px;
                    left: -280px;
                }

                .sidebar.active {
                    left: 0;
                }

                .container {
                    margin-left: 0;
                    padding: 0 1rem;
                }

                table {
                    display: block;
                    overflow-x: auto;
                    white-space: nowrap;
                }

                form {
                    padding: 1.5rem;
                }

                #toggleSidebar {
                    top: 1rem;
                    left: 1rem;
                    padding: 12px 16px;
                }
            }

            /* Animations d'entrée */
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

            .container>* {
                animation: fadeInUp 0.6s ease forwards;
            }

            .container>*:nth-child(1) {
                animation-delay: 0.1s;
            }

            .container>*:nth-child(2) {
                animation-delay: 0.2s;
            }

            .container>*:nth-child(3) {
                animation-delay: 0.3s;
            }

            .container>*:nth-child(4) {
                animation-delay: 0.4s;
            }

            /* Effets de particules pour le fond */
            body::before {
                content: '';
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background:
                    radial-gradient(circle at 20% 20%, rgba(139, 69, 19, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 80% 80%, rgba(244, 164, 96, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 40% 60%, rgba(210, 105, 30, 0.05) 0%, transparent 50%);
                z-index: -1;
                pointer-events: none;
                animation: particleMove 20s ease-in-out infinite;
            }

            @keyframes particleMove {

                0%,
                100% {
                    transform: translateY(0) rotate(0deg);
                }

                50% {
                    transform: translateY(-20px) rotate(180deg);
                }
            }

            /* Scrollbar personnalisée */
            ::-webkit-scrollbar {
                width: 12px;
            }

            ::-webkit-scrollbar-track {
                background: var(--background-color);
            }

            ::-webkit-scrollbar-thumb {
                background: var(--gradient-primary);
                border-radius: 6px;
            }

            ::-webkit-scrollbar-thumb:hover {
                background: var(--hover-color);
            }
        </style>
        <header>
            <h1>Bibliothèque - Gestion des Prêts</h1>
            <div class="search-container">
                <input type="text" id="searchInput" placeholder="Rechercher dans la liste..." onkeyup="filterTable()">
            </div>
        </header>

        <script>
            // Fonction pour basculer la sidebar
            function toggleSidebar() {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('active');
            }

            // Fonction pour filtrer le tableau
            function filterTable() {
                const input = document.getElementById('searchInput');
                const filter = input.value.toLowerCase();
                const table = document.querySelector('table');

                if (!table) return;

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

                    if (match) {
                        rows[i].style.display = '';
                        rows[i].style.animation = 'fadeInUp 0.3s ease';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            }

            // Fonction pour basculer le thème
            function toggleTheme() {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';

                document.documentElement.setAttribute('data-theme', newTheme);
                localStorage.setItem('theme', newTheme);

                // Animation de transition
                document.body.style.transition = 'all 0.5s ease';
                setTimeout(() => {
                    document.body.style.transition = '';
                }, 500);
            }

            // Initialisation au chargement de la page
            document.addEventListener('DOMContentLoaded', function () {
                // Charger le thème sauvegardé
                const savedTheme = localStorage.getItem('theme') || 'light';
                document.documentElement.setAttribute('data-theme', savedTheme);

                // Ajouter des animations au survol des lignes du tableau
                const rows = document.querySelectorAll('tr');
                rows.forEach(row => {
                    row.addEventListener('mouseenter', function () {
                        this.style.transform = 'scale(1.01)';
                    });

                    row.addEventListener('mouseleave', function () {
                        this.style.transform = 'scale(1)';
                    });
                });

                // Animation des formulaires
                const forms = document.querySelectorAll('form');
                forms.forEach(form => {
                    form.addEventListener('submit', function () {
                        const submitBtn = this.querySelector('input[type="submit"]');
                        if (submitBtn) {
                            submitBtn.style.transform = 'scale(0.95)';
                            submitBtn.innerHTML = 'Traitement...';
                        }
                    });
                });

                // Effet de parallaxe léger
                window.addEventListener('scroll', function () {
                    const scrolled = window.pageYOffset;
                    const header = document.querySelector('header');
                    if (header) {
                        header.style.transform = `translateY(${scrolled * 0.1}px)`;
                    }
                });
            });

            // Gestion des touches de raccourci
            document.addEventListener('keydown', function (e) {
                // Ctrl + B pour basculer la sidebar
                if (e.ctrlKey && e.key === 'b') {
                    e.preventDefault();
                    toggleSidebar();
                }

                // Ctrl + T pour basculer le thème
                if (e.ctrlKey && e.key === 't') {
                    e.preventDefault();
                    toggleTheme();
                }
            });
        </script>