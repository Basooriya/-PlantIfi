document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.getElementById("plantSearch");
    const checkboxes = document.querySelectorAll(".filter-checkbox");
    const plantCards = document.querySelectorAll(".plant-item");

    function filterPlants() {
        const query = searchInput ? searchInput.value.toLowerCase().trim() : "";
        
        const activeCategories = Array.from(checkboxes)
            .filter(cb => cb.checked)
            .map(cb => cb.value);

        plantCards.forEach(card => {
            const cardName = card.getAttribute("data-name") ? card.getAttribute("data-name").toLowerCase() : "";
            const cardCategories = card.getAttribute("data-category") ? card.getAttribute("data-category").toLowerCase().split(" ") : [];

            const matchesSearch = cardName.includes(query);

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

    const reportForm = document.getElementById("reportForm");
    if (reportForm) {
        reportForm.addEventListener("submit", (e) => {
            e.preventDefault();

            const name = document.getElementById("userName").value.trim();
            const email = document.getElementById("userEmail").value.trim();
            const inquiry = document.getElementById("inquiryType").value;
            const details = document.getElementById("plantDetails").value.trim();
            const alertBox = document.getElementById("formAlert");

            // Updated regex to support longer domains like .ac.lk, .online, etc.
            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,}$/i;

            // Corrected check for dropdown select element
            if (name === "" || email === "" || inquiry === "" || details === "") {
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

            alertBox.className = "alert alert-success";
            alertBox.textContent = "Your plant toxicity report has been logged successfully!";
            alertBox.classList.remove("d-none");

            reportForm.reset();
        });
    }
});