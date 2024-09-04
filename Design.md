# Nutrition-Database-
project title: SQL Database for Nutrition and Exercise Tracking By YOUR NAME HERE: Mohammad Sahil Khan github_username: Mdsahil0918 and edx_username:sahil0918 country :india date:23-8-2024 Video overview: https://youtu.be/wBGxat-ZjNs

Scope
The purpose of the database is to help individuals track and analyze their daily nutrient intake and exercise activities. By recording information about the food they consume and the exercises they perform, users can monitor their health, make informed decisions about their diet and fitness, and work towards specific health goals.

In-Scope: People: Users who wish to track their nutrient intake and exercise activities. Things: Nutrient Information: Details about different nutrients like protein, carbohydrates, fats, etc. Food Items: Information about various food items including their nutrient content and caloric values. Meals: Specific meals consumed by users, which are made up of different food items. Exercise Activities: Different types of exercises with their corresponding categories (e.g., Cardio, Strength). User Data: Basic information about the users such as age, height, weight, gender.

Out-of-Scope: Places: The database does not track the locations where food is consumed or where exercises are performed. Medical Information: The database does not handle detailed medical history or conditions of users. Social Interactions: The database does not track social interactions related to food consumption or exercise, such as group workouts or shared meals.

Functional Requirements
In-Scope Functionalities: Users should be able to: -> Log their daily meals by selecting food items and specifying serving sizes. -> Track their daily nutrient intake (calories, proteins, carbs, fats, etc.). -> Log their exercise activities, including type of exercise, duration, and calories burned. -> View reports and insights on their daily, weekly, and monthly nutrient intake and exercise performance. -> Compare their caloric intake against calories burned through exercise.

Out-of-Scope Functionalities: Users should not be able to: -> Access other users' data (the database is designed for individual use). -> Log subjective factors like hunger levels, mood, or energy levels without additional attributes and entities. -> Integrate with external fitness or diet tracking apps (without additional development or API creation).

Representation
Entities
Users Attributes: id, name, gender, age, height, weight Reasoning: The Users entity stores basic personal information necessary for calculating personalized nutritional and fitness data, like caloric needs.

Nutrients Attributes: id, name Reasoning: Nutrients represent key dietary components like protein, carbs, and fats, which are essential for monitoring dietary intake.

Food_Items Attributes: id, name, calories_gm Reasoning: Food items store information about individual foods, including their caloric content, which is crucial for calculating total intake.

Food_Nutrient_Details Attributes: id, food_id, nutrient_id, amount Reasoning: This entity links food items to their nutrient content, enabling detailed nutrient tracking for each food consumed.

Meals Attributes: id, user_id, meal_type Reasoning: Meals track when and what the user eats, categorizing their intake by meal type (e.g., breakfast, lunch, dinner).

Meal_Food_Items Attributes: id, meal_id, food_id, serving_amount Reasoning: This entity links meals to specific food items and their serving sizes, enabling accurate tracking of what is consumed in each meal.

Daily_Nutrient_Intake Attributes: id, user_id, date, total_calories, total_carbohydrates, total_protein, total_fat, total_fiber, total_sugar Reasoning: Tracks aggregate daily nutrient intake to monitor overall dietary health on a daily basis.

Relationships
Optimizations
In this section you should answer the following questions:

Which optimizations (e.g., indexes, views) did you create? Why? Indexes idx_meals_user_id on Meals(user_id):
Purpose: This index speeds up queries that filter or join the Meals table using the user_id column. This is particularly useful if you frequently need to retrieve meals for a specific user. idx_food_nutrient_details_food_id on Food_Nutrient_Details(food_id):

Purpose: Enhances performance for queries that involve the food_id in the Food_Nutrient_Details table, such as when fetching nutrient details for a specific food item. idx_food_nutrient_details_nutrient_id on Food_Nutrient_Details(nutrient_id):

Purpose: Improves query performance for operations involving the nutrient_id column, which could be useful when looking up specific nutrient details. idx_meal_food_items_meal_id on Meal_Food_Items(meal_id):

Purpose: Accelerates queries that filter or join by meal_id in the Meal_Food_Items table, which is useful for retrieving all food items associated with a particular meal. idx_meal_food_items_food_id on Meal_Food_Items(food_id):

Purpose: Optimizes queries involving the food_id column, helping quickly identify all meals that include a particular food item. idx_daily_nutrient_intake_user_id on Daily_Nutrient_Intake(user_id):

Purpose: Speeds up queries filtering or joining by user_id in the Daily_Nutrient_Intake table, which is beneficial when analyzing daily nutrient intake for specific users. Views Purpose: This view consolidates daily nutrient intake data with user information, making it easier to generate summary reports and perform analyses. It simplifies querying by allowing you to access summarized nutrient intake data along with user names directly, without needing to join tables repeatedly in your queries.

Limitations
Design Limitations: Limited Exercise Details: The database tracks basic exercise details, but does not accommodate complex exercise routines or variations in caloric burn due to intensity, fitness level, etc. Static Food Data: Food items and nutrient details are static, meaning that changes in food composition (e.g., seasonal changes, new recipes) are not easily handled. No Advanced Dietary Considerations: The database does not account for micronutrients, special diets, or medical conditions without additional attributes or entities.

Potential Representation Issues: Custom Food Items: The database may struggle to accurately represent user-defined or custom food items without additional data entry and validation processes. User Variability: Differences in metabolism, exercise efficiency, and dietary needs are not individually customized, which may lead to inaccuracies in nutrient and calorie tracking for certain users.
