# www.linkedin.com-in-saicharankompala
To forecast silk production in India  till 2030
BUSINESS FORECASTING
CIA-II
Problem statement: To forecast silk production in India to help stakeholders make better decisions about resources, inventory, and planning. Using past data, to predict silk production for the next ten year
Background: Silk production is a vital agricultural and industrial activity in India, contributing significantly to the economy. Accurate forecasting of silk production is crucial for stakeholders, including farmers, industry players, and policymakers, to make informed decisions regarding resource allocation, inventory management, and strategic planning. Given the historical data on silk production over the past two decades, there is a need to develop a reliable forecasting model to predict future production trends.
Dataset: Annual total silk production data from 2000 to 2023.
DATASET LINK: https://www.data.gov.in/apis/a7db3d23-45da-43b7-8afb-302904db3e4b

Methodology
1. Data Collection:
•	Dataset: The dataset used for the analysis is a historical record of silk production in India. The data includes yearly observations of silk production and is formatted as a time series.
2. Data Preparation:
•	Time Series Creation: The data is converted into a time series object suitable for analysis. Any missing values or anomalies are addressed through data cleaning procedures.
•	Stationarity Check: Time series data is examined for stationarity using the Augmented Dickey-Fuller test. If the data is non-stationary, appropriate differencing is applied to achieve stationarity.
3. Model Selection:
•	Simple Exponential Smoothing: A forecasting technique that assumes the future values of the series depend on past values with an exponentially decreasing weight. It is used when data does not exhibit trends or seasonality.
•	Simple Moving Average: A smoothing technique that averages the data over a specified number of periods to reduce noise and highlight trends. It is suited for short-term forecasts and when seasonality or trend is minimal.
•	ARIMA Model: An Autoregressive Integrated Moving Average model that incorporates differencing to handle non-stationarity, and combines autoregressive (AR) and moving average (MA) components to capture the underlying data patterns.
•	Holt's Linear Trend Model: An extension of Exponential Smoothing that accounts for trends in the data. It is suitable for data with a linear trend. 
•	Holt-Winters Model: An extension of Exponential Smoothing that includes components for trend and seasonality. It can be additive or multiplicative based on the nature of the seasonality in the data.
4. Model Fitting and Evaluation:
•	Model Fitting: Each model (Simple Exponential Smoothing, Simple Moving Average, ARIMA, Holt’s Linear Trend, and Holt-Winters) is fitted to the historical data to generate forecasts.
•	Model Evaluation:
o	AIC Calculation: The Akaike Information Criterion (AIC) is calculated for each model to measure the goodness of fit while penalizing for complexity.
o	Residual Analysis: Residuals (differences between observed and forecasted values) are analyzed to ensure that they are randomly distributed and that no patterns remain unaccounted for.
o	Validation: The model’s performance is validated using out-of-sample forecasts and statistical tests such as the Ljung-Box test to check for autocorrelation in residuals.
5. Forecasting: 
•	Model Selection: Based on AIC values and residual analysis, the most suitable model is selected for making future forecasts.
•	Forecast Generation: The selected model is used to generate forecasts for the next ten years. Forecast intervals are provided to indicate the range of uncertainty in the predictions.
6. Interpretation and Reporting:
•	Forecast Interpretation: The forecasts are interpreted in the context of silk production trends and potential impacts on resource planning and inventory management.
7. Recommendations:
•	Model Application: Based on the analysis, recommendations are made for the most appropriate forecasting model to use for future silk production, considering factors such as accuracy and simplicity.
 

From 2000 to 2022, the chart shows a clear upward trend in total silk production. Initially, production fluctuated between 15,000 and 17,000 units from 2000 to 2004. Starting around 2005, production began to rise steadily. The period between 2010 and 2015 marked significant growth, with production increasing sharply. After 2015, production continued to increase but with some fluctuations, showing notable peaks and slight declines, particularly around 2017, 2019, and 2020. By 2022, total silk production had surpassed 35,000 units, more than doubling since 2000. This indicates a robust and growing silk industry despite periodic variances.










