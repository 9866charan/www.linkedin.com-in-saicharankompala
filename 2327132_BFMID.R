# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tseries)
library(forecast)
library(TTR)

# Create the dataset
data <- data.frame(
  Years = c("2000-01", "2001-02", "2002-03", "2003-04", "2004-05", "2005-06", "2006-07", 
            "2007-08", "2008-09", "2009-10", "2010-11", "2011-12", "2012-13", "2013-14", 
            "2014-15", "2015-16", "2016-17", "2017-18", "2018-19", "2019-20", "2020-21", 
            "2021-22", "2022-23"),
  Total = c(15857, 17351, 16319, 15742, 16500, 17305, 18475, 18320, 18370, 19690, 20410, 
            23060, 23679, 26480, 28708, 28523, 30348, 31906, 35468, 35820, 33770, 34903, 36582)
)

# Convert Years to a numeric format
data$Years <- as.numeric(substr(data$Years, 1, 4))

# Convert the Total column to a time series object
total_ts <- ts(data$Total, start = 2000, frequency = 1)

# Plot the total production over the years
ggplot(data, aes(x = Years, y = Total)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "Total Silk Production Over the Years",
       x = "Years",
       y = "Total Production") +
  theme_minimal()

# Plot individual types of silk production over the years (example for demonstration)
# Assuming you have data for different types; here's how you would reshape the data
data_long <- data %>%
  gather(key = "Type", value = "Production", -Years, -Total)

ggplot(data_long, aes(x = Years, y = Production, color = Type)) +
  geom_line() +
  geom_point() +
  labs(title = "Silk Production by Type Over the Years",
       x = "Years",
       y = "Production") +
  theme_minimal()

# Perform the ADF test on the original data
adf_test <- adf.test(total_ts)
print(adf_test)

# If p-value is greater than 0.05, the data is not stationary, so we apply differencing
if (adf_test$p.value > 0.05) {
  # First difference
  data$Total_diff <- c(NA, diff(data$Total, differences = 1))
  
  # Perform the ADF test on the differenced data
  adf_test_diff <- adf.test(data$Total_diff[!is.na(data$Total_diff)])
  print(adf_test_diff)
  
  # If the p-value is still greater than 0.05, further differencing may be needed
  if (adf_test_diff$p.value > 0.05) {
    # Second difference
    data$Total_diff2 <- c(NA, NA, diff(data$Total, differences = 2))
    
    # Perform the ADF test on the twice-differenced data
    adf_test_diff2 <- adf.test(data$Total_diff2[!is.na(data$Total_diff2)])
    print(adf_test_diff2)
  }
}

################## Simple Exponential Smoothing ##################

# Simple Exponential Smoothing
ses_model <- ses(total_ts)

# Extract AIC and Residuals for SES
ses_residuals <- residuals(ses_model)
ses_rss <- sum(ses_residuals^2)
ses_n <- length(ses_residuals)
ses_k <- 1  # SES has only one parameter (smoothing parameter)

ses_aic <- ses_n * log(ses_rss / ses_n) + 2 * ses_k

# Print results
cat("Simple Exponential Smoothing Model:\n")
print(ses_model)
cat("AIC for Simple Exponential Smoothing:", ses_aic, "\n")
cat("Residuals for Simple Exponential Smoothing:\n")
print(ses_residuals)

# Plot Simple Exponential Smoothing
plot(ses_model)

################## Double Exponential Smoothing (Holt’s Linear Trend Model) ##################

# Convert the Total column to a time series object with monthly frequency
# Example data generation
monthly_data <- data.frame(
  Month = seq(as.Date("2000-01-01"), as.Date("2002-12-01"), by = "months"),
  Total = c(sample(1000:5000, 36, replace = TRUE))  # Example data
)

monthly_ts <- ts(monthly_data$Total, start = c(2000, 1), frequency = 12)

# Double Exponential Smoothing (Holt’s Linear Trend Model)
holt_model <- holt(monthly_ts)

# Triple Exponential Smoothing (Holt-Winters Model)
hw_model <- hw(monthly_ts, seasonal = "additive")

# Extract AIC and Residuals for Holt’s Model
holt_residuals <- residuals(holt_model)
holt_rss <- sum(holt_residuals^2)
holt_n <- length(holt_residuals)
holt_k <- 2  # Holt’s model has two parameters (level and trend)

holt_aic <- holt_n * log(holt_rss / holt_n) + 2 * holt_k

# Extract AIC and Residuals for Holt-Winters Model
hw_residuals <- residuals(hw_model)
hw_rss <- sum(hw_residuals^2)
hw_n <- length(hw_residuals)
hw_k <- 3  # Holt-Winters model has three parameters (level, trend, and seasonal)

hw_aic <- hw_n * log(hw_rss / hw_n) + 2 * hw_k

