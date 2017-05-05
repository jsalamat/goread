SELECT l.created, l.time_lapsed, b.title , DATE_FORMAT(l.created, '%m/%d/%Y') AS 'log_created' 
FROM logs l 
LEFT JOIN books b 
ON l.book_id = b.id 
WHERE user_id = ?

SELECT lo.created, lo.time_lapsed, b.title , DATE_FORMAT(lo.created, '%m/%d/%Y') AS 'gvygvyff fg tfg ' 
FROM logs lo 
LEFT JOIN books b 
ON lo.book_id = b.id;



JUst create a another table to link them together by foreign key look for the coupon app for example
have parent created and register for kids
Add clause and rules to read when using the go read app

SELECT ub.book_id, b.title, b.author, ub.current_page 
FROM user_books AS ub 
LEFT JOIN books AS b 
ON ub.book_id = b.id 
WHERE ub.user_id = 

SELECT u.id AS kids_id, u.username, u.email 
FROM users AS u 
RIGHT JOIN parent_students AS ps 
ON u.id = ps.student_id 
WHERE ps.parent_id = ?

SELECT ub.user_id, ub.book_id, b.title 
FROM user_books AS ub 
INNER JOIN BOOKS AS b O
N ub.book_id = b.id 
WHERE ub.user_id IN (2);