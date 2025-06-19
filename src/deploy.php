<?php
if (!isset($_POST['os'])) {
    echo "Erreur : OS non défini.";
    exit;
}

$os_raw = $_POST['os'];
$os_safe = preg_replace('/[^a-z0-9_-]/i', '', $os_raw); // sécurité

// 📁 Répertoire d'origine (monté depuis l'hôte)
$origin = "/var/www/terraform/terraform_vm";

// 📁 Répertoire d'exécution temporaire dans le container (pas de restriction chmod)
$tmpdir = "/tmp/terraform_vm_exec_" . uniqid();

// 🔁 Supprime l'ancien dossier s'il existait, puis copie le projet
if (is_dir($tmpdir)) {
    shell_exec("rm -rf $tmpdir");
}
shell_exec("cp -r $origin $tmpdir");

// 📝 Génère le fichier .tfvars dans le dossier temporaire
file_put_contents("$tmpdir/os.auto.tfvars", "os = \"$os_safe\"\n");

// 🔧 Indique à Terraform d’utiliser un cache local dans /tmp
putenv("TF_DATA_DIR=/tmp/terraform_cache_" . uniqid());

// 🧙‍♂️ Exécute Terraform
$cmd = "cd $tmpdir && terraform init -input=false && terraform apply -auto-approve 2>&1";
$output = shell_exec($cmd);

// 🖨️ Affiche le résultat à l'écran
echo "<h2>Résultat du déploiement pour $os :</h2>";
echo "<pre>$output</pre>";
?>
