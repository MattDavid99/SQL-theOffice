-- Your code here
-- 1
INSERT INTO customers(first_name, phone_number)
VALUES("Rachel", 1111111111);


-- -- 2
-- SELECT points FROM customers
WHERE first_name = "Rachel";
-- update points
UPDATE customers SET points = points + 1
WHERE first_name = "Rachel";
-- then add coffee order
INSERT INTO coffee_orders DEFAULT VALUES;


-- -- 3
-- -- insert 2 new customers
INSERT INTO customers(first_name, email, phone_number)
VALUES
("Monica", "monica@gmail", 2222222222),
("Phoebe", "phoebe@gmail.com", 3333333333);


-- -- 4
-- -- Phoebe purchases 3 coffees
UPDATE customers SET points = points + 4
WHERE first_name = "Phoebe";

INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;


-- --5
-- -- Monica and Rachel each purchase 4 coffees
UPDATE customers SET points = points + 4
WHERE first_name = "Monica";

INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;

UPDATE customers SET points = points + 4
WHERE first_name = "Rachel";

INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;


-- -- 6
-- -- Monica wants to know her point total
SELECT points FROM customers
WHERE first_name = "Monica";


-- -- 7
-- -- Rachel wants to check her total points. Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.
SELECT points FROM customers
WHERE first_name = "Rachel";

UPDATE customers SET points = points - 10
WHERE first_name = "Rachel";

INSERT INTO coffee_orders(is_redeemed)
VALUES(1);


-- -- 8
-- -- insert 3 new customers
INSERT INTO customers(first_name,email)
VALUES
("Joey", "joey@gmail.com"),
("Chandler", "chandler@gmail.com"),
("Ross", "ross@gmail.com");


-- -- 9
-- -- Ross purchases 6 coffees
UPDATE customers SET points = points + 6
WHERE first_name = "Ross";


-- -- 10
-- -- Monica purchases 3 coffees
UPDATE customers SET points = points + 3
WHERE first_name = "Monica";

INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;


-- -- 11
-- -- Phoebe wants to check her total points. Redeem her points if enough, if not purchase a coffee
SELECT points FROM customers
WHERE first_name = "Phoebe";

UPDATE customers SET points = points + 1
WHERE first_name = "Phoebe";

INSERT INTO coffee_orders(id, is_redeemed, ordered_at)
VALUES(null, 0, CURRENT_TIMESTAMP);


-- -- 12
-- -- Ross demands a refund for last 2 coffees
DELETE FROM coffee_orders
WHERE id = 19;

UPDATE customers
SET points = points - 1
WHERE first_name = 'Ross';

DELETE FROM coffee_orders
WHERE id = 18;

UPDATE customers
SET points = points - 1
WHERE first_name = 'Ross';


-- -- 13
-- -- Joey purchases 2 coffees
UPDATE customers SET points = points + 2
WHERE first_name = "Joey";

INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;


-- -- 14
-- -- Monica wants to check total points, redeem if enough, if not purchase
SELECT points FROM customers
WHERE first_name = "Monica";

UPDATE customers SET points = points - 10
WHERE first_name = 'Monica';

INSERT INTO coffee_orders (is_redeemed)
VALUES (1);


-- -- 15
-- -- Chandler wants to delete his loyalty account
DELETE FROM customers WHERE first_name = "Chandler";


-- -- 16.
-- -- Ross wants to check total points, redeem if enuf, if not purchase coffee
UPDATE customers SET points = points + 1
WHERE first_name = 'Ross';

INSERT INTO coffee_orders DEFAULT VALUES;


-- -- 17.
-- --  Joey wants to check total points, redeem if enuf, if not purchase coffee
UPDATE customers SET points = points + 1
WHERE first_name = 'Joey';

INSERT INTO coffee_orders DEFAULT VALUES;


-- -- 18.
-- -- Phoebe wants to change her email

UPDATE customers SET email = 'p_as_in_phoebe@friends.show'
WHERE first_name = 'Phoebe';
