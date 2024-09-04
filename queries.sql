-- In this SQL file, write (and comment!) the typical SQL queries users will run on your databaseCREATE INDEX idx_meals_user_id ON Meals(user_id);
INSERT INTO Exercises (id, name, category, calories_burned_per_min) VALUES
(1, 'Running', 'Cardio', 10),
(2, 'Weightlifting', 'Strength', 8),
(3, 'Yoga', 'Flexibility', 5);


-- Day 1
INSERT INTO User_Exercises (exercise_entry_id, user_id, exercise_id, duration, date, calories_burned) VALUES
(1, 1, 1, 30, '2024-08-01', 300),  -- Running for 30 minutes
(2, 1, 2, 20, '2024-08-01', 160);  -- Weightlifting for 20 minutes
-- Repeat similar entries for the next 29 days with variations.INSERT INTO Nutrients (id, name) VALUES
(1, 'Carbohydrates'),
(2, 'Protein'),
(3, 'Fat'),
(4, 'Fiber'),
(5, 'Sugar');
INSERT INTO Food_Items (id, name, calories_gm) VALUES
(1, 'Apple', 0.52),
(2, 'Chicken Breast', 1.65),
(3, 'Rice', 1.30),
(4, 'Broccoli', 0.55),
(5, 'Chocolate Bar', 5.35);

INSERT INTO Food_Nutrient_Details (id, food_id, nutrient_id, amount) VALUES
(1, 1, 1, 14.0),  -- Apple: 14g of carbohydrates per 100g
(2, 1, 4, 2.4),   -- Apple: 2.4g of fiber per 100g
(3, 2, 2, 31.0),  -- Chicken Breast: 31g of protein per 100g
(4, 2, 3, 3.6),   -- Chicken Breast: 3.6g of fat per 100g
(5, 3, 1, 28.0),  -- Rice: 28g of carbohydrates per 100g
(6, 4, 1, 7.0),   -- Broccoli: 7g of carbohydrates per 100g
(7, 4, 4, 2.6),   -- Broccoli: 2.6g of fiber per 100g
(8, 5, 3, 30.0),  -- Chocolate Bar: 30g of fat per 100g
(9, 5, 5, 50.0);  -- Chocolate Bar: 50g of sugar per 100g
INSERT INTO Meals (id, user_id, meal_type) VALUES
(1, 1, 'Breakfast'),
(2, 2, 'Lunch'),
(3, 3, 'Dinner');
INSERT INTO Meal_Food_Items (id, meal_id, food_id, serving_amount) VALUES
(1, 1, 1, 150.0),  -- John Doe: 150g of Apple for Breakfast
(2, 2, 2, 200.0),
(3, 3, 3, 250.0),
(4, 1, 4, 100.0),
(5, 3, 5, 50.0);
INSERT INTO Daily_Nutrient_Intake (id, user_id, date, total_calories, total_carbohydrates, total_protein, total_fat, total_fiber, total_sugar) VALUES
(1, 1, '2024-08-23', 250, 40, 10, 5, 4, 10),  -- John Doe's nutrient intake on 2024-08-23
(2, 2, '2024-08-23', 500, 30, 60, 10, 5, 0),  -- Jane Smith's nutrient intake on 2024-08-23
(3, 3, '2024-08-23', 1000, 200, 30, 70, 8, 50); -- Bob Johnson's nutrient intake on 2024-08-23


-- Total Calories Consumed by User Each Day
SELECT date, total_calories
FROM Daily_Nutrient_Intake
WHERE user_id = 1
ORDER BY date;


-- Average Daily Nutrient Intake Over 30 Days
SELECT
    AVG(total_calories) AS avg_daily_calories,
    AVG(total_protein) AS avg_daily_protein,
    AVG(total_carbohydrates) AS avg_daily_carbs,
    AVG(total_fat) AS avg_daily_fat
FROM Daily_Nutrient_Intake
WHERE user_id = 1;


-- Top 5 Most Consumed Food Items
SELECT
    fi.name,
    COUNT(mfi.food_id) AS times_consumed,
    SUM(mfi.serving_amount) AS total_servings
FROM Meal_Food_Items mfi
JOIN Food_Items fi ON mfi.food_id = fi.id
JOIN Meals m ON mfi.meal_id = m.id
WHERE m.user_id = 1
GROUP BY fi.name
ORDER BY total_servings DESC
LIMIT 5;


-- Daily Average Macronutrient Ratios
SELECT
    AVG(total_protein / total_calories) * 100 AS avg_protein_ratio,
    AVG(total_carbohydrates / total_calories) * 100 AS avg_carb_ratio,
    AVG(total_fat / total_calories) * 100 AS avg_fat_ratio
FROM Daily_Nutrient_Intake
WHERE user_id = 1;


-- Most Nutrient-Dense Foods
SELECT
    fi.name,
    SUM(fnd.amount) AS total_nutrient_amount
FROM Food_Nutrient_Details fnd
JOIN Food_Items fi ON fnd.food_id = fi.id
WHERE fnd.nutrient_id IN (1, 2, 3)  -- Protein, Carbs, Fat
GROUP BY fi.name
ORDER BY total_nutrient_amount DESC
LIMIT 5;


-- Total Calories Burned by User Each Day
SELECT date, SUM(calories_burned) AS total_calories_burned
FROM User_Exercises
WHERE user_id = 1
GROUP BY date
ORDER BY date;


-- Net Caloric Balance Each Day (Calories Consumed - Calories Burned)
SELECT
    dni.date,
    dni.total_calories - COALESCE(SUM(ue.calories_burned), 0) AS net_caloric_balance
FROM Daily_Nutrient_Intake dni
LEFT JOIN User_Exercises ue ON dni.user_id = ue.user_id AND dni.date = ue.date
WHERE dni.user_id = 1
GROUP BY dni.date, dni.total_calories
ORDER BY dni.date;


-- Most Common Exercise Category
SELECT
    e.category,
    COUNT(ue.exercise_id) AS count
FROM User_Exercises ue
JOIN Exercises e ON ue.exercise_id = e.id
WHERE ue.user_id = 1
GROUP BY e.category
ORDER BY count DESC
LIMIT 1;


-- Daily Exercise Duration Over 30 Days
SELECT
    date,
    SUM(duration) AS total_exercise_duration
FROM User_Exercises
WHERE user_id = 1
GROUP BY date
ORDER BY date;


-- Calories vs. Exercise Over 30 Days
SELECT
    dni.date,
    dni.total_calories,
    COALESCE(SUM(ue.calories_burned), 0) AS total_calories_burned
FROM Daily_Nutrient_Intake dni
LEFT JOIN User_Exercises ue ON dni.user_id = ue.user_id AND dni.date = ue.date
