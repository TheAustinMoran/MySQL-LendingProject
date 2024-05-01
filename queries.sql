# select all from table
SELECT * FROM lending.loans;

# select specific columns from a table
SELECT product, purpose, loan_amount FROM lending.loans;

SELECT lo_id, branch_id FROM lending.loans;

# where clause

#where clause to find loans over $250k
SELECT borrower_name, property_address, property_city, property_state, loan_amount
FROM lending.loans WHERE loan_amount > 250000.00;

#where clause to find purchase loans
SELECT product, loan_amount, property_address, property_city, property_state
FROM lending.loans WHERE purpose = 'Purchase';

#where clause to find loans in cities other than Louisville
SELECT purpose, loan_amount, property_city FROM lending.loans
WHERE property_city <> 'Louisville';

# where & AND clause to find loans closed in May, 2021
SELECT * FROM lending.loans
WHERE close_date BETWEEN '2021-05-01' AND '2021-05-31';

#loans closed in june 21
SELECT * FROM lending.loans
WHERE close_date BETWEEN '2021-06-01' AND '2021-06-30';

#loans closed in april 21
SELECT * FROM lending.loans
WHERE close_date BETWEEN '2021-04-01' AND '2021-04-30';

# or clause to find purchases and cash out refis
SELECT * FROM lending.loans
WHERE purpose = 'Purchase' OR purpose='Cash-Out Refi';

# IN clause to find purchase and cash out refis
SELECT * FROM lending.loans
WHERE purpose IN ('Purchase', 'Cash-Out Refi');

# wildcard character % and LIKE clause to find adjustable loans
SELECT * FROM lending.loans
WHERE product LIKE '%ARM%';

# wildcard character % and LIKE clause to find fixed loans
SELECT * FROM lending.loans
WHERE product LIKE '%Fixed%';

#select all rows from branches table
SELECT * FROM lending.branches;

#find all walmart branches with like clause and % wildcard
SELECT * FROM lending.branches
WHERE branch_name LIKE '%Walmart%';

SELECT * FROM lending.loan_officers;

#find all loan officers whose names start with A
SELECT * FROM lending.loan_officers
WHERE officer_names LIKE 'A%';

#find all refi loans with LIKE clause and % wildcard
SELECT * FROM lending.loans
WHERE purpose LIKE '%refi%';

#range to find loans between 100k and 200k
SELECT * FROM lending.loans
WHERE loan_amount BETWEEN 100000 AND 200000;

#in clause with set of values to find loans in southern indiana
SELECT * FROM lending.loans
WHERE property_city IN ('Jeffersonville', 'New Albany', 'Clarksville', 'Sellersburg');

#count the number of rows in our loans table
SELECT COUNT(*) FROM lending.loans;

#count the number of loans for homes in Louisville
SELECT COUNT(*) FROM lending.loans
WHERE property_city ='Louisville';

#count the number of loans done by branch 03
SELECT COUNT(*) FROM lending.loans
WHERE branch_id = 03;

#find all distinct cities home loans were done
SELECT DISTINCT property_city FROM lending.loans;

#finding all the different types of loans we have
SELECT DISTINCT purpose FROM lending.loans;

#count the number of distinct cities in our loans table
SELECT COUNT(DISTINCT property_city) FROM lending.loans;

#return count of our branches
SELECT COUNT(DISTINCT branch_id) FROM lending.loans;

#count number of distinct rates of our loans
SELECT COUNT(DISTINCT rate) FROM lending.loans;

#find distinct branches that have done loans in Louisville
SELECT DISTINCT branch_id FROM lending.loans
WHERE property_city = 'Louisville';

#count number of distinct branches to do a loan in louisville
SELECT COUNT(DISTINCT branch_id) FROM lending.loans
WHERE property_city = 'Louisville';

#return first 10 rows of our loans table
SELECT * FROM lending.loans LIMIT 10;

#return first 10 rows of loans table where property city is Louisville
SELECT * FROM lending.loans
WHERE property_city = 'Louisville' LIMIT 10;

#return 10 rows after row 20 using offset and limit
SELECT * FROM lending.loans LIMIT 10 OFFSET 20;

#sorting
#sorting all loans by loan number 
SELECT * FROM lending.loans ORDER BY loan_number;

#sorting rates in descending order
SELECT * FROM lending.loans ORDER BY rate DESC;

#finding app dates and rates sorted by rate
SELECT app_date, rate FROM lending.loans ORDER BY rate;

#sorting branches that have done loans in louisville
SELECT * FROM lending.loans
WHERE property_city = 'Louisville'
ORDER BY branch_id;

#sorting by 10 best distinct loan rates
SELECT DISTINCT rate FROM lending.loans ORDER BY rate LIMIT 10;

#sorting to find 10 worst distinct loan rates
SELECT DISTINCT rate FROM lending.loans ORDER BY rate DESC LIMIT 10;

#finding app dates for our 10 worst rates
SELECT rate, app_date FROM lending.loans ORDER BY rate DESC LIMIT 10;

