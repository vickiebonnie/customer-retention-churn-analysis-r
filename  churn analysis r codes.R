##Generating  stimulated customer and order data

### Load tidyverse,dplyr and lubridate 

install.packages("tidyverse")
library(tidyverse)
 library(dplyr)
library(lubridate)

### generating a sample data ##
set.seed(123)
n_customers <-2000

customers <- data.frame(customer_id = 1:n_customers,signup_date = sample(seq(as.Date("2023-01-01"),as.Date("2024-06-30"),by ="day"),
                                                                         n_customers,replace = TRUE
                                                                         ),
                        acquisition_channel = sample(c("Email", "Paid Ads", "Referral"),n_customers,replace = TRUE , prob = c(0.4,0.4,0.2)),
                        location = sample(
                          c("USA", "Canada", "UK"),
                          n_customers,
                          replace = TRUE,
                          prob = c(0.6, 0.2, 0.2)
                        ),
                        subscription_type = sample(
                          c("Subscription", "One-time"),
                          n_customers,
                          replace = TRUE,
                          prob = c(0.55, 0.45)
                        )
)


head(customers)                                 
glimpse(customers)



 ## creating the order /transactions data


orders_list <- list()
order_id_counter <- 1

for (i in 1:nrow(customers)) {
  
  customer <- customers[i, ]
  
  n_orders <- rpois(
    1,
    lambda = ifelse(customer$subscription_type == "Subscription", 5, 2)
  )
  
  if (n_orders == 0) next
  
  temp_orders <- data.frame(
    customer_id = customer$customer_id,
    order_date = customer$signup_date + sample(5:300, n_orders, replace = TRUE),
    product_type = sample(
      c("Spray", "Refill", "Bundle"),
      n_orders,
      replace = TRUE,
      prob = c(0.4, 0.4, 0.2)
    ),
    order_value = round(
      runif(
        n_orders,
        min = ifelse(customer$subscription_type == "Subscription", 20, 25),
        max = ifelse(customer$subscription_type == "Subscription", 45, 60)
      ),
      2
    ),
    is_subscription = customer$subscription_type == "Subscription",
    order_id = order_id_counter:(order_id_counter + n_orders - 1)
  )
  
  order_id_counter <- order_id_counter + n_orders
  orders_list[[length(orders_list) + 1]] <- temp_orders
}

orders <- bind_rows(orders_list)

head(orders)

glimpse(orders)


# define churn and customer-level metrics

### churn defintion : A customer is churned if they have not made a purchase in the last 90 days
# We will compare their last purchase date to an analysis date

 

analysis_date <- as.Date("2024-09-30")

churn_metrics <- orders %>%
  group_by(customer_id) %>%
  summarise(
    last_purchase_date = max(order_date),
    days_since_last_purchase = as.numeric(analysis_date - last_purchase_date),
    churn_flag = ifelse(days_since_last_purchase > 90, 1, 0),
    total_orders = n(),
    avg_order_value = mean(order_value),
    .groups = "drop"
  )


colnames(churn_metrics)

head(churn_metrics$avg_order_value)



## Now we will  combine customer info + churn metrics into one table that we’ll use for analysis and charts


##create final analysis dataset

final_data <- customers %>%
  left_join(churn_metrics, by = "customer_id")
head(final_data)

glimpse(final_data)
colnames(final_data)







##  calculating  overall churn rate

overall_churn_rate <- mean(final_data$churn_flag, na.rm = TRUE)
overall_churn_rate

## Churn by Subscription Type (VERY IMPORTANT)

churn_by_subscription <- final_data %>%
  group_by(subscription_type) %>%
  summarise(
    customers = n(),
    churn_rate = mean(churn_flag, na.rm = TRUE),
    .groups = "drop"
  )

churn_by_subscription


## plotting churn_rate by customer_type 



library(ggplot2)
library(scales)

ggplot(
  churn_by_subscription,
  aes(x = subscription_type, y = churn_rate)
) +
  geom_col(fill = "#2C7BE5", width = 0.6) +
  geom_text(
    aes(label = percent(churn_rate, accuracy = 1)),
    vjust = -0.5,
    size = 4
  ) +
  scale_y_continuous(
    labels = percent_format(accuracy = 1),
    limits = c(0, 1),
    expand = expansion(mult = c(0, 0.1))
  ) +
  labs(
    title = "Churn Rate by Customer Type",
    subtitle = "Subscription customers retain better than one-time buyers",
    x = "Customer Type",
    y = "Churn Rate"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(size = 11),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10))
  )


















## CHURN BY ACQUISITION CHANNEL

# Calculate churn by acquisition channel

churn_by_channel <- final_data %>%
  group_by(acquisition_channel) %>%
  summarise(
    customers = n(),
    churn_rate = mean(churn_flag, na.rm = TRUE),
    .groups = "drop"
  )

churn_by_channel



# plot churn_rate by acquisition _channel

ggplot(
  churn_by_channel %>%
    arrange(desc(churn_rate)),
  aes(x = reorder(acquisition_channel, -churn_rate),
      y = churn_rate)
) +
  geom_col(fill = "#2C7BE5", width = 0.6) +
  geom_text(
    aes(label = scales::percent(churn_rate, accuracy = 1)),
    vjust = -0.5,
    size = 4
  ) +
  scale_y_continuous(
    labels = scales::percent_format(accuracy = 1),
    limits = c(0, 1)
  ) +
  labs(
    title = "Churn Rate by Acquisition Channel",
    subtitle = "Retention differs by marketing source",
    x = "Acquisition Channel",
    y = "Churn Rate"
  ) +
  theme_minimal(base_size = 13) +
  theme(plot.title = element_text(face = "bold"))




#determine primary product per customer

# Calculate  churn by product type

primary_product <- orders %>%
  group_by(customer_id, product_type) %>%
  summarise(order_count = n(), .groups = "drop") %>%
  group_by(customer_id) %>%
  slice_max(order_count, n = 1) %>%
  ungroup()




# joining to the final dataset  

final_data_product <- final_data %>%
  left_join(primary_product, by = "customer_id")



# Calculate churn_by _product

churn_by_product <- final_data_product %>%
  filter(!is.na(product_type)) %>%
  group_by(product_type) %>%
  summarise(
    customers = n(),
    churn_rate = mean(churn_flag, na.rm = TRUE),
    .groups = "drop"
  )

churn_by_product





# plotting  churn_rate  by product_type


library(scales)

ggplot(
  churn_by_product %>% arrange(desc(churn_rate)),
  aes(
    x = reorder(product_type, -churn_rate),
    y = churn_rate
  )
) +
  geom_col(fill = "#2C7BE5", width = 0.6) +
  geom_text(
    aes(label = percent(churn_rate, accuracy = 1)),
    vjust = -0.5,
    size = 4
  ) +
  scale_y_continuous(
    labels = percent_format(accuracy = 1),
    limits = c(0, 1)
  ) +
  labs(
    title = "Churn Rate by Product Type",
    subtitle = "Customer retention varies by primary product",
    x = "Product Type",
    y = "Churn Rate"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold")
  )







