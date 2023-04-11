CREATE TABLE items (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(250) NOT NULL,
  description VARCHAR(500),
  rating INT,
  price double,
  created_at timestamp 
);

create table users (
  id BIGSERIAL [primary key]
  username VARCHAR
  email VARCHAR UNIQUE
  cart_id BIGSERIAL UNIQUE
  created_at timestamp
);

CREATE TABLE cart (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  user_id integer,
  item_id BIGSERIAL,
  created_at timestamp
);

