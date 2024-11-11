Real Estate Data Analysis Project
Overview
This project involves performing data analysis on a real estate dataset, specifically focusing on house prices and various property features. Using the R programming language, this project applies several data manipulation and visualization techniques to explore relationships between property attributes, such as size, location, and renovation history, and their effect on housing prices.

The analysis is structured into six tasks, each aimed at uncovering insights about different aspects of the housing market based on the available data.

Dataset
The dataset used in this project is a CSV file containing real estate data. The key attributes in the dataset include:

price: Sale price of the property.
sqft_living: The square footage of the living space.
sqft_basement: The square footage of the basement.
floors: Number of floors in the house.
zipcode: Postal code of the property.
yr_built: The year the property was built.
yr_renovated: The year the property was last renovated.
grade: The quality of the building's materials and finish.

Libraries Used
The following R libraries were used for data manipulation, visualization, and analysis:
dplyr: For data wrangling and manipulation.
ggplot2: For creating various plots and visualizations.
scales: For scaling axes and color scales.
viridis: For creating attractive color scales for visualizations.
tidyr: For reshaping the data.

Tasks and Analysis

Task 1: Property Distribution by Zip Code Over Time
Objective: Analyze the distribution of property prices across different zip codes over time.
Method: A boxplot is used to display price distributions in different zip codes, with faceting by year.
Insight: No clear trend was observed across years for most zip codes.

Task 2: Impact of Living Space and Basement on Property Prices
Objective: Explore the relationship between living space (sqft_living) and property prices, comparing properties with and without basements.
Method: Scatter plots are used to visualize the relationship, with color differentiation for properties with basements.
Insight: The price increases with the size of the living space, and the distribution is similar for properties with and without basements.

Task 3: Relationship Between Floor Count and Property Quality
Objective: Investigate if there is a relationship between the number of floors (floors) and the building's quality (grade).
Method: A violin plot is used to visualize this relationship.
Insight: A slight trend indicates that properties with more floors tend to have higher quality ratings.

Task 4: Lot Size vs. Living Space Across Bedrooms
Objective: Analyze the relationship between lot size (sqft_lot) and living space (sqft_living), segmented by the number of bedrooms (bedrooms).
Method: A scatter plot with a color gradient and facet wrapping by bedroom count is used.
Insight: No strong dependency between lot size and the number of bedrooms was observed.

Task 5: Renovations Over Time and Quality Distribution
Objective: Examine the number of renovations that took place over the decades and their impact on the quality of properties (grade).
Method: Bar charts and grouped bar plots are used to show the number of renovations by decade and the percentage of properties at each quality level.
Insight: The 2000-2010 decade saw the most renovations, and properties with grades between 6 and 8 were the most common.

Task 6: Price Statistics Over Time by Year Built
Objective: Track the minimum, median, and maximum prices of properties over the years since they were built.
Method: A line plot is used to visualize the evolution of price statistics over the years.
Insight: The minimum and maximum prices have increased significantly since 1980, and the statistics are quite similar over the years.

Conclusion
This project demonstrates a variety of data analysis techniques to explore the real estate market. Through the use of R and its powerful libraries (dplyr, ggplot2, viridis, and tidyr), we uncovered several insights, including the impact of property size, renovation history, and geographical location on housing prices. The visualizations provide an intuitive understanding of the data and highlight key trends within the real estate market.

Files
house_data.csv: The raw dataset used for the analysis.
script.R: script
