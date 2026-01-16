# Customer Retention & Churn Analysis for a Consumer Subscription Startup (Using R)

# Project Overview
A subscription start up is growing fast, but something feels off. New customers sign up every day, yet revenue growth is sluggish. The culprit? Customer churn ,the silent killer of subscription businesses. This project tells the story of how I turned raw data into actionable insights to answer one critical question: Why are customers leaving, and how can we keep them? By analyzing customer behavior, acquisition channels and product usage patterns, I uncovered retention drivers and built a roadmap for reducing churn and boosting lifetime value


# Business Context

For subscription-based start ups, churn is like a leak in a bucket.you can keep pouring in new customers but if they leave quickly, growth stalls. Every lost customer means wasted marketing spend and missed revenue. The challenge wasn’t just measuring churn. it was understanding who leaves, when and why. This analysis aimed to transform uncertainty into clarity, giving decision-makers the power to act.

# Business Objectives

To solve this, I focused on four key goals:

- Measure churn and understand its scale
- Compare retention between subscription and one-time buyers
- Identify acquisition channels that bring loyal customers
- Analyze product influence on retention


# Dataset and Tools

### Dataset
Simulated customer and transaction data reflecting real-world startup behavior

![image alt](https://github.com/vickiebonnie/customer-retention-churn-analysis-r/blob/57b756a7f4d4ff19c3740349a5b474d7c043305a/data%201.png)

![image alt](https://github.com/vickiebonnie/customer-retention-churn-analysis-r/blob/8cdbd59f9fce903986654e2ed49402cdaf4434d1/data%202.png)










- Customer info: signup date, acquisition channel, subscription type, location
- Transaction records: order date, product type, order value
- Churn definition: No purchase in the last 90 days



###   Tools:

- R for data cleaning, analysis and visualization

- dplyr for data manipulation

- ggplot2 for visual storytelling

- lubricate for date handling



# Methodology

- Generated simulated customer and transaction data to reflect realistic behavior in a consumer subscription startup

- Defined customer churn as no purchase activity within the last 90 days

- Aggregated transaction data to create customer-level metrics, including total orders and average order value

- Segmented customers by subscription type, acquisition channel, and primary product

- Excluded customers without sufficient purchase history from product-level analysis

- Calculated and compared churn rates across key customer segments

- Visualized churn patterns using clear, business-focused bar charts


### key insights 

              ### Churn Rate by Customer Type
<img width="501" height="279" alt="image" src="https://github.com/user-attachments/assets/f74bb109-1ad4-4b25-a2a7-a92608a3767b" />




              ### Churn Rate by Acquisition Channel
<img width="501" height="279" alt="image" src="https://github.com/user-attachments/assets/9670f319-7521-4a8b-b871-b506e9e32dda" />



             ### Churn Rate by Product Type

             ### Customer Inactivity and Churn Risk








