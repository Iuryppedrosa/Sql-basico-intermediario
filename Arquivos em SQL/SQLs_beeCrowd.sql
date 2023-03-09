SELECT name, street FROM customers WHERE city = 'Porto Alegre';


SELECT id, name FROM products WHERE price < 10 OR price > 100;

SELECT products.name, providers.name FROM products 
JOIN providers ON products.id_providers = providers.id
WHERE products.id_categories = 6;

SELECT P.id, P.name FROM products P, categories C WHERE P.id_categories = C.id AND C.name LIKE 'super%';

SELECT city FROM providers GROUP BY city ORDER BY city ASC;

SELECT MAX(price), MIN(price) FROM products;


SELECT productCategory.name,
SUM (amount)
FROM 
	(SELECT products.amount, products.id_categories, 
	categories.name AS name FROM products
	INNER JOIN categories 
	ON products.id_categories = categories.id) 
	AS productCategory
GROUP BY name;