#finding all distinct cities done by each branch
SELECT DISTINCT branch_id, property_city FROM lending.loans ORDER BY branch_id;

#group by
#group by on our branch_id to show the number of cities each branch has done a loan in
SELECT branch_id, COUNT(property_city) FROM lending.loans GROUP BY branch_id;

#same query as above with use of as keyword
SELECT branch_id, COUNT(property_city) AS Num_Cities FROM lending.loans GROUP BY branch_id;

#furthering the above query to find branches that have done loans in more than one city
SELECT branch_id, COUNT(property_city) FROM lending.loans
GROUP BY branch_id HAVING COUNT(property_city) > 1;

#grouping rates to find the number of loans with each different rate
SELECT rate, COUNT(loan_number) FROM lending.loans
GROUP BY rate ORDER BY COUNT(loan_number) DESC;

#finding number of loans for a specific range of rates
SELECT rate, COUNT(loan_number) FROM lending.loans
GROUP BY rate HAVING rate BETWEEN 3.00 AND 4.00 ORDER BY rate;

#finding our top 5 most common rates
SELECT rate, COUNT(loan_number) FROM lending.loans
GROUP BY rate ORDER BY COUNT(loan_number) DESC LIMIT 5;

#finding the number of loans for each purpose
SELECT purpose, COUNT(loan_number) FROM lending.loans GROUP BY purpose;

#finding number of loans for each product type
SELECT product, COUNT(*) AS num_of_loans FROM lending.loans
GROUP BY product ORDER BY num_of_loans DESC;

#finding average rate of our loans
SELECT AVG(rate) FROM lending.loans;

#finding average loan amount
SELECT AVG(loan_amount) FROM lending.loans;

#min and max loan amounts
SELECT MIN(loan_amount) FROM lending.loans;

SELECT MAX(loan_amount) FROM lending.loans;

#sum
SELECT SUM(loan_amount) FROM lending.loans;

#average rate by product & rounding w round function
SELECT product, ROUND(AVG(rate), 2) AS avg_rate FROM lending.loans
GROUP BY product;

#average loan amount by city property is in as well as a count of the loans in those cities
SELECT property_city, COUNT(*) AS num_of_loans, ROUND(AVG(loan_amount), 2) AS avg_loan_amount FROM lending.loans
GROUP BY property_city ORDER BY num_of_loans DESC;

#find our highest producing branches by sum and showing count of all loans by each branch
SELECT branch_id, SUM(loan_amount) AS sum_of_loan_amount, COUNT(*) AS num_of_loans FROM lending.loans
GROUP BY branch_id ORDER BY sum_of_loan_amount DESC;

#highest producing branches by avg loan amount & rounding with round function & showing count of all loans by each branc
SELECT branch_id, ROUND(AVG(loan_amount), 2) AS avg_loan_amount, COUNT(*) AS num_of_loans FROM lending.loans
GROUP BY branch_id ORDER BY avg_loan_amount DESC;

#finding average loan amount by branch and count of all loans for each branch for loans only closed during May 2021
SELECT branch_id, ROUND(AVG(loan_amount), 2) AS avg_loan_amount, COUNT(*) AS num_of_loans FROM lending.loans
WHERE close_date BETWEEN '2021-05-01' AND '2021-05-31'
GROUP BY branch_id ORDER BY avg_loan_amount DESC;

#finding which branches had the most loans for May
SELECT branch_id, COUNT(*) AS num_of_loans FROM lending.loans
WHERE close_date BETWEEN '2021-05-01' AND '2021-05-31'
GROUP BY branch_id ORDER BY num_of_loans DESC;

#date functions
SELECT MONTH(close_date) FROM lending.loans;

SELECT YEAR(close_date) FROM lending.loans;

#finding average loan amount of loans closed in May 2021 for each branch using MONTH function 
SELECT branch_id, ROUND(AVG(loan_amount), 2) AS avg_loan_amount FROM lending.loans
WHERE MONTH(close_date) = '5'
GROUP BY branch_id ORDER BY avg_loan_amount DESC;

#counting loans closed by each branch in May 2021 using Month function
SELECT branch_id, COUNT(*) AS num_of_loans FROM lending.loans
WHERE MONTH(close_date) = '5'
GROUP BY branch_id ORDER BY num_of_loans DESC;

#finding the average number of days it takes each branch to close apps
SELECT branch_id, AVG(DATEDIFF(close_date, app_date)) AS avg_days_to_close FROM lending.loans
GROUP BY branch_id ORDER BY avg_days_to_close DESC;

#average number of days to close for entire credit union
SELECT AVG(DATEDIFF(close_date, app_date)) FROM lending.loans;

#finding specific branches that are over credit union wide avg_days_to_close
SELECT branch_id, AVG(DATEDIFF(close_date, app_date)) AS avg_days_to_close FROM lending.loans
GROUP BY branch_id HAVING avg_days_to_close > 34.3000
ORDER BY avg_days_to_close DESC;

