# SQL Project for Nutrition Database README
NUTRITION DATABASE 
Welcome to the SQL Project repository! This project provides a comprehensive set of SQL scripts designed for managing and analyzing user exercise, meal consumption, and nutritional intake data. Below you will find details on the project's purpose, setup instructions, and key SQL scripts used in the project.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Setup Instructions](#setup-instructions)
3. [SQL Scripts](#sql-scripts)
   - [Table Creation](#table-creation)
   - [Data Insertion](#data-insertion)
   - [Indexes and Views](#indexes-and-views)
   - [Queries](#queries)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

## Project Overview

This SQL project aims to:

- **Manage User Data**: Track user details including exercise routines and nutritional intake.
- **Analyze Nutritional and Exercise Data**: Use SQL queries to derive insights such as caloric balance, average nutrient intake, and exercise statistics.
- **Support Custom Queries**: Enable users to run custom queries for detailed data analysis.

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/sql-project.git
   ```

2. **Navigate to the Project Directory**
   ```bash
   cd sql-project
   ```

3. **Set Up the Database**
   - Create a new database instance (if needed).
   - Execute the SQL scripts to set up tables, insert data, and create indexes and views:
     ```bash
     mysql -u username -p database_name < create_tables.sql
     mysql -u username -p database_name < insert_data.sql
     mysql -u username -p database_name < indexes_views.sql
     ```

## SQL Scripts

### Table Creation

The `create_tables.sql` script establishes the database schema with the following tables:
- **Users**: Stores user information such as name, gender, age, height, and weight.
- **Nutrients**: Defines various nutrients tracked in the project.
- **Exercises**: Lists different types of exercises and their caloric burn rate.
- **User_Exercises**: Records exercise activities performed by users.
- **Food_Items**: Contains information about food items and their caloric content.
- **Food_Nutrient_Details**: Details nutrient composition for each food item.
- **Meals**: Logs meals associated with users.
- **Meal_Food_Items**: Records the food items included in each meal.
- **Daily_Nutrient_Intake**: Captures daily nutrient intake per user.

### Data Insertion

The `insert_data.sql` script populates the database with sample data:
- **Exercises**: Inserts data for different types of exercises.
- **User Exercises**: Logs sample exercise activities for users.
- **Nutrients**: Adds various nutrient types.
- **Food Items**: Inserts sample food items and their caloric values.
- **Food Nutrient Details**: Adds nutrient details for each food item.
- **Meals**: Logs example meals for users.
- **Meal Food Items**: Records the food items consumed in each meal.
- **Daily Nutrient Intake**: Adds sample daily nutrient intake records.

### Indexes and Views

The `indexes_views.sql` script creates indexes and views to optimize query performance:
- **Indexes**: Adds indexes to improve query efficiency on frequently queried columns.
- **Views**: Creates a view (`User_Daily_Nutrient_Summary`) to summarize daily nutrient intake by user.

### Queries

The SQL queries cover various analytical tasks:
- **Total Calories Consumed by User Each Day**
- **Average Daily Nutrient Intake Over 30 Days**
- **Top 5 Most Consumed Food Items**
- **Daily Average Macronutrient Ratios**
- **Most Nutrient-Dense Foods**
- **Total Calories Burned by User Each Day**
- **Net Caloric Balance Each Day (Calories Consumed - Calories Burned)**
- **Most Common Exercise Category**
- **Daily Exercise Duration Over 30 Days**
- **Calories vs. Exercise Over 30 Days**

## Usage

After setting up the database, you can run these queries to analyze the data and gain insights into user exercise habits, meal consumption, and nutritional intake.

