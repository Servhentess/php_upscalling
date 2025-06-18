<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Déploiement IaaS</title>
</head>
<body>
  <h2>Déployer une machine virtuelle</h2>

  <form action="deploy.php" method="post">
    <label for="os">Système d'exploitation :</label>
    <select name="os" id="os" required>
      <option value="ubuntu">Ubuntu</option>
      <option value="debian">Debian</option>
      <option value="centos">CentOS</option>
    </select>

    <br><br>
    <input type="submit" value="Lancer le déploiement">
  </form>
</body>
</html>
