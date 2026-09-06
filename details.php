<?php
session_start();
require_once 'includes/db.php';

if (!isset($_GET['id'])) {
    header("Location: directory.php");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM plants WHERE id = ?");
$stmt->execute([$_GET['id']]);
$plant = $stmt->fetch();

if (!$plant) {
    echo "Plant not found!";
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($plant['common_name']) ?> - PlantIfi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-success sticky-top shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="index.php">🌿 PlantIfi</a>
            <div class="ms-auto">
                <a class="btn btn-outline-light btn-sm px-3" href="directory.php">⬅ Back to Directory</a>
            </div>
        </div>
    </nav>

    <main class="container py-5 flex-grow-1">
        <div class="card shadow-lg border-0 rounded-4 overflow-hidden mx-auto" style="max-width: 800px;">
            <div class="row g-0">
                <div class="col-md-5">
                    <?php $img = !empty($plant['image_url']) ? $plant['image_url'] : 'https://images.unsplash.com/photo-1466692476868-aef1dfb1e736?q=80&w=800'; ?>
                    <img src="<?= htmlspecialchars($img) ?>" class="img-fluid rounded-start h-100 object-fit-cover w-100" alt="<?= htmlspecialchars($plant['common_name']) ?>">
                </div>
                <div class="col-md-7 p-5 d-flex flex-column justify-content-center">
                    <span class="badge bg-success mb-3 align-self-start fs-6"><?= htmlspecialchars($plant['category']) ?></span>
                    <h2 class="fw-bold text-success display-6 mb-1"><?= htmlspecialchars($plant['common_name']) ?></h2>
                    <p class="text-muted fst-italic mb-4">Scientific Name: <strong><?= htmlspecialchars($plant['scientific_name']) ?></strong></p>
                    
                    <h5 class="fw-bold">Description</h5>
                    <p class="text-secondary mb-4"><?= htmlspecialchars($plant['description']) ?></p>

                    <h5 class="fw-bold">Toxicity Level</h5>
                    <div class="alert alert-warning border-warning fw-semibold shadow-sm">
                        ⚠️ <?= htmlspecialchars($plant['toxicity_level'] ?? 'None') ?>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="bg-dark text-white text-center py-3 mt-auto">
        <div class="container"><small>&copy; 2026 PlantIfi</small></div>
    </footer>
</body>
</html>
