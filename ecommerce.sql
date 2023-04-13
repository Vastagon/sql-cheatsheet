CREATE TABLE items (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(250) NOT NULL,
  description VARCHAR(500),
  rating INT,
  price double,
  created_at timestamp 
);

create table users (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(250) UNIQUE NOT NULL,
  cart_id BIGSERIAL UNIQUE NOT NULL,
  purchased_orders TEXT [], /* Once a cart gets purchased. Add that id to this array, so we can see order history. */
  created_at timestamp
);

CREATE TABLE cart ( /* When a purchase is complete, we assign a new cart to the user. We can store the old cart id's in the users table to be able to reference old orders. */
  id BIGSERIAL NOT NULL PRIMARY KEY,
  user_id BIGSERIAL UNIQUE NOT NULL REFERENCES users (id),
  discount integer,
  state_tax integer,
  local_tax integer,
  created_at timestamp,
  order_processed_at timestamp
);

CREATE TABLE cartItems {
  id BIGSERIAL NOT NULL PRIMARY KEY,
  cart_id BIGSERIAL NOT NULL REFERENCES cart (id),
  item_id BIGSERIAL NOT NULL REFERENCES items (item_id),
  quantity integer NOT NULL, /* Number of this item */
  final_total_purchase_cost DOUBLE /* Total cost of the item after tax and everything else. Can reference this for previous purchases if prices change, this amount stays the same. */
};


