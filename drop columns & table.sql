#initially had a branch name column but removed since information is in branches table
ALTER TABLE lending.loans
	DROP COLUMN branch_name;
    
DROP TABLE lending.loans;
DROP TABLE lending.branches;
DROP TABLE lending.loan_officers;
DROP TABLE lending.loan_processors;
DROP TABLE lending.underwriters;