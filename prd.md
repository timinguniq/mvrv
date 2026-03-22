Product Requirements Document (PRD): BTC MVRV Tracker

1. Overview & Objective
- Objective: To visualize the complex on-chain Bitcoin MVRV (Market Value to Realized Value) metric intuitively, helping investors identify market overvaluation and undervaluation phases for data-driven trading decisions.
- Background: While many investors rely solely on price charts (technical analysis), MVRV, which compares Bitcoin's Realized Cap to its Market Cap, shows high reliability in identifying macroeconomic cycle bottoms and tops.

2. Target Audience
- Mid-to-long-term crypto investors: Individuals who focus on understanding macro market cycles and adjusting their investment weightings rather than reacting to short-term price volatility.
- Busy professional investors: People who need to check market conditions briefly during commutes or work hours and want to catch key investment signals without constantly monitoring charts.

3. Key Features Requirements

3.1. Interactive MVRV Dashboard (Core)
- A responsive line graph overlaying Bitcoin Price and the MVRV ratio.
- Timeframe filters: 1 Week (1W), 1 Month (1M), 3 Months (3M), 1 Year (1Y), and ALL.
- Tooltips displaying the exact BTC price and MVRV value when hovering or touching a specific date on the chart.

3.2. Intuitive Threshold Visualization & Insights
- Overvalued Zone (Red Zone): Highlight the chart background in red when the MVRV value exceeds 3.7.
- Undervalued/Accumulation Zone (Green Zone): Highlight the chart background in green when the MVRV value falls below 1.0.
- Daily Summary: Provide a clear text insight based on the current MVRV value, such as, "Bitcoin has currently entered an undervalued phase compared to its realized value."

3.3. Custom Alerts
- Allow users to set specific target MVRV values and receive mobile app push notifications or email alerts when reached.
- Examples: "Alert when MVRV drops below 1.0", "Alert when MVRV surpasses 3.0".

4. Data & Technical Requirements
- Data Source: Integration with on-chain data provider APIs (e.g., Glassnode, CryptoQuant) or implementing internal logic to calculate Realized Cap based on UTXO (Unspent Transaction Output) via our own node.
- Update Frequency: Real-time updates are ideal, but considering costs and API limits, guarantee at least one daily update (based on Daily Close).
- Platform: A responsive web design is essential to ensure the chart scales perfectly and allows smooth scrolling and zooming on mobile web environments.

5. Success Metrics
- Activity: WAU (Weekly Active Users) and average session duration per user.
- Feature Adoption (Activation Rate): The percentage of total registered users who have set up at least one custom alert.
- Retention: The percentage of users who return to the service after receiving an alert.