#using sub-query to find all loans with higher loan amount than average
SELECT * FROM lending.loans WHERE loan_amount > (SELECT AVG(loan_amount) FROM lending.loans);

#using sub query to find loans with rates above total average rate
SELECT * FROM lending.loans WHERE rate > (SELECT AVG(rate) FROM lending.loans);

#using sub-query to find specific loans that went over average days to close
SELECT * FROM lending.loans WHERE DATEDIFF(close_date, app_date) > (SELECT AVG(DATEDIFF(close_date, app_date)) FROM lending.loans)
ORDER BY branch_id;

#expanding on above query to find non-purchase loans that went over avg days to close
SELECT * FROM lending.loans WHERE purpose <> 'Purchase' AND 
DATEDIFF(close_date, app_date) > (SELECT AVG(DATEDIFF(close_date, app_date)) FROM lending.loans)
ORDER BY branch_id;

#column expression to compare all loan amounts to avg loan amount
SELECT loan_number, branch_id, loan_amount, (SELECT ROUND(AVG(loan_amount), 2) FROM lending.loans) AS total_avg FROM lending.loans; 

#column expression to compare rates for all loans with avg rate
SELECT loan_number, product, rate, (SELECT ROUND(AVG(rate), 2) FROM lending.loans) AS overall_avg_rate FROM lending.loans;

#using column expression to view all loans number of days to close compared to avg number of days to close
SELECT loan_number, DATEDIFF(close_date, app_date) AS days_to_close,
(SELECT ROUND(AVG(DATEDIFF(close_date, app_date)), 0) FROM lending.loans) AS total_avg_days_to_close
FROM lending.loans;

#using column expression & sub-query to find loans that took 10 days over average to close
SELECT loan_number, branch_id, lo_id, DATEDIFF(close_date, app_date) AS days_to_close, 
(SELECT ROUND(AVG(DATEDIFF(close_date, app_date)), 0) FROM lending.loans) AS avg_days_to_close
FROM lending.loans WHERE DATEDIFF(close_date, app_date) - 10 > (SELECT ROUND(AVG(DATEDIFF(close_date, app_date)), 0) FROM lending.loans)
ORDER BY branch_id;

#table expression to find average of our top 10 loan amounts
SELECT AVG(loan_amount) FROM (SELECT loan_amount FROM lending.loans ORDER BY loan_amount DESC LIMIT 10) AS top_ten_loan_avg;

#table expression to find average of bottom ten loans
SELECT AVG(loan_amount) FROM (SELECT loan_amount FROM lending.loans ORDER BY loan_amount LIMIT 10) AS low_ten_loan_avg;

#using table expression to find average number of days to close for only our 85 fastest loans
SELECT AVG(num_days_to_close) FROM (SELECT DATEDIFF(close_date, app_date) AS num_days_to_close FROM lending.loans
ORDER BY num_days_to_close LIMIT 85) AS fastest_85_loans;

#working with multiple tables
#finding loan officers who closed a loan in May, using sub query to join tables
SELECT * FROM lending.loan_officers WHERE lo_id IN (SELECT lo_id FROM lending.loans WHERE MONTH(close_date) = '5');

#finding loan officers who did not have a loan in May, using sub query to join tables
SELECT * FROM lending.loan_officers WHERE lo_id NOT IN (SELECT lo_id FROM lending.loans WHERE MONTH(close_date) = '5');

#finding lo_id of our top 5 loan amount producers
SELECT lo_id, SUM(loan_amount) AS top_loan_amount FROM lending.loans GROUP BY lo_id ORDER BY top_loan_amount DESC LIMIT 5;

#expanding further on above query, using table expression and sub query to join tables, to find names of our top 5 loan officers
SELECT * FROM lending.loan_officers WHERE lo_id IN (SELECT lo_id FROM 
(SELECT lo_id, SUM(loan_amount) AS top_loan_amount FROM lending.loans GROUP BY lo_id ORDER BY top_loan_amount DESC LIMIT 5) AS top_5_lo);

#finding total loan amounts of all branches
SELECT branch_id, SUM(loan_amount) AS branch_loan_amounts FROM lending.loans GROUP BY branch_id ORDER BY branch_loan_amounts DESC;

#finding the specific branches who are the top 5 branches by loan amount using table expression and sub query to join tables
SELECT * FROM lending.branches WHERE branch_id IN (SELECT branch_id FROM 
(SELECT branch_id, SUM(loan_amount) AS branch_loan_amounts FROM lending.loans
GROUP BY branch_id ORDER BY branch_loan_amounts DESC LIMIT 5) AS top_5_branches);

#implicit joins
SELECT * FROM branches, loan_officers;

SELECT * FROM branches, loan_officers WHERE branches.branch_id = loan_officers.branch_id;

SELECT * FROM branches B, loan_officers LO WHERE B.branch_id = LO.branch_id;

SELECT B.branch_id, B.branch_name, LO.branch_id, LO.officer_names, LO.lo_id FROM branches B, loan_officers LO
WHERE B.branch_id = LO.branch_id;