MAKING THE DATA SET STATIONARY.
Test Type	Dickey-Fuller Statistic	p-value	Interpretation
Original Data (total_ts)	-2.2816	0.4651	Not stationary. The high p-value indicates that we fail to reject the null hypothesis, meaning the original series is likely to have a unit root and is not stationary.
First Differenced Data (Total_diff)	-2.6311	0.332	Still not stationary. The p-value remains high, indicating that the first differencing was not sufficient to make the series stationary.
Second Differenced Data (Total_diff2)	-4.3077	0.01252	Stationary. The p-value is below 0.05, indicating that we can reject the null hypothesis. The twice-differenced data is stationary, making it suitable for time series modeling.

SIMPLE EXPONENTIAL SMOOTHING














The chart shows the historical trend and future forecast of total silk production using simple exponential smoothing. From 2000 to around 2022, the historical data indicate a general upward trend in silk production, increasing from approximately 15,000 units in 2000 to over 35,000 units by 2022, despite some fluctuations.
The forecast section, starting from 2022 onward, provides a projected continuation of this trend up to 2030. The central blue line represents the forecasted values, which suggest a stabilization around the 35,000 to 37,000 unit range. The shaded areas represent the prediction intervals, indicating the uncertainty associated with the forecasts. The darker shaded region shows a higher confidence interval, suggesting that future production is most likely to fall within this range. The lighter shaded regions provide a broader range of possible outcomes, showing increasing uncertainty as the forecast extends further into the future.


Year	Point Forecast	Lo 80	Hi 80	Lo 95	Hi 95
2023	36,581.83	34,495.85	38,667.81	33,391.60	39,772.06
2024	36,581.83	33,631.96	39,531.71	32,070.39	41,093.28
2025	36,581.83	32,969.05	40,194.62	31,056.56	42,107.11
2026	36,581.83	32,410.18	40,753.48	30,201.85	42,961.82
2027	36,581.83	31,917.81	41,245.85	29,448.83	43,714.84
2028	36,581.83	31,472.67	41,690.99	28,768.04	44,395.62
2029	36,581.83	31,063.32	42,100.34	28,142.00	45,021.67
2030	36,581.83	30,682.30	42,481.36	27,559.28	45,604.38
2031	36,581.83	30,324.45	42,839.22	27,011.99	46,151.68
2032	36,581.83	29,985.98	43,177.69	26,494.34	46,669.32
					
•  Point Forecast: The predicted value for silk production each year.
•  Lo 80 / Hi 80: 80% confidence interval bounds for the forecast.
•  Lo 95 / Hi 95: 95% confidence interval bounds for the forecast.
•  AIC: 340.0741 (used for model comparison; lower values indicate a better fit).
Simple Exponential Smoothing: Provides a constant forecast value with varying confidence intervals. The AIC value helps compare this model with others.
The SES model gives a constant forecast value for future periods with a specific range of uncertainty (confidence intervals). For silk production, this model is useful if the data does not exhibit trends or seasonal patterns, providing a straightforward estimate of future production.











Holt’s Linear Trend Model
 
The chart presents a time series analysis using Holt's method to forecast future values based on historical data. The data spans from the year 2000 to early 2003, showing a high degree of variability with peaks and troughs in the range of 0 to 4000 units. Holt's method, which is designed to handle data with trends, is used to project the future trend beyond the observed period into 2003.From the chart, it is evident that the historical data has significant fluctuations, suggesting a volatile process. The forecasted values, represented by the blue line, indicate a continuation of the existing pattern, albeit with some smoothing effect. The shaded region around the forecast line represents the confidence intervals, which widen as the forecast extends further into the future, reflecting increasing uncertainty.
The forecast suggests a slight decline in the trend, but the wide confidence intervals highlight the potential for considerable variability. This implies that while the model expects a general downward movement, the actual values could still vary widely within this range.Overall, this forecast can aid decision-makers in planning for a range of possible outcomes, emphasizing the need for flexibility due to the inherent uncertainty in the projections. The high volatility of the data underscores the importance of considering a broad range of scenarios in strategic planning.




