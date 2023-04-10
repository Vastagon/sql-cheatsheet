# sql-cheatsheet
1 hour 21 minutes https://www.youtube.com/watch?v=qw--VYLpxG4&t=1021s

Datatypes: https://www.postgresql.org/docs/current/datatype.html

Create SQL Data: https://mockaroo.com/

Help
### `\?`

Database list
### `\l`

Select Database
### `\c <database name>`

Clear PSQL history
### `\! cls`

See all tables in database
### `\d`

Exit from the enter for more options
### `\q`

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

Import data
### `\i 'D:/Downloads/person.sql'`

You can have SQL return true and false.

Use LIMIT 10 in order to keep a request to 10 items
Use OFFSET 5 to start on the sixth item
