CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    age INT,
    height INT,  -- in cm
    weight INT   -- in kg
);


CREATE TABLE Nutrients (
    id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE Exercises (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,  -- e.g., Cardio, Strength, Flexibility
    calories_burned_per_min FLOAT NOT NULL  -- average calories burned per minute
);


CREATE TABLE User_Exercises (
    exercise_entry_id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    exercise_id BIGINT NOT NULL,
    duration FLOAT NOT NULL,  -- duration in minutes
    date DATE NOT NULL,
    calories_burned FLOAT NOT NULL,  -- calculated based on duration and exercise
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(id)
);
CREATE TABLE Exercises (
    id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,  -- e.g., Cardio, Strength, Flexibility
    calories_burned_per_min FLOAT NOT NULL  -- average calories burned per minute
);

CREATE TABLE Food_Items (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    calories_gm BIGINT NOT NULL  -- calories per gram
);


CREATE TABLE Food_Nutrient_Details (
    id BIGINT PRIMARY KEY ,
    food_id BIGINT NOT NULL,
    nutrient_id BIGINT NOT NULL,
    amount FLOAT NOT NULL,  -- amount of the nutrient in the food item
    FOREIGN KEY (food_id) REFERENCES Food_Items(id),
    FOREIGN KEY (nutrient_id) REFERENCES Nutrients(id)
);


CREATE TABLE Meals (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    meal_type VARCHAR(50) NOT NULL,  -- e.g., Breakfast, Lunch, Dinner
    FOREIGN KEY (user_id) REFERENCES Users(id)
);


CREATE TABLE Meal_Food_Items (
    id BIGINT PRIMARY KEY ,
    meal_id BIGINT NOT NULL,
    food_id BIGINT NOT NULL,
    serving_amount FLOAT NOT NULL,  -- serving amount in grams or appropriate unit
    FOREIGN KEY (meal_id) REFERENCES Meals(id),
    FOREIGN KEY (food_id) REFERENCES Food_Items(id)
);


CREATE TABLE Daily_Nutrient_Intake (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    date DATE NOT NULL,
    total_calories BIGINT NOT NULL,
    total_carbohydrates BIGINT NOT NULL,
    total_protein BIGINT NOT NULL,
    total_fat BIGINT NOT NULL,
    total_fiber BIGINT NOT NULL,
    total_sugar BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
CREATE INDEX idx_food_nutrient_details_food_id ON Food_Nutrient_Details(food_id);
CREATE INDEX idx_food_nutrient_details_nutrient_id ON Food_Nutrient_Details(nutrient_id);
CREATE INDEX idx_meal_food_items_meal_id ON Meal_Food_Items(meal_id);
CREATE INDEX idx_meal_food_items_food_id ON Meal_Food_Items(food_id);
CREATE INDEX idx_daily_nutrient_intake_user_id ON Daily_Nutrient_Intake(user_id);
CREATE VIEW User_Daily_Nutrient_Summary AS
SELECT
    u.name AS user_name,
    dni.date,
    dni.total_calories,
    dni.total_carbohydrates,
    dni.total_protein,
    dni.total_fat,
    dni.total_fiber,
    dni.total_sugar
FROM
    Daily_Nutrient_Intake dni
JOIN
    Users u ON dni.user_id = u.id;
