# 🌿 PlantIfi - Digital Herbarium & Plant Safety Guide

PlantIfi is an interactive, web-based digital herbarium designed to help users identify plants, explore botanical profiles, understand plant toxicity, and learn about culinary or medicinal uses.

This project is developed as part of the **ICT 1209: Web Technologies** mini-project assessment.

---

## 🎯 Project Overview & Theme

* **Theme:** Digital Herbarium & Plant Safety Guide
* **Target Audience:** Homeowners, gardeners, pet owners, students, and botany enthusiasts.
* **Key Features:**
  * **Interactive Plant Directory:** Filter plants dynamically by category (e.g., Toxic, Edible, Medicinal, Succulents) and live search by name.
  * **Featured Highlights Carousel:** Interactive homepage slider showcasing highlighted plants with safety tags.
  * **Inquiry & Toxicity Report Form:** Contact form with real-time JavaScript validation for reporting or inquiring about plant safety.

---

## 🛠️ Technology Stack (Phase 2)

* **Frontend Structure:** HTML5
* **Styling & Layout:** CSS3, Bootstrap 5 (Responsive Layout & Components)
* **Client-Side Logic:** Vanilla JavaScript (ES6)
* **Version Control:** Git & GitHub

---

## 🚀 Key JavaScript Features Implemented

1. **Dynamic Content Filtering:** Live search input (`keyup`) and category filter tags (`change`) that dynamically show/hide matching plant cards in real-time.
2. **Interactive Carousel:** Bootstrap 5 dynamic featured image and highlight slider with interactive controls.
3. **Form Validation:** Real-time client-side validation on the contact/inquiry form checking for empty fields, proper email formatting (using regular expressions), and displaying dynamic alert banners.

---

## 📁 Project Structure

```text
Plantifi/
├── index.html        # Main Landing Page with Featured Carousel
├── directory.html    # Interactive Plant Directory with Filters
├── contact.html      # Support, Inquiry, and Toxicity Report Form
├── css/
│   └── style.css     # Custom Glassmorphic Styling & Plant Layouts
└── js/
    └── script.js    # Client-side Search, Filtering, and Validation Logic