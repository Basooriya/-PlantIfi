document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.getElementById("plantSearch");
    const categoryButtons = document.querySelectorAll(".category-pill");
    const plantCards = document.querySelectorAll(".plant-item");

    function filterPlants() {
        const query = searchInput ? searchInput.value.toLowerCase().trim() : "";
        
        let activeCategory = "all";
        categoryButtons.forEach(btn => {
            if (btn.classList.contains("active")) {
                if (btn.textContent.toLowerCase().includes("toxic")) activeCategory = "toxic";
                else if (btn.textContent.toLowerCase().includes("edible")) activeCategory = "edible";
                else if (btn.textContent.toLowerCase().includes("herbal")) activeCategory = "herbal";
                else if (btn.textContent.toLowerCase().includes("ornamental")) activeCategory = "ornamental";
                else if (btn.textContent.toLowerCase().includes("succulent")) activeCategory = "succulent";
                else activeCategory = "all";
            }
        });

        plantCards.forEach(card => {
            const cardName = card.getAttribute("data-name") ? card.getAttribute("data-name").toLowerCase() : "";
            const cardCategories = card.getAttribute("data-category") ? card.getAttribute("data-category").toLowerCase() : "";

            const matchesSearch = cardName.includes(query);
            const matchesCategory = activeCategory === "all" || cardCategories.includes(activeCategory);

            if (matchesSearch && matchesCategory) {
                card.style.display = "block";
            } else {
                card.style.display = "none";
            }
        });
    }

    if (searchInput) {
        searchInput.addEventListener("keyup", filterPlants);
    }
    
    categoryButtons.forEach(btn => {
        btn.addEventListener("click", () => {
            categoryButtons.forEach(b => b.classList.remove("active"));
            btn.classList.add("active");
            filterPlants();
        });
    });

    const reportForm = document.getElementById("reportForm");
    if (reportForm) {
        reportForm.addEventListener("submit", (e) => {
            const name = document.getElementById("userName").value.trim();
            const email = document.getElementById("userEmail").value.trim();
            const inquiry = document.getElementById("inquiryType").value;
            const details = document.getElementById("plantDetails").value.trim();
            const alertBox = document.getElementById("formAlert");

            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,}$/i;

            if (name === "" || email === "" || inquiry === "" || details === "") {
                e.preventDefault();
                alertBox.className = "alert alert-danger";
                alertBox.textContent = "Please fill in all fields before submitting.";
                alertBox.classList.remove("d-none");
                return;
            }

            if (!email.match(emailPattern)) {
                e.preventDefault();
                alertBox.className = "alert alert-warning";
                alertBox.textContent = "Please enter a valid email address containing '@' and a domain name.";
                alertBox.classList.remove("d-none");
                return;
            }

            // Let the form submit natively to PHP
        });
    }
});