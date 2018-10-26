DROP TABLE books;
DROP TABLE publishers;

CREATE TABLE publishers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  country VARCHAR(255),
  website VARCHAR(255)
);

CREATE TABLE books(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  composer VARCHAR(255),
  description TEXT,
  stock_quantity INT4,
  buying_cost Numeric,
  selling_price Numeric,
  publisher_id INT4 REFERENCES publishers(id)
);
