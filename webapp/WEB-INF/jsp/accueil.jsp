
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

        input, button {
            margin: 5px;
            padding: 8px;
        }

        .champ {
            margin: 15px 0;
        }

        label {
            display: inline-block;
            width: 100px;
        }
    </style>
</head>
<body>
    <div class="container">

        <p>Valeur de l'attribut 'employers' :
            <span class="data">${employers}</span>
        </p>

        <h1>Bienvenue sur la page d'accueil !</h1>
        <p>Données reçues depuis le EmployerController :</p>

        <h2>Tester l'envoi d'un objet Employer</h2>

        <form action="ajouter"
              method="post"
              enctype="multipart/form-data"
              data-object="Employer">

            <div class="champ">
                <label>Nom :</label>
                <input type="text"
                       name="nom"
                       placeholder="Entrez le nom"
                       required>
            </div>

            <div class="champ">
                <label>Poste :</label>
                <input type="text"
                       name="poste"
                       placeholder="Entrez le poste"
                       required>
            </div>

            <div class="champ">
                <label>Photo :</label>
                <input type="file"
                       name="photo"
                       accept="image/*"
                       required>
            </div>

            <button type="submit">Envoyer l'objet</button>
        </form>

    </div>

    <script src="${pageContext.request.contextPath}/FrameWork.js"></script>
</body>
</html>
