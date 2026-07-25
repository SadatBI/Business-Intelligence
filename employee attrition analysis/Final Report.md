# Biliv-Augmenta Employee Attrition & Retention Analysis

An enterprise-grade HR Analytics Power BI project diagnosing employee turnover dynamics, identifying core attrition drivers, and delivering data-driven strategic interventions for Biliv-Augmenta.

## 📊 Business Problem & Objectives
Employee attrition poses severe operational and financial friction—inflating recruitment costs, degrading productivity, and eroding institutional knowledge. As a Data Analyst at Biliv-Augmenta, this project aims to:
* **Identify** key operational and demographic drivers behind the company's **16.1% attrition rate**.
* **Segment** high-risk talent clusters by department, role, tenure, and workload.
* **Deliver** actionable, executive-level insights to stakeholders to optimize retention programs.

---

## 🛠️ Project Structure & Tech Stack
```text
├── Data/                 # Raw/Anonymized HR datasets (CSV/XLSX)
├── Dashboard/            # Power BI Desktop files (.pbix)
├── Documentation/        # Data Dictionary and Business Requirements
└── README.md             # Project documentation and summary report
```
* **BI Tool:** Microsoft Power BI Desktop
* **Data Sources:** Simulated HR Information Systems (HRIS) data
* **Methodologies:** Exploratory Data Analysis (EDA), Demographic Segmentation, Time-Series Attrition Tracking, Cohort Analysis

---

## 🏎️ Key Performance Indicators (KPIs)
The dashboard monitors the following baseline organization metrics:

| Metric | Value | Business Definition |
| :--- | :--- | :--- |
| **Total Employees** | 1,470 | Total workforce tracked in the historical database |
| **Active Employees** | 1,233 | Current functional headcount |
| **Inactive Employees**| 237 | Cumulative employee departures (Turnover pool) |
| **% Attrition Rate** | 16.1% | Proportion of departures against total headcount |
| **Youngest Employee** | 18 Years | Lower bound of organization age distribution |
| **Oldest Employee** | 51 Years | Upper bound of organization age distribution |

---

## 📐 Specialized DAX Calculations
To build dynamic, scalable visualizations, the following core DAX measures were engineered:

### 1. Overall Attrition Rate
```dax
% AttritionRate = 
DIVIDE(
    COUNTROWS(FILTER('Employees', 'Employees'[Attrition] = "Yes")),
    COUNTROWS('Employees'),
    0
)
```

### 2. Active Employee Count
```dax
ActiveEmployees = 
CALCULATE(
    COUNTROWS('Employees'),
    'Employees'[Attrition] = "No"
)
```

### 3. Age Grouping Segmentation
```dax
Age (groups) = 
SWITCH(
    TRUE(),
    'Employees'[Age] < 20, "<20",
    'Employees'[Age] >= 20 && 'Employees'[Age] <= 29, "20-29",
    'Employees'[Age] >= 30 && 'Employees'[Age] <= 39, "30-39",
    'Employees'[Age] >= 40 && 'Employees'[Age] <= 49, "40-49",
    'Employees'[Age] >= 50, "50+",
    "Unknown"
)
```

---

## 📈 Dashboard Findings & Data Mapping

### 1. Workplace & Operational Drivers
Workload intensity, travel frequency, and career stagnation serve as the heaviest catalysts for turnover:

*   **Overtime Impact:** Workers logging mandatory overtime face a catastrophic attrition rate exceeding **30%**, contrasted against a stable ~10% rate for standard-hour staff.
*   **Business Travel:** **Frequent Travelers** represent the highest travel-based attrition cluster (~25%), while **No Travel** staff hover tightly around 7%.
*   **Manager Lifecycles:** Attrition peaks aggressively above **25%** during an employee's first year (`Year 0`) under a new manager, stabilizing below 5% by `Year 4`.
*   **Promotion Stagnation:** Employees at `Year 0` since their last promotion display a dramatic turnover spike approaching **40%**.

### 2. Demographic & Departmental Profiles
Demographic distributions expose clear high-risk structural clusters across the workforce:

*   **Department Risks:** **Sales** experiences the worst structural instability (>20% attrition), followed by **Human Resources** (~19%) and **Technology** (~14%).
*   **Age Concentration:** The organizational footprint is heavily concentrated in the **20-29 cohort** (874 employees), which simultaneously holds the highest overall attrition risk.

