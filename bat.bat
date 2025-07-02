@echo off
REM Chemin vers le dossier webapps Tomcat
set WEBAPPS_DIR=D:\L2\programmation\tomcat-10\webapps

REM Nom du fichier WAR généré (à adapter selon ton projet)
set WAR_NAME=library-Spring-MVC.war

echo Suppression de %WEBAPPS_DIR%\%WAR_NAME%...
if exist "%WEBAPPS_DIR%\%WAR_NAME%" (
    del /f /q "%WEBAPPS_DIR%\%WAR_NAME%"
) else (
    echo Aucun fichier %WAR_NAME% trouvé à supprimer.
)

echo Suppression du dossier %WEBAPPS_DIR%\library-Spring-MVC...
if exist "%WEBAPPS_DIR%\library-Spring-MVC" (
    rmdir /s /q "%WEBAPPS_DIR%\library-Spring-MVC"
) else (
    echo Aucun dossier library-Spring-MVC trouvé à supprimer.
)

REM Vérifie si le war a bien été généré
if exist "target\%WAR_NAME%" (
    echo Copie de target\%WAR_NAME% vers %WEBAPPS_DIR%...
    copy /Y "target\%WAR_NAME%" "%WEBAPPS_DIR%"
    echo Déploiement terminé.
) else (
    echo Fichier target\%WAR_NAME% non trouvé, compilation échouée ?
)

pause
