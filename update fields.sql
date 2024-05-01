# update property city fields

SELECT loan_number, property_city FROM lending.loans
WHERE property_city = 'Mount Washington';

UPDATE lending.loans SET property_city ='Mt. Washington'
WHERE loan_number = '500401190';
UPDATE lending.loans SET property_city = 'Mt. Washington'
WHERE loan_number = '500501373';

SELECT loan_number, property_city FROM lending.loans
WHERE property_city = 'Mt Washington';

UPDATE lending.loans SET property_city = 'Mt. Washington'
WHERE loan_number = '500300758'; 
UPDATE lending.loans SET property_city = 'Mt. Washington'
WHERE loan_number ='500300878';
UPDATE lending.loans SET property_city = 'Mt. Washington'
WHERE loan_number = '500401040';

#to try to replace above code
UPDATE lending.loans SET property_city = 'Mt. Washington'
WHERE loan_number IN ('500300758', '500300878', '500401040');

#dropping foreign keys to update branches, loan officer, processors, and underwriters table.
#could also change foreign key constraint to cascade ON UPDATE CASCADE and use long update statements to fix problem of '02' changin to '20'

ALTER TABLE lending.loan_officers DROP FOREIGN KEY FK_loan_officersbranch_id;
ALTER TABLE lending.loans DROP FOREIGN KEY FK_loanslo_id;
TRUNCATE TABLE lending.loan_officers;

ALTER TABLE lending.loans DROP FOREIGN KEY FK_loansbranch_id;
ALTER TABLE lending.loans DROP FOREIGN KEY FK_loanslp_id;
ALTER TABLE lending.loans DROP FOREIGN KEY FK_loanuw_id;
TRUNCATE TABLE lending.loan_processors;
TRUNCATE TABLE lending.branches;
TRUNCATE TABLE lending.underwriters;