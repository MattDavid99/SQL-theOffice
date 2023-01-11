-- Your code here

-- Creating tables
CREATE TABLE customers (
    purchase_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(150),
    phone_number NUMERIC(10) UNIQUE,
    email VARCHAR(100) UNIQUE,
    points INTEGER DEFAULT 5,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE coffee_orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    is_redeemed BOOLEAN DEFAULT 0,
    ordered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
