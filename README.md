# 🎶 Summer Song BI — Business Intelligence Project

**Authors:** Federico Valiño & Stephanie Dimperio
**Universidad Católica del Uruguay — 2022**
**Course:** Business Intelligence

---

## 📘 Project Overview

This project analyzes the characteristics of the most popular songs over recent years with the goal of **identifying patterns that determine the commercial success of a musical hit** (the "song of the summer").

Using a dataset with information about songs, artists and popularity metrics, a **data pipeline** was built to process, transform and visualize the information in a clear and actionable way.

The analysis aims to answer:
> What musical attributes (genre, tempo, duration, key, energy, etc.) increase the likelihood of a song becoming a hit?

---

## ⚙️ Tech Stack

- **dbt (Data Build Tool):** data modeling and transformation (ETL)
- **SQL:** querying and data cleaning
- **Power BI:** interactive dashboards and visualizations

---

## 🧩 Repository Structure

```
Summer_Song_BI/
│
├── models/                        # dbt models and transformations
│   ├── staging/                   # Initial data cleaning and normalization
│   └── marts/                     # Analytical models and final metrics
│
├── visualization/                 # Power BI reports and dashboards
│   ├── Summer_Song_Analysis.pbix
│   └── screenshots/               # Dashboard screenshots
│
├── data/                          # Source datasets
│
└── README.md
```

---

## 📊 Visualizations

The `visualization/` folder contains the Power BI `.pbix` file with all interactive dashboards, including:

- Popularity distribution by year
- Popularity by genre
- Correlation between tempo, key and duration
- Main musical KPIs for the analyzed period (2016–2020)

---

## 🚀 Running the Project

**1. Install dbt dependencies**
```bash
pip install dbt
```

**2. Configure the database connection**
Edit the `profiles.yml` file with your local credentials.

**3. Run the pipeline**
```bash
dbt run
dbt test
```

**4. Visualize results**
Open the Power BI project located at `visualization/Summer_Song_Analysis.pbix`.
