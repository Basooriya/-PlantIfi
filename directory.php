<?php 
session_start(); 
require_once 'includes/db.php';

// Fetch all plants from database
$stmt = $pdo->query("SELECT * FROM plants");
$plants = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plant Directory - PlantIfi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <nav class="navbar navbar-expand-lg navbar-dark bg-success sticky-top shadow-sm">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="index.php">
                <span class="fw-bold fs-4">🌿 PlantIfi</span>
            </a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navMenu">
                <ul class="navbar-nav ms-auto align-items-lg-center">
                    <li class="nav-item"><a class="nav-link" href="index.php">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="directory.php">Plant Directory</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.php">Contact Us</a></li>
                    <?php if (isset($_SESSION['user_id'])): ?>
                        <li class="nav-item ms-lg-2"><a class="btn btn-outline-light btn-sm px-3" href="dashboard.php">Dashboard</a></li>
                        <li class="nav-item ms-lg-2"><a class="btn btn-outline-light btn-sm px-3" href="auth/logout.php">Logout</a></li>
                    <?php else: ?>
                        <li class="nav-item ms-lg-2"><a class="btn btn-outline-light btn-sm px-3" href="auth/login.php">Login</a></li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </nav>

    <header class="py-5 text-center">
        <div class="container">
            <h1 class="fw-bold text-success display-5 mb-2">Plant Directory 🪴</h1>
            <p class="lead text-dark fw-medium opacity-90 mb-4">Search and explore popular house plants, herbs, and safety profiles</p>
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <input type="text" id="plantSearch" class="form-control form-control-lg rounded-pill shadow-sm px-4" placeholder="🔍 Type plant name to filter...">
                </div>
            </div>
        </div>
    </header>

    <section class="container mb-4">
        <div class="glass-card rounded-4 p-4 shadow-sm text-center">
            <h5 class="fw-bold text-success mb-3">Explore by Category 🌿</h5>
            <div class="d-flex flex-wrap justify-content-center gap-2">
                <button class="btn btn-outline-success rounded-pill px-3 py-2 fw-semibold category-pill shadow-sm active">
                    ✨ All Plants
                </button>
                <button class="btn btn-outline-danger rounded-pill px-3 py-2 fw-semibold category-pill shadow-sm" value="toxic">
                    ☠️ Poisonous / Toxic
                </button>
                <button class="btn btn-outline-success rounded-pill px-3 py-2 fw-semibold category-pill shadow-sm" value="edible">
                    🥗 Edible / Culinary
                </button>
                <button class="btn btn-outline-primary rounded-pill px-3 py-2 fw-semibold category-pill shadow-sm" value="medicinal">
                    🌱 Herbal & Medicinal
                </button>
                <button class="btn btn-outline-secondary rounded-pill px-3 py-2 fw-semibold category-pill shadow-sm" value="ornamental">
                    🌸 Ornamental
                </button>
            </div>
        </div>
    </section>

    <main class="container py-3 flex-grow-1">
        <div class="row g-4" id="plantGrid">
            <?php foreach($plants as $plant): ?>
            <div class="col-md-6 col-lg-4 plant-item" data-name="<?= strtolower(htmlspecialchars($plant['common_name'])) ?>" data-category="<?= strtolower(htmlspecialchars($plant['category'])) ?>">
                <div class="card plant-card-cover rounded-4 p-4 shadow-sm h-100 d-flex flex-column justify-content-between" style="background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.7)), url('<?= htmlspecialchars($plant['image_url']) ?>') no-repeat center center / cover;">
                    <div>
                        <span class="badge bg-success mb-2"><?= htmlspecialchars($plant['category']) ?></span>
                        <h4 class="fw-bold text-white"><?= htmlspecialchars($plant['common_name']) ?></h4>
                        <p class="text-light opacity-90 small"><?= htmlspecialchars(substr($plant['description'], 0, 80)) ?>...</p>
                    </div>
                    <div>
                        <a href="details.php?id=<?= $plant['id'] ?>" class="btn btn-light btn-sm fw-semibold shadow-sm px-3 w-100">Care Tips / View Profile</a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </main>

    <footer class="bg-dark text-white text-center py-3 mt-auto">
        <div class="container">
            <small>&copy; 2026 PlantIfi - Department of ICT, Rajarata University of Sri Lanka</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
