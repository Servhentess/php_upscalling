<?php
// 🛡️ Vérifie que le champ a bien été soumis
if (!isset($_POST['os'])) {
    echo "Erreur : aucun système d'exploitation sélectionné.";
    exit;
}

// 🧼 Protège la valeur reçue (évite injections)
$os = escapeshellarg($_POST['os']);

// 📂 Génére un fichier os.auto.tfvars dans le dossier Terraform
$tfvars_path = __DIR__ . "/terraform/os.auto.tfvars";
file_put_contents($tfvars_path, "os = $os\n");

// 🛠️ Prépare la commande Terraform à exécuter
$cmd = "cd terraform && terraform init -input=false && terraform apply -auto-approve";

// 🧙‍♂️ Exécute la commande et capture la sortie
$output = shell_exec($cmd);

// 📜 Affiche le résultat de l’exécution
echo "<pre>$output</pre>";
?>
