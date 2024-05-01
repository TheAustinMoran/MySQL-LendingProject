CREATE TABLE lending.LOANS(
	loan_number char(9) PRIMARY KEY NOT NULL,
    branch_id char(2),
	borrower_name varchar(40) NOT NULL,
	app_date date,
	close_date date,
    product varchar(40),
    purpose varchar(40),
    rate decimal(4,2),
    loan_amount decimal(8,2),
    property_address varchar(40),
    property_city varchar(40),
    property_state char(2),
    lo_id char(2),
    lp_id char(2),
    uw_id char(2)
);

CREATE TABLE lending.BRANCHES(
	branch_id char(2) PRIMARY KEY NOT NULL,
    branch_name varchar(40),
    branch_address varchar(75)
);
CREATE TABLE lending.LOAN_OFFICERS(
	lo_id char(2) PRIMARY KEY NOT NULL,
    officer_names varchar(40),
    branch_id char(2)
);
CREATE TABLE lending.LOAN_PROCESSORS(
	lp_id char(2) PRIMARY KEY NOT NULL,
    lp_names varchar(40)
);
CREATE TABLE lending.UNDERWRITERS(
	uw_id char(2) PRIMARY KEY NOT NULL,
    uw_names varchar(40)
);

INSERT INTO lending.BRANCHES
	(branch_id, branch_name, branch_address)
VALUES
	('01', 'Southern Parkway', '123 Southern Parkway Louisville, KY, 40214'),
    ('02', 'South Corbin', '123 S Corbin Way Corbin, KY, 40160'),
    ('03', 'Old Brownsboro Crossing', '3701 Von Allmen Court Louisville, KY, 40245'),
    ('04', 'Dixie', '6400 Dixie Highway Louisville, KY, 40258'),
    ('05', 'Somerset', '6500 Trucker Way Somerset, KY, 40055'),
    ('06', 'Mt. Washington', '123 Highway 42 Mt. Washington, KY, 40172'),
    ('07', 'Crestwood', '789 Prospect Highway Crestwood, KY, 40199'),
    ('08', 'Smyrna', '4044 Symrna Pkwy Louisville, KY, 40219'),
    ('09', 'Middletown Walmart', '4321 Shelbyvill Rd Louisville, KY 40299'),
    ('10', "Veteran's Parkway", "7800 Veteran's Parkway Jeffersonville, IN 47130"),
    ('11', 'Erlanger', '123 Erlanger Highway Erlanger, KY, 47165'),
    ('12', 'London South', '657 Clay Way London, KY, 47167'),
    ('13', 'New Albany', '456 NA Way New Albany, IN, 47150'),
    ('14', 'Ft. Wright Walmart', '123 KY Way Ft. Wright, KY, 40015'),
    ('15', 'Williamsburg Walmart', '123 Billy St Williamsburg, KY, 40097'),
    ('16', 'Hikes Point', '3536 Breckenridge Lane Louisville, KY, 40220'),
    ('17', 'London Downtown', '7834 Willow Way London, KY, 46520'),
    ('18', 'Downtown', '900 S 2nd St Louisville, KY, 40204'),
    ('19', 'Jeffersontown', '4500 Taylorsville Rd Louisville, KY, 40241');

INSERT INTO lending.loan_officers
	(lo_id, officer_names, branch_id)
VALUES
	('01', 'Ashley Belk', '06'),
    ('02', 'James Bell', '01'),
    ('03', 'Emily Goff', '14'),
    ('04', 'Kate Mckinnon', '04'),
    ('05', 'Shelia Meyers', '16'),
    ('06', 'William Montgomery', '06'),
    ('07', 'Jerry Parr', '17'),
    ('08', 'Chandler Parsons', '15'),
    ('09', 'Patrick Paterson', '08'),
    ('10', 'Nicole Payne', '09'),
    ('11', 'Olivia Peters', '13'),
    ('12', 'Amanda Piper', '13'),
    ('13', 'Jordan Poole', '03'),
    ('14', 'Chris Powell', '19'),
    ('15', 'Dan Quinn', '16'),
    ('16', 'Grant Rampling', '07'),
    ('17', 'Josh Randall', '11'),
    ('18', 'Nicholas Rees', '05'),
    ('19', 'Andy Reid', '08'),
    ('20', 'Andy Robertson', '18'),
    ('21', 'Barry Ross', '10'),
    ('22', 'William Rutherford', '08'),
    ('23', 'Carl Sanderson', '10'),
    ('24', 'Michael Scott', '05'),
    ('25', 'Tyler Sharp', '02'),
    ('26', 'Lucas Short', '06');

INSERT INTO lending.loan_processors
	(lp_id, lp_names)
VALUES
	('01', 'Lynard Skinner'),
    ('02', 'Matthew Slater'),
    ('03', 'Joe Smith'),
    ('04', 'Tom Springer'),
    ('05', 'Drake Stewart'),
    ('06', 'Christina Sutherland'),
    ('07', 'Jaylen Taylor'),
    ('08', 'Halle Terry'),
    ('09', 'Tommy Thomson'),
    ('10', 'Steve Tucker'),
    ('11', 'Alison Turner'),
    ('12', 'Brad Underwood');

INSERT INTO lending.underwriters
	(uw_id, uw_names)
VALUES
	('01', 'Aaron Vance'),
    ('02', 'Elizabeth Vaughan'),
    ('03', 'Deandre Walker'),
    ('04', 'Chris Wallace');
    
ALTER TABLE lending.loans ADD CONSTRAINT FK_loansbranch_id
    FOREIGN KEY (branch_id) REFERENCES branches (branch_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE lending.loans ADD CONSTRAINT FK_loanslo_id
	FOREIGN KEY (lo_id) REFERENCES loan_officers (lo_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE lending.loan_officers ADD CONSTRAINT FK_loan_officersbranch_id
	FOREIGN KEY (branch_id) REFERENCES branches (branch_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE lending.loans ADD CONSTRAINT FK_loanslp_id
	FOREIGN KEY (lp_id) REFERENCES loan_processors (lp_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE lending.loans ADD CONSTRAINT FK_loansuw_id
	FOREIGN KEY (uw_id) REFERENCES underwriters (uw_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;  
	
    