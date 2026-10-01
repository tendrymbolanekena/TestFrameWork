<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Accueil - Liste des Employés</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f9;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 { color: #333; }
        .data { 
            font-weight: bold; 
            color: #0066cc; 
            background: #e6f2ff;
            padding: 5px 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Bienvenue sur la page d'accueil !</h1>
        <p>Données reçues depuis le EmployerController :</p>
        
        <p>Valeur de l'attribut 'employers' : <span class="data">${employers}</span></p>
    </div>
    <a href="listeJson?id=482&message=aaaaaaaaaaaa">aaaaaaa</a>

</body>
</html>