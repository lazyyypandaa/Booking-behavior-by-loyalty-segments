# Booking-behavior-by-loyalty-segments

## RFV (Recency, Frequency, Value) Analysis – Travel Booking Data

This project aims to segment customers of a travel company using RFV (Recency, Frequency, Value) analysis. It provides data-driven insights into customer loyalty, engagement, and re-engagement opportunities using SQL for data processing and Power BI for visualization.

## Project Overview

Travel companies often struggle to identify which customers are most valuable or in need of re-engagement. This project analyzes historical booking data to categorize customers based on their travel behavior, allowing stakeholders to:

- Identify loyal customers
- Spot lapsing users
- Uncover seasonal travel patterns
- Optimize marketing and retention strategies

## Tech Stack

- **SQL**: Data extraction and segmentation
- **Power BI**: Data visualization and dashboard creation
- **Data Source**: Simulated travel booking dataset

---

## 📁 Files

- [`RFV Analysis.sql`](./RFV%20Analysis.sql): Contains SQL queries for segmenting users based on recency and frequency.
- [`RFV Analysis dashboard.pbix`](./RFV%20Analysis%20dashboard.pbix): Power BI file with visuals that summarize customer segments and booking behaviors.

---

## 🔍 Key SQL Insights

### 📌 Segmentation Queries

- **Active Loyal**: Customers with ≥3 bookings, including at least one in the last 3 years.
- **Lapsed Loyal**: Customers with ≥3 bookings, but no bookings in the past 3 years.
- **Active Repeaters**: 1–2 bookings, most recent within 3 years.
- **Lapsing**: 1–2 bookings, most recent 3–5 years ago.
- **Lapsed**: 1–2 bookings, last booking over 5 years ago.

### 📌 Behavioral Insights

- **Travel Lag**: Calculates % of customers who travel within 30 days of booking.
- **Booking Interval**: Computes days between bookings for each customer to identify re-engagement windows.

---

## 📈 Power BI Dashboard Highlights

- **Customer Segment Distribution**: Pie and bar charts showing proportions of loyal, repeat, and lapsed customers.
- **Booking Trends Over Time**: Seasonal analysis of booking activity.
- **Booking vs Travel Gap**: Distribution of how soon customers travel after booking.
- **Re-engagement Opportunities**: Visuals to identify timing and audience for re-marketing campaigns.

---

## 🎯 Business Impact

- **Targeted Marketing**: Focus campaigns on high-value or lapsing customers.
- **Retention Planning**: Understand when customers drop off and design loyalty programs.
- **Resource Planning**: Align staffing and inventory with seasonal booking behavior.
- **Customer Lifetime Value (CLV)**: Use frequency and recency data to estimate CLV segments.

---

## 🚀 Getting Started

1. Clone the repo.
2. Run SQL queries in your preferred database (PostgreSQL syntax used).
3. Open the `.pbix` file in Power BI Desktop to explore visuals.
4. Replace the sample data with real data for production use.

---

## 📬 Contact

**Author**: Pragati Pandey  
Feel free to connect for collaboration or questions on [LinkedIn](https://www.linkedin.com).

---

