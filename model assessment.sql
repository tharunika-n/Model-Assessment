CREATE DATABASE elearning_platform;

USE elearning_platform;

CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);


CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT NOT NULL,
    course_id INT NOT NULL,
    quantity INT NOT NULL,
    purchase_date DATE NOT NULL,

    FOREIGN KEY (learner_id)
        REFERENCES learners(learner_id),

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id),

    CHECK (quantity > 0)
);


SHOW TABLES;


USE elearning_platform;

INSERT INTO learners (learner_id, full_name, country)
VALUES
(1, 'Arun Kumar', 'India'),
(2, 'Priya Sharma', 'India'),
(3, 'John Smith', 'USA'),
(4, 'Maria Garcia', 'Spain'),
(5, 'Chen Wei', 'Singapore');


INSERT INTO courses (course_id, course_name, category, unit_price)
VALUES
(101, 'Python Programming', 'Programming', 499.00),
(102, 'Data Analytics', 'Data Analytics', 599.00),
(103, 'Machine Learning', 'AI and ML', 799.00),
(104, 'Web Development', 'Programming', 449.00),
(105, 'Cloud Computing', 'Cloud Computing', 699.00);


SELECT * FROM learners;

SELECT * FROM courses;

SELECT * FROM purchases;


SELECT
    l.learner_id,
    l.full_name AS learner_name,
    l.country,
    c.course_name,
    c.category,
    p.quantity,
    c.unit_price,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id
ORDER BY p.purchase_date;


SELECT
    l.learner_id,
    l.full_name AS learner_name,
    l.country,
    c.course_name,
    c.category,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM learners AS l
LEFT JOIN purchases AS p
    ON l.learner_id = p.learner_id
LEFT JOIN courses AS c
    ON p.course_id = c.course_id
ORDER BY l.learner_id, p.purchase_date;


SELECT
    c.course_id,
    c.course_name,
    c.category,
    l.full_name AS learner_name,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM purchases AS p
RIGHT JOIN courses AS c
    ON p.course_id = c.course_id
LEFT JOIN learners AS l
    ON p.learner_id = l.learner_id
ORDER BY c.course_id, p.purchase_date;


SELECT
    l.learner_id,
    l.full_name AS learner_name,
    l.country,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id
GROUP BY
    l.learner_id,
    l.full_name,
    l.country
ORDER BY SUM(p.quantity * c.unit_price) DESC;


SELECT
    c.course_id,
    c.course_name,
    SUM(p.quantity) AS total_quantity_sold
FROM courses AS c
INNER JOIN purchases AS p
    ON c.course_id = p.course_id
GROUP BY
    c.course_id,
    c.course_name
ORDER BY
    total_quantity_sold DESC,
    c.course_name ASC
LIMIT 3;


SELECT
    c.category,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM courses AS c
INNER JOIN purchases AS p
    ON c.course_id = p.course_id
GROUP BY c.category
ORDER BY SUM(p.quantity * c.unit_price) DESC;



SELECT
    l.learner_id,
    l.full_name AS learner_name,
    COUNT(DISTINCT c.category) AS categories_purchased
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id
GROUP BY
    l.learner_id,
    l.full_name
HAVING COUNT(DISTINCT c.category) > 1
ORDER BY categories_purchased DESC, learner_name ASC;


SELECT
    c.course_id,
    c.course_name,
    c.category,
    FORMAT(c.unit_price, 2) AS unit_price
FROM courses AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM purchases AS p
    WHERE p.course_id = c.course_id
);

