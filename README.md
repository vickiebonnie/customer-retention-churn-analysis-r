# Customer Retention & Churn Analysis for a Consumer Subscription Startup (Using R)

## Table Of Contents
- [Project Overview](#project-overview)
-  [Key Definitions](#key-Definitions)
- [Business Context](#business-context)
- [Business Objectives](#business-objectives)
- [Dataset And Tools](#dataset-and-tools)
- [Methodology](#Methodology)
- [Key Insights](#key-insights)
- [Limitations](#Limitations)
- [Conclusions](#conclusions)
- [Recommendations](#recommendations)






## Project Overview
A subscription start up is growing fast, but something feels off. New customers sign up every day, yet revenue growth is sluggish. The culprit? Customer churn ,the silent killer of subscription businesses. This project tells the story of how I turned raw data into actionable insights to answer one critical question: Why are customers leaving, and how can we keep them? By analyzing customer behavior, acquisition channels and product usage patterns, I uncovered retention drivers and built a roadmap for reducing churn and boosting lifetime value

## Key Definitions

- Customer Churn: A customer is classified as churned if no purchase has been made within the last 90 days.

- Subscription Customer: A customer enrolled in a recurring purchase plan.

- One-time Customer: A customer who makes purchases without enrolling in a subscription plan.

- Acquisition Channel: The marketing source through which a customer first joined the business (e.g., email, referral, paid ads).

- Primary Product: The product type purchased most frequently by a customer (e.g., spray, refill, bundle).

- Churn Rate: The proportion of customers within a group who are classified as churned.


## Business Context

For subscription-based start ups, churn is like a leak in a bucket.you can keep pouring in new customers but if they leave quickly, growth stalls. Every lost customer means wasted marketing spend and missed revenue. The challenge wasn’t just measuring churn. it was understanding who leaves, when and why. This analysis aimed to transform uncertainty into clarity, giving decision-makers the power to act.

## Business Objectives

To solve this, I focused on four key goals:

- Measure churn and understand its scale
- Compare retention between subscription and one-time buyers
- Identify acquisition channels that bring loyal customers
- Analyze product influence on retention


## Dataset and Tools

## Dataset
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



## Methodology

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


- Subscription customers churn less than one-time buyers, indicating stronger retention among customers on subscription plans.




            ### Churn Rate by Acquisition Channel
<img width="501" height="279" alt="image" src="https://github.com/user-attachments/assets/9670f319-7521-4a8b-b871-b506e9e32dda" />

- Email-acquired customers have the highest churn rate.

- Referral and paid acquisition channels retain customers slightly better.

- Customer retention varies by acquisition channel, indicating differences in customer quality.



            ### Churn Rate by Product Type
<img width="500" height="312" alt="image" src="https://github.com/user-attachments/assets/d2df723a-0c77-4abb-a6c3-d7faa4f34faa" />


- Bundle customers show the highest churn, indicating lower repeat engagement for bundled purchases.

- Refill customers churn less than bundle buyers, suggesting stronger repeat-purchase behavior.

- Spray customers have the lowest churn among the three product types, indicating relatively better retention.

- Customer retention varies by product type, showing that product usage patterns influence churn.


##  Limitations

- The analysis is based on simulated data and does not represent a specific real company.

- Churn is defined using a fixed 90-day inactivity threshold, which may vary across businesses.

- Customer behavior is simplified and may not capture all real-world factors influencing churn.




## Conclusions

- Customer churn varies by customer type, acquisition channel and product type.

- Subscription customers retain better than one-time buyers.

- Email-acquired customers show higher churn compared to other channels.

- Certain products, particularly bundles are associated with higher churn.


## Recommendations

- #### Lean into subscriptions:
Customers on subscriptions stay longer, so make it easier and more visible for first-time buyers to subscribe after their initial purchase.

- #### Revisit email acquisition: 
Customers acquired via email churn more. Review targeting and messaging to ensure this channel attracts higher-intent users.

- #### Double down on better channels:
Referral and paid channels show relatively better retention and are likely bringing higher-quality customers.

- #### Fix bundle drop-off:
Bundle buyers churn more, suggesting a need for stronger follow-up, onboarding or usage guidance after purchase.

- #### Push repeat-use products: 
Products with lower churn should be highlighted in onboarding and cross-sell flows to encourage repeat behavior.
        







