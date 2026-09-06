# PlantIfi - Interactive Web Application Development
**ICT 1209 – Web Technologies | Mini Project Final Report**

---

## 1. Cover Page
**Project Title:** PlantIfi: An Interactive Botanical Database & Safety Guide
**Theme:** Botanical Directory (Scientific names, toxicity profiling, edibility markers)
**Group Members:**
1. I.A.V.K. Ilangakoon (Index No: 2732) - Venuri
2. B.S.C. Hasarangi (Index No: 2729) - Sithmi
**Date:** September 7, 2026

---

## 2. Project Overview
**Purpose:** 
PlantIfi solves the practical problem of making biological and botanical data accessible. It provides everyday users with a reliable platform to check plant toxicity, edibility, and economic value to prevent accidental poisonings and educate the public.

**Target Audience:**
Casual gardeners, pet owners, agriculture students, landscape designers, and eco-tourists.

**Key Features:**
1. **Dynamic Plant Directory:** Instant client-side filtering by category (Edible, Toxic, Medicinal, etc.).
2. **Interactive Carousel Slider:** Highlighting featured plants and their safety warnings.
3. **Secure User Authentication:** PHP/MySQL powered registration and login system with password hashing.
4. **Validated Inquiry Form:** A contact form with dual validation (JavaScript frontend + PHP backend) to submit toxicity reports.

---

## 3. System Design
### Database Schema
Database Name: `plantifi`

**Table 1: `users`**
* `id` (INT, AUTO_INCREMENT, PRIMARY KEY)
* `username` (VARCHAR 50)
* `email` (VARCHAR 100)
* `password` (VARCHAR 255) - Hashed securely
* `created_at` (TIMESTAMP)

**Table 2: `messages`**
* `id` (INT, AUTO_INCREMENT, PRIMARY KEY)
* `name` (VARCHAR 100)
* `email` (VARCHAR 100)
* `message` (TEXT)
* `created_at` (TIMESTAMP)

**Table 3: `plants`**
* `id` (INT, AUTO_INCREMENT, PRIMARY KEY)
* `common_name` (VARCHAR 100)
* `scientific_name` (VARCHAR 100)
* `category` (ENUM)
* `description` (TEXT)
* `image_url` (VARCHAR 255)
* `toxicity_level` (VARCHAR 50)

### Folder Structure
```text
-PlantIfi/
├── auth/
│   ├── register.php
│   ├── login.php
│   └── logout.php
├── css/
│   └── style.css
├── images/
├── includes/
│   └── db.php
├── js/
│   └── script.js
├── contact.php
├── dashboard.php
├── directory.php
├── index.php
├── database.sql
└── README.md
```

---

## 4. Implementation
*(Note: Please paste screenshots of your application here before submitting the PDF)*

* **Home Page (`index.php`):** Responsive Bootstrap 5 layout with an interactive JavaScript carousel for featured plants. 
* **[PASTE SCREENSHOT OF HOME PAGE HERE]**
* **Plant Directory (`directory.php`):** Uses Vanilla JavaScript array filtering to instantly sort plants by category without reloading the page.
* **[PASTE SCREENSHOT OF DIRECTORY HERE]**
* **User Authentication (`register.php` & `login.php`):** Implements `PASSWORD_BCRYPT` hashing for secure data storage. Prevents session fixation via `session_regenerate_id()`.
* **[PASTE SCREENSHOT OF LOGIN PAGE HERE]**
* **Contact & Form Submission (`contact.php`):** Captures user data, validates via regex in JS, and inserts it into the `messages` MySQL table using PHP PDO prepared statements to prevent SQL injection.
* **[PASTE SCREENSHOT OF CONTACT FORM HERE]**

---

## 5. Challenges and Solutions
* **Challenge:** Preventing SQL Injection when users submit contact forms.
  **Solution:** We implemented PDO Prepared Statements (`$pdo->prepare`) in PHP, which separates the SQL logic from the user input, making the database secure.
* **Challenge:** Maintaining front-end JS validation while submitting data to PHP.
  **Solution:** We updated our JavaScript event listener to validate the form first. If the validation passes, the JS allows the native HTML form submission to trigger, passing the `POST` data perfectly to PHP.

---

## 6. Individual Contribution
Both team members contributed equally to the success of the project:

**I.A.V.K. Ilangakoon (Venuri - 2732):**
* Designed the frontend wireframes and UI layout (Bootstrap 5, CSS).
* Implemented the JavaScript filtering logic for the Plant Directory.
* Developed the interactive carousel on the Home Page.
* Created the `database.sql` schema and table structures.

**B.S.C. Hasarangi (Sithmi - 2729):**
* Developed the PHP backend authentication (`register.php`, `login.php`, `logout.php`).
* Handled the database connection securely using PDO (`includes/db.php`).
* Wrote the PHP backend for the `contact.php` form to store messages in the database.
* Integrated the dynamic navigation bar across all PHP pages.

---

## 7. Setup Instructions
1. Install **XAMPP** and start the **Apache** and **MySQL** modules.
2. Open your browser and navigate to `http://localhost/phpmyadmin`.
3. Create a new database named `plantifi`.
4. Click the "Import" tab and upload the `database.sql` file provided in the source code folder.
5. Place the entire `-PlantIfi` project folder into your XAMPP `htdocs` directory (e.g., `C:\xampp\htdocs\-PlantIfi`).
6. Access the application in your browser at `http://localhost/-PlantIfi/`.

---

## 8. References
* PHP Official Documentation: https://www.php.net/docs.php
* Bootstrap 5 Documentation: https://getbootstrap.com/docs/5.3/
* JavaScript MDN Web Docs: https://developer.mozilla.org/en-US/docs/Web/JavaScript