Month-Year	Point Forecast	Lo 80	Hi 80	Lo 95	Hi 95
Jan-03	2,314.15	1,011.65	3,616.64	322.15	4,306.14
Feb-03	2,295.04	992.54	3,597.53	303.04	4,287.03
Mar-03	2,275.92	973.43	3,578.42	283.93	4,267.92
Apr-03	2,256.81	954.31	3,559.30	264.81	4,248.80
May-03	2,237.70	935.2	3,540.19	245.7	4,229.69
Jun-03	2,218.58	916.09	3,521.08	226.59	4,210.58
Jul-03	2,199.47	896.97	3,501.97	207.47	4,191.47
Aug-03	2,180.36	877.86	3,482.85	188.36	4,172.36
Sep-03	2,161.24	858.75	3,463.74	169.25	4,153.24
Oct-03	2,142.13	839.63	3,444.63	150.13	4,134.13
Month-Year	Point Forecast	Lo 80	Hi 80	Lo 95	Hi 95
Jan-03	1,148.17	-559.36	2,855.70	-1,463.27	3,759.61
Feb-03	2,830.73	1,123.20	4,538.25	219.29	5,442.17
Mar-03	2,737.68	1,030.15	4,445.21	126.24	5,349.12
Apr-03	2,171.21	463.68	3,878.74	-440.23	4,782.65
May-03	2,615.57	908.04	4,323.10	4.13	5,227.01
Jun-03	2,977.87	1,270.34	4,685.40	366.43	5,589.32
Jul-03	1,592.35	-115.18	3,299.88	-1,019.09	4,203.80
Aug-03	2,891.64	1,184.10	4,599.17	280.19	5,503.08

•  Point Forecast: Forecast values for each month.
•  Lo 80 / Hi 80: 80% confidence interval boun•  
Lo 95 / Hi 95: 95% confidence interval bounds.
•  AIC: 498.2853.
Holt-Winters Model

 If silk production data shows a consistent upward or downward trend, Holt’s model adjusts forecasts to account for this trend, making it useful for predicting future production based on historical trends



 
•	The chart showcases a time series analysis using the Holt-Winters' additive method to forecast future values based on historical data. The observed data spans from the year 2000 to early 2003, characterized by significant fluctuations within a range of 0 to 4000 units. The Holt-Winters' additive method, which accounts for both trends and seasonality, is employed to project the data beyond the observed period into 2005.The historical data demonstrates high volatility, with pronounced peaks and valleys. The forecasted values, represented by the blue line, exhibit a pattern that continues the historical trend but incorporates a seasonal component, which is typical for the Holt-Winters' additive method. The shaded regions around the forecast line represent the confidence intervals, which become increasingly broad as the forecast extends into the future, indicating greater uncertainty.

•	The forecast suggests that the future values will follow a similar fluctuating pattern with an expected seasonal effect. However, the wide confidence intervals highlight the potential for significant variability. This implies that while the model provides a probable trend and seasonal pattern, the actual values could deviate considerably within this range.This forecast is valuable for decision-makers as it highlights the need to plan for various possible outcomes. The high degree of volatility and the presence of seasonality emphasize the importance of considering multiple scenarios in strategic planning. The inherent uncertainty in the projections underscores the necessity for flexibility and adaptability in decision-making processes
•	Lo 80 / Hi 80: 80% confidence interval bounds.
•	Lo 95 / Hi 95: 95% confidence interval bounds.
•	AIC: 502.8603.
SIMPLE MOVING AVERAGE
Metric	Value
AIC for Linear Model	354.6161
Residuals	-835.9905, -1373.3515, -322.0232, 143.1158, 371.0871, -411.2426, -728.3338, 172.8719, 172.4768, 1205.8964, 449.9413, 1158.6933, 1439.9031, -414.7590, 76.9930, 532.6851, 1700.8363, 166.7109, -2525.7850, -1198.0370, 218.3117
 
The chart presents a time series analysis using a simple moving average (SMA) to smooth out fluctuations in the original data. The data spans from the year 2000 to 2020, with total values ranging from 15,000 to 35,000 units. The blue line represents the original data, while the red line depicts the SMA, which provides a smoothed version of the data by averaging values over a specified period.
The original data shows a general upward trend, with some fluctuations and variability over the years. Notably, there are periods of more rapid increases, especially after 2010, indicating a significant upward shift in the trend. The SMA line smooths these fluctuations, making it easier to observe the overall trend without the noise from short-term variations.
The simple moving average highlights a steady increase in the total values over the entire period. While the original data has more pronounced peaks and troughs, the SMA line provides a clearer picture of the underlying trend. This is particularly useful for identifying long-term patterns and making strategic decisions based on a more stable view of the data.
, the chart demonstrates the utility of the simple moving average in time series analysis, allowing for a clearer interpretation of long-term trends amid short-term fluctuations. This can be valuable for decision-makers who need to understand the overall direction of the data and make informed choices based on this trend. The steady increase shown by the SMA indicates positive growth, but the original data's fluctuations suggest that some caution may be necessary when making predictions or decisions based on short-term data points.