# Print results
cat("\nHolt’s Linear Trend Model:\n")
print(holt_model)
cat("AIC for Holt’s Linear Trend Model:", holt_aic, "\n")
cat("Residuals for Holt’s Linear Trend Model:\n")
print(holt_residuals)

cat("\nHolt-Winters Model:\n")
print(hw_model)
cat("AIC for Holt-Winters Model:", hw_aic, "\n")
cat("Residuals for Holt-Winters Model:\n")
print(hw_residuals)

# Plot Holt’s Linear Trend Model
plot(holt_model)

# Plot Holt-Winters Model
plot(hw_model)

################## Simple Moving Average ####################

# Define the window size for the moving average (for example, 3 years)
window_size <- 3



# Apply Simple Moving Average
sma_total <- SMA(total_ts, n = window_size)

# Remove NA values from SMA
valid_indices <- !is.na(sma_total)
sma_data <- data.frame(
  Years = time(total_ts)[valid_indices],
  Original = as.numeric(total_ts)[valid_indices],
  SMA = as.numeric(sma_total)[valid_indices]
)

# Fit a linear model to the SMA results to calculate residuals
lm_model <- lm(Original ~ SMA, data = sma_data)
sma_data$Residuals <- residuals(lm_model)

# Calculate AIC for the linear model
aic_sma <- AIC(lm_model)
cat("AIC value for the linear model:", aic_sma, "\n")

# Plot the original series and the moving average
plot(total_ts, type = "o", col = "blue", ylab = "Total", xlab = "Years", main = "Simple Moving Average")
lines(sma_total, type = "o", col = "red")
legend("topleft", legend = c("Original", "SMA"), col = c("blue", "red"), lty = 1, pch = 1)

# Print residuals
cat("Residuals of the linear model:\n")
print(sma_data$Residuals)

############################################### ARIMA ###################################################

# Create the dataset
data <- data.frame(
  Years = c("2000-01", "2001-02", "2002-03", "2003-04", "2004-05", "2005-06", "2006-07", 
            "2007-08", "2008-09", "2009-10", "2010-11", "2011-12", "2012-13", "2013-14", 
            "2014-15", "2015-16", "2016-17", "2017-18", "2018-19", "2019-20", "2020-21", 
            "2021-22", "2022-23"),
  Total = c(15857, 17351, 16319, 15742, 16500, 17305, 18475, 18320, 18370, 19690, 20410, 
            23060, 23679, 26480, 28708, 28523, 30348, 31906, 35468, 35820, 33770, 34903, 36582)
)

# Convert the Total column to a time series object
total_ts <- ts(data$Total, start = 2000, frequency = 1)

# Fit ARIMA model manually
manual_arima <- arima(total_ts, order = c(0, 2, 1))
summary(manual_arima)

# Automatically fit ARIMA model
auto_arima <- auto.arima(total_ts, ic = "aic", trace = TRUE)
summary(auto_arima)

# Print AIC value of the automatically fitted ARIMA model
cat("AIC value of the auto ARIMA model:", AIC(auto_arima), "\n")

# Check for stationarity in residuals
acf(ts(auto_arima$residuals), main = "ACF of Residuals")
pacf(ts(auto_arima$residuals), main = "PACF of Residuals")

# Forecasting
forecast_auto_arima <- forecast(auto_arima, level = c(95), h = 10)
plot(forecast_auto_arima, main = "Forecast of Total Silk Production")

# Validate the forecast
# Ljung-Box test for residuals' autocorrelation
lb_test_5 <- Box.test(auto_arima$residuals, lag = 5, type = "Ljung-Box")
lb_test_15 <- Box.test(auto_arima$residuals, lag = 15, type = "Ljung-Box")
lb_test_20 <- Box.test(auto_arima$residuals, lag = 20, type = "Ljung-Box")


cat("Ljung-Box test (lag=5) p-value:", lb_test_5$p.value, "\n")
cat("Ljung-Box test (lag=15) p-value:", lb_test_15$p.value, "\n")
cat("Ljung-Box test (lag=20) p-value:", lb_test_20$p.value, "\n")

# Print the forecast
print(forecast_auto_arima)

# Print residuals
cat("Residuals of the ARIMA model:\n")
print(auto_arima$residuals)

################## Leaderboard based on AIC ##################

# Create a data frame to store AIC values
aic_values <- data.frame(
  Model = c("Simple Exponential Smoothing", "Holt's Linear Trend Model", 
            "Holt-Winters Model", "Simple Moving Average", "ARIMA Model"),
  AIC = c(ses_aic, holt_aic, hw_aic, aic_sma, AIC(auto_arima))
)

# Sort by AIC value in ascending order
leaderboard <- aic_values %>%
  arrange(AIC)

# Print the leaderboard
cat("\nLeaderboard based on AIC values:\n")
print(leaderboard)

