document.addEventListener("DOMContentLoaded", () => {

    // -------------------------------------------------------------
    // Feature 1: Live Filter & Search Logic (Directory Page)
    // -------------------------------------------------------------
    const searchInput = document.getElementById("plantSearch");
    const checkboxes = document.querySelectorAll(".filter-checkbox");
    const plantCards = document.querySelectorAll(".plant-item");

    function filterPlants() {
        const query = searchInput ? searchInput.value.toLowerCase().trim() : "";
        
        // Get all checked category values
        const activeCategories = Array.from(checkboxes)
            .filter(cb => cb.checked)
            .map(cb => cb.value);

        plantCards.forEach(card => {
            const cardName = card.getAttribute("data-name").toLowerCase();
            const cardCategories = card.getAttribute("data-category").toLowerCase().split(" ");

            // Match text search
            const matchesSearch = cardName.includes(query);

            // Match active checkboxes (if none checked, show all categories)
            const matchesCategory = activeCategories.length === 0 || 
                activeCategories.some(cat => cardCategories.includes(cat));

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
    checkboxes.forEach(cb => cb.addEventListener("change", filterPlants));


    // -------------------------------------------------------------
    // Feature 2: Real-time Form Validation (Contact/Report Page)
    // -------------------------------------------------------------
    const reportForm = document.getElementById("reportForm");
    if (reportForm) {
        reportForm.addEventListener("submit", (e) => {
            e.preventDefault();

            const name = document.getElementById("userName").value.trim();
            const email = document.getElementById("userEmail").value.trim();
            const inquiry = document.getElementById("inquiryType").value;
            const details = document.getElementById("plantDetails").value.trim();
            const alertBox = document.getElementById("formAlert");

            // Email Regex check
            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

            if (name === "" || email === "" || inquiry === null || details === "") {
                alertBox.className = "alert alert-danger";
                alertBox.textContent = "Please fill in all fields before submitting.";
                alertBox.classList.remove("d-none");
                return;
            }

            if (!email.match(emailPattern)) {
                alertBox.className = "alert alert-warning";
                alertBox.textContent = "Please enter a valid email address containing '@' and a domain name.";
                alertBox.classList.remove("d-none");
                return;
            }

            // Success feedback
            alertBox.className = "alert alert-success";
            alertBox.textContent = "Your plant toxicity report has been logged successfully!";
            alertBox.classList.remove("d-none");

            reportForm.reset();
        });
    }
});