For the silk production forecasting, these analyses help evaluate how well the Simple Moving Average (SMA) model captures historical production trends and whether a linear model can adequately describe the relationship between the original series and its moving average. If residuals show significant patterns, it may indicate the need for more sophisticated models.


ARIMA
 
The plot displayed is the Autocorrelation Function (ACF) of the residuals from a time series model. The ACF is used to determine the correlation between the residuals at different lags.
In this chart, the x-axis represents the lag (the time difference between observations), while the y-axis shows the autocorrelation values. The horizontal dashed blue lines indicate the confidence intervals (usually set at ±1.96/sqrt(n), where n is the sample size).
Key observations:
1.	Lag 0: The autocorrelation at lag 0 is 1, which is expected because it represents the correlation of the residuals with themselves.
2.	Significant Lag 1: There is a significant spike at lag 1 that crosses the upper confidence limit. This suggests that there is a strong positive autocorrelation at this lag, indicating that the residuals are not independent and there is some pattern or structure left in the residuals at this lag.
3.	Other Lags: The autocorrelations for other lags mostly fall within the confidence limits, suggesting that, apart from lag 1, the residuals at other lags do not exhibit significant autocorrelation.


















The plot displayed is the Partial Autocorrelation Function (PACF) of the residuals from a time series model. The PACF helps to identify the extent of correlation between a time series and its lags after removing the effects of intermediate lags.
In this chart, the x-axis represents the lag (the time difference between observations), while the y-axis shows the partial autocorrelation values. The horizontal dashed blue lines indicate the confidence intervals (usually set at ±1.96/sqrt(n), where n is the sample size).
Key observations:
1.	Lag 1: There is a significant spike at lag 1 that crosses the upper confidence limit, indicating a strong positive partial autocorrelation at this lag. This suggests that the residuals have a direct relationship with their immediate past values.
2.	Lag 6: There is another notable spike at lag 6 that crosses the upper confidence limit, suggesting some pattern or structure left in the residuals at this lag as well.
3.	Other Lags: The partial autocorrelations for other lags mostly fall within the confidence limits, indicating that, apart from lag 1 and lag 6, the residuals at other lags do not exhibit significant partial autocorrelation.

 
The plot displayed shows the forecast of total silk production over time. The x-axis represents the years from 2000 to 2030, while the y-axis shows the production quantity. The historical data is depicted by the black line, and the forecasted values are shown by the blue line with a grey shaded area representing the confidence intervals of the forecast.
Key observations:
1.	Historical Trend: From 2000 to around 2020, there is a clear upward trend in silk production, indicating steady growth over the years. There are some fluctuations, but the overall trend is positive.
2.	Forecast Period: The forecast extends from 2020 to 2030. The blue line represents the predicted trend, continuing the historical growth pattern.
3.	Confidence Intervals: The grey shaded area around the forecast line represents the confidence intervals, indicating the uncertainty in the forecast. As time progresses, the confidence interval widens, reflecting increasing uncertainty in the predictions. By 2030, the forecast suggests that silk production could be anywhere between approximately 30,000 and 50,000 units, though the most likely value is around 40,000 units.
Overall, this plot suggests that the silk production is expected to continue growing in the coming decade, though there is considerable uncertainty about the exact future values. The widening confidence intervals highlight the challenges in making long-term predictions, emphasizing the need for continuous monitoring and model updating as new data becomes available.
ARIMA Model Results		
Metric	Value	Explanation
ARIMA Model	ARIMA(0,1,0) with drift	The best model selected by auto. Arima. This model has a drift term and no autoregressive or moving average components.
Coefficients	Drift: 942.0455	The estimated drift term in the ARIMA model, which helps account for any trends in the data.
Standard Error of Drift	273.14	The standard error of the drift coefficient, indicating the precision of the estimated drift.
sigma^2	17,19,503.00	The estimated variance of the residuals, representing the amount of variation unexplained by the model.
Log Likelihood	-188.64	The log likelihood of the fitted model, used in calculating AIC.
AIC	381.28	Akaike Information Criterion, used for model comparison (lower is better).
AICc	381.91	AIC with correction for small sample sizes.
BIC	383.46	Bayesian Information Criterion, also used for model comparison (lower is better).
		
Training Set Error Measures		
		
Measure	Value	Explanation
ME	0.65	Mean Error, showing average bias in predictions.
RMSE	1,252.99	Root Mean Squared Error, representing the average magnitude of errors.
MAE	962.17	Mean Absolute Error, showing average magnitude of absolute errors.
MPE	-0.4906758	Mean Percentage Error, indicating the average percentage bias.
MAPE	3.979647	Mean Absolute Percentage Error, showing the average percentage error.
MASE	0.7369615	Mean Absolute Scaled Error, comparing the model’s error to a naive forecast.
ACF1	0.07920139	Autocorrelation of residuals at lag 1, indicating residual autocorrelation.
		
Forecasting Results		
		
Year	Point Forecast	Lower 95% CI
2023	37524.05	34953.95
2024	38466.09	34831.42
2025	39408.14	34956.6
2026	40350.18	35209.99
2027	41292.23	35545.31
2028	42234.27	35938.85
2029	43176.32	36376.48
2030	44118.36	36849.03
2031	45060.41	37350.12
2032	46002.45	37875.09
		
Residuals		
		
Index	Residual	
1	14.91495	
2	551.95455	
3	-1974.04545	
4	-1519.04545	
5	-184.04545	
6	-137.04545	
7	227.95455	
8	-1097.04545	
9	-892.04545	
10	377.95455	
11	-222.04545	
12	1707.95455	
13	-323.04545	
14	1858.95455	
15	1285.95455	
16	-1127.04545	
17	882.95455	
18	615.95455	
19	2619.95455	
20	-590.04545	
21	-2992.04545	
22	190.95455	
23	736.95455	

Ljung-Box Test for Residuals' Autocorrelation
Lag 5 p-value: 0.364546
Lag 15 p-value: 0.3816597
Lag 20 p-value: 0.2398734

Explanation:	
The Ljung-Box test checks for autocorrelation in residuals. P-values greater than 0.05 suggest no significant autocorrelation at the tested lags, indicating that the residuals are approximately white noise and that 


Relation to the Problem Statement
Problem Statement:
“We need to forecast silk production in India to help stakeholders make better decisions about resources, inventory, and planning. Using past data, to predict silk production for the next ten years.”
**1. Model Application:
Forecasting Silk Production: The ARIMA model is applied to predict future silk production based on historical data. The model helps forecast production levels for the next decade, which is crucial for planning and resource allocation.
Decision Making: By providing forecasts with confidence intervals, the ARIMA model supports stakeholders in making informed decisions about inventory and resource management.
**2. Model Benefits:
Trend and Drift Modelling: The ARIMA model you used (ARIMA (0,1,0) with drift) accounts for trends in the data through the drift term. This is useful for capturing any long-term upward or downward trends in silk production.
Residual Analysis: The residuals and Ljung-Box test help ensure that the model adequately fits the data and that any patterns not captured by the model are minimal. This confirms the reliability of the forecasts.
**3. Forecasting Details:
Point Forecasts and Confidence Intervals: The forecasts provided by the ARIMA model give you future production estimates along with 95% confidence intervals, allowing you to assess the range of possible future values.
Error Metrics: Training set error measures (like RMSE and MAE) indicate how well the model has performed on historical data, which can be a proxy for its forecasting accuracy.

LEADER BOARD’
Model	AIC
Simple Exponential Smoothing	340.074
Simple Moving Average	354.616
ARIMA Model	381.276
Holt's Linear Trend Model	498.285
Holt-Winters Model	502.86






. Model Comparison:
•	Simple Exponential Smoothing (340.0741): This model performs best according to AIC, suggesting it is the most effective for your data among the models tested. It is especially suited for data with a clear level but no trend or seasonality.
•	Simple Moving Average (354.6161): Next best, this model is simpler but less effective in capturing trends compared to exponential smoothing.
•	ARIMA Model (381.2757): ARIMA performs well but has a higher AIC, indicating more complexity or less fit compared to exponential smoothing.
•	Holt's Linear Trend Model (498.2853): Suitable for data with trends but performs poorly relative to other models in terms of AIC.
•	Holt-Winters Model (502.8603): This model accounts for seasonality and trends but is the least effective here, as shown by the highest AIC.

Comparison of Techniques
In this section, we compare various forecasting techniques used to predict future silk production. The comparison is based on the Akaike Information Criterion (AIC) values and their effectiveness in capturing the underlying patterns in the data.
1. Simple Exponential Smoothing:
•	AIC Value: 340.0741
•	Description: This method forecasts future values based on a weighted average of past observations, with more recent observations receiving higher weights.
•	When to Use: Best for data without trends or seasonality. It is suitable for short-term forecasts when the data does not exhibit significant fluctuations or patterns.
•	Strengths: Simple to implement and interpret, provides smooth forecasts.
•	Limitations: Not ideal for data with strong trends or seasonality, as it does not account for these patterns.
2. Simple Moving Average:
•	AIC Value: 354.6161
•	Description: This technique averages the data over a specified number of periods to reduce noise and highlight trends.
•	When to Use: Useful for short-term forecasting when the series is relatively stable without strong trends or seasonal effects.
•	Strengths: Easy to calculate and understand, smooths out fluctuations.
•	Limitations: Does not adapt to changes in trend or seasonality, which can lead to inaccurate forecasts if patterns change over time.
3. ARIMA Model:
•	AIC Value: 381.2757
•	Description: The ARIMA model combines autoregressive (AR) and moving average (MA) components and uses differencing to handle non-stationarity.
•	When to Use: Ideal for data with trends and seasonality, and when the series exhibits patterns that require more sophisticated modelling.
•	Strengths: Flexible and capable of modelling a wide range of time series patterns. It can handle non-stationary data through differencing.
•	Limitations: More complex to implement and requires careful tuning of parameters. Forecasts may be less accurate if the model is not properly specified.
4. Holt’s Linear Trend Model:
•	AIC Value: 498.2853
•	Description: An extension of exponential smoothing those accounts for linear trends in the data.
•	When to Use: Suitable for time series with a linear trend but without significant seasonality.
•	Strengths: Accounts for both level and trend, providing better forecasts for data with a clear upward or downward trend.
•	Limitations: Does not handle seasonality well; may not be suitable if the series exhibits strong seasonal effects.
5. Holt-Winters Model:
•	AIC Value: 502.8603
•	Description: An extension of exponential smoothing that includes components for trend and seasonality (can be additive or multiplicative).
•	When to Use: Best for time series with both trend and seasonality.
•	Strengths: Handles both trend and seasonality effectively, providing accurate forecasts for data with complex patterns.
•	Limitations: More complex than simple methods and may overfit if the seasonality and trend components are not properly specified.










Summary of Comparison:
Model	AIC Value	Strengths	Limitations	Best For
Simple Exponential Smoothing	340.0741	Simple, smooth forecasts	Not suitable for trend or seasonality	Short-term forecasts with no significant trend/seasonality
Simple Moving Average	354.6161	Easy to implement and interpret	Ignores trend/seasonality, may be less accurate	Short-term forecasts with minimal trend/seasonality
ARIMA Model	381.2757	Flexible, handles trends and non-stationarity	Complex, requires careful parameter tuning	Data with trends, patterns, and non-stationarity
Holt’s Linear Trend Model	498.2853	Accounts for linear trends	Does not handle seasonality	Data with linear trends, minimal seasonality
Holt-Winters Model	502.8603	Handles trend and seasonality	Complex, may overfit	Data with both trend and seasonality

















Conclusion:
Based on the Akaike Information Criterion (AIC) values for various forecasting models applied to the silk production data, the Simple Exponential Smoothing model is the most effective choice.
Simple Exponential Smoothing achieved the lowest AIC value of 340.0741, indicating it provides the best balance between model fit and complexity. This model is particularly effective for data with a stable level and no significant trend or seasonal patterns.
The Simple Moving Average model, with an AIC of 354.6161, also performs well but is slightly less effective than Exponential Smoothing.
The ARIMA Model has a higher AIC of 381.2757, reflecting more complexity or a lesser fit compared to Exponential Smoothing.
Holt's Linear Trend Model and Holt-Winters Model show even higher AIC values (498.2853 and 502.8603, respectively), suggesting they are less suited to the data compared to the other models.


















