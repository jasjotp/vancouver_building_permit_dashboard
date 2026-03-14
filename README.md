# Vancouver Building Permits Dashboard 

This project is an interactive **R Shiny dashboard** that analyzes Vancouver Building Permit Data. The dashboard allows users to explore permit metrics and trends over time based on the selected date range. 

The dashboard uses publicly available building permit data from the City of Vancouver to compute permit counts, processing times, and monthly permit trends.

The application provides: 

- The **total number of permits issued** within a selected date range
- The **average processing time** from the date the permit is applied for to the date the permit is issued
- A **time series line chart** showing permit volume trends over time

---

## Live Application 

The deployed dashboard can be accessed here:

**Posit Connect Cloud deployment**

https://019cea5b-9682-94e5-eeea-6177124cc8eb.share.connect.posit.cloud/

---

## Repository Structure

```
vancouver_building_permit_dashboard/
│
├── data/
│   └── raw/
│       └── issued-building-permits.csv
│
├── src/
│   ├── app.R
│   └── manifest.json
│
├── renv.lock
├── .Rprofile
├── vancouver_building_permit_dashboard.Rproj
├── README.md
├── LICENSE
├── .gitignore
└── .gitattributes
```

---

## How to Run the Application

### 1. Clone the repository 

```
git clone https://github.com/jasjotp/vancouver_building_permit_dashboard.git
```

---

### 2. Navigate into the project directory 

```
cd vancouver_building_permit_dashboard
```

---

### 3. Restore the project environment (Install all required packages)

The project uses **renv** to recreate the exact package environment.

Open the project directory in your choice of R-supported IDE (RStudio recommended) and run:

```
renv::restore()
```

This will install all required packages.

---

### 4. Run the application

Run the following command from the R command line:

```
shiny::runApp("src")
```

The application will launch locally on your browser.


---

## Dashboard Features

### Date Range Filter Input
Users can select a date range to filter permit activity.

### Permits Issued Output
Displays the **total number of permits issued** in the selected time period.

### Average Processing Time Output
Calculates the **average number of days between application date and issue date**.

### Permit Volume Trend Output Graph
A line chart shows how permit issuance changes over time.

---

## Author 

Jasjot Parmar
