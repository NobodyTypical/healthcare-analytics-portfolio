# 🏥 Healthcare Clinical & Operational Analytics Portfolio

## 📌 Overview
This repository contains SQL-driven analyses of an AI-Made Electronic Health Record (EHR) database that was made to mirror the structure found in Epic Systems. The projects focus on two core aspects of healthcare: **Clinical Quality Measures (HEDIS/CMS)** and **Operational Efficiency**.

## 🗄️ Database Schema
The database consists of four tables:
* `patients`: Demographics, Date of Birth, insurance type, and assigned Primary Care Provider (PCP).
* `doctors`: Provider details, department, specialty, and FTE.
* `appointments`: Visit history, scheduling dates, ICD-10 diagnosis codes, and Show/No-Show status.
* `lab_results`: Patient lab tests, results, and standard normal ranges.

---

## 🩺 Project 1: Identifying Gaps in Care (Quality Measures)
**File:** `gaps_in_care.sql`

**The Business Problem:** Clinic operations teams need an automated way to track high-risk patients to maintain HEDIS compliance and improve outcomes of patients. 
**The Solution:** An automated query to identify patients assigned to a PCP who recently received a high-risk lab result (Total Cholesterol > 200) but currently lack a scheduled follow-up appointment.

**Key Technical Skills:**
* **CTEs:** Isolated the high-risk cohort before joining to larger demographic tables.
* **LEFT JOIN Logic:** Identified the *absence* of a scheduled visit (filtering for `NULL` future appointments).

---

## 📉 Project 2: Clinic No-Show Rate Dashboard
**File:** `no_show_analysis.sql`

**The Business Problem:** Missed appointments cost healthcare facilities significant revenue and limit access to care. Management needs to pinpoint which departments and providers suffer from the highest no-show rates to deploy targeted SMS reminders.
**The Solution:** A summarized report calculating the exact percentage of missed appointments per provider.

**Key Technical Skills:**
* **Data Aggregation:** Summarized appointment data using `GROUP BY` at the department and provider levels.
* **Conditional Logic:** Utilized `CASE WHEN` inside aggregate functions to isolate "No-Show" statuses.
* **Mathematical Operations:** Dynamically calculated and formatted percentage rates.
