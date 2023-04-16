# sql-cheatsheet
3 hour 1 minutes https://www.youtube.com/watch?v=qw--VYLpxG4&t=1021s

Datatypes: https://www.postgresql.org/docs/current/datatype.html  
Aggregate Functions: https://www.postgresql.org/docs/9.5/functions-aggregate.html

Create SQL Data: https://mockaroo.com/



# Simple General Commands

Help
### `\?`

Database list
### `\l`

Select Database
### `\c <database name>`

Clear PSQL history
### `\! cls`

Import data
### `\i 'D:/Downloads/person.sql'`

See all tables in database
### `\d`

Exit from the enter for more options
### `\q`



# Querying Data

Select Data in order
### `select * from person ORDER BY id DESC;`

Select unqiue data only
### `select distinct country_of_birth from person order by country_of_birth;`

Select with multiple WHERE's shorthand
### `SELECT * FROM person WHERE country_of_birth IN ('China', 'Brazil', 'France');`

Select between two values
### `SELECT * FROM person WHERE date_of_birth BETWEEN DATE '2022-01-01' AND '2022-05-10';`

Select with LIKE
### `SELECT * FROM person WHERE email LIKE '%@bloomberg.com';`
These percent signs are like asterisks with CWM. One at the beginning searches for anything at the beginning, but wants it to end with what you have after it  
You can use underscores to represent a number of characters as well
### `SELECT * FROM person WHERE email LIKE '______@%';`

ILIKE ignores uppercase and lowercase
### `SELECT * FROM person WHERE email ILIKE '______@%';`

You can find the number of times an item is in a DB by using the COUNT() function
### `SELECT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth ORDER BY COUNT(*);`

HAVING keyword
### `SELECT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth HAVING COUNT(*) > 5 ORDER BY COUNT(*);`

Find max and min and average of price. Use ROUND to average with a round at the end
### `SELECT MAX(price) FROM car;`

More advanced SQL that shows the max price for each make
### `SELECT make, MAX(price) FROM car GROUP BY make;`







# Editing a table

Dropping a primary key in a table
### `ALTER TABLE person DROP CONSTRAINT person_pkey;` 

Add a primary key to a table named person
### `ALTER TABLE person ADD PRIMARY KEY (id);`

Delete a row from a table where id is 1
### `DELETE FROM person WHERE id = 1;`

Create a unique constraint
### `ALTER TABLE person ADD CONSTRAINT unique_email_address UNIQUE(email);`

Dropping the same unique constraint
### `ALTER TABLE person DROP CONSTRAINT unique_email_address;`

Delete a row in your table where id = 1
### `DELETE FROM person WHERE id = 1;`

Update a row in your table where id = 1. Use a comma to change multiple values
### `UPDATE person SET email = 'jacob@gmail.com' WHERE id=1;`
### `UPDATE person SET first_name = 'Jacob', last_name = 'Yancey' WHERE id = 2;`

Removing NOT NULL constraint
### `ALTER TABLE users ALTER COLUMN cart_id DROP NOT NULL;`







# Dealing with NULL Values and Error Handling

COALESCE Keyword will default to another value if the first value is null. This will set the value as 1
### `SELECT COALESCE(null, 1)`

You can use these in SELECTs as well. This will return "Email not provided" if email is null for a user
### `SELECT COALESCE(email, 'Email not provided') FROM person;`

NULLIF checks if a both values are the same. If it is it returns null, otherwise it returns the rist number
### `SELECT NULLIF(10, 10);` This returns null
### `SELECT NULLIF(20, 10);` This returns 20

This means dividing by zero can result in a null value rather than throwing an error. Or you can return another value with COALESCE
### `SELECT COALESCE(10 / NULLIF(0,0), 0);`






# Dates and Time

Use NOW() to select the current time. You can change the format with double colins
### `SELECT NOW()::DATE;`

You can take this further by manipulating this time data. This gets the current date and moves it back a year
### `SELECT NOW() - INTERVAL '1 YEAR';`

Extracting data from a date. This extracts the year
### `SELECT EXTRACT(YEAR FROM NOW());`

Use AGE() to find the amount of time between two dates
### `SELECT date_of_birth, AGE(NOW(), date_of_birth) FROM person ORDER BY date_of_birth;`





# Primary Keys
- They cannot be duplicated
- User to identify a row of a table

# Inner Joins
- Used to create a combined table
- ON keyword takes a column to join two tables
### `SELECT * FROM person JOIN car ON person.car_id = car.id;`
This allows you to get just the values you want from the two tables
### `SELECT person.first_name, car.make, car.model, car.price FROM person JOIN car ON person.car_id = car.id;`


# Left Joins
- Includes all the rows from the left table and the records from the other table, instead of just those who have a foreign key
###  `SELECT * FROM person LEFT JOIN car ON person.car_id = car.id;`


# Foreign Keys
- A foreign key is a column that references a primary key in another table
- Can only assign foreign keys where there is a relation in the other table  



# Bigserial and data types
- Also called bigint
- Gets a default value that's managed by a sequence



# Use UUIDs as Primary Key



# Extensions
Install extension to create UUID id's
### `CREATE EXTENSION IF NOT EXISTS "uuid-ossp";`

Check available extensions
### `SELECT * FROM pg_a;`
### `SELECT * FROM pg_available_extensions;



# Other

Require a column to hold specific data using a constraint
### `ALTER TABLE person ADD CONSTRAINT gender_constraint CHECK (gender = 'Female' OR gender = 'Male');`

Handle conflicts and errors with "ON CONFLICT(). If a unique value already exists and it gived you an error add an "ON CONFLICT"
### `INSERT INTO person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values(1, 'Jake', 'Yance', 'Male', 'email@gmail.com', DATE '2002-05-29', 'United States') ON CONFLICT(id) DO NOTHING`

Update something with ON CONFLICT(). Can user commas for multiple values if you want
### `INSERT INTO person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) values(1, 'Jake', 'Yance', 'Male', 'jacob@gmail.com', DATE '2002-05-29', 'United States') ON CONFLICT(id) DO UPDATE SET email = EXCLUDED.email, first_name = 'Jacob';`




You can have SQL return true and false.

Use LIMIT 10 in order to keep a request to 10 items
Use OFFSET 5 to start on the sixth item
