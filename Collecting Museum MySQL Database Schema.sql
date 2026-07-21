CREATE DATABASE CollectingMuseum;

USE CollectingMuseum;


/* entity tables */

CREATE TABLE payment (
  id int auto_increment NOT NULL PRIMARY KEY,
  constituent_id int NOT NULL,
  individual_id int,
  paymentdate date NOT NULL,
  total decimal NOT NULL,
  deductible decimal,
  fmv decimal,
  recurring boolean NOT NULL,
  channel varchar(30),
  paymentmethod varchar(30) NOT NULL,
  cclast4 varchar(4),
  ccexp date,
  checkrefno varchar(30),
  checkrefdate date,
  refnotes text,
  donorcomments text
);

CREATE TABLE artwork (
  id varchar(30) NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  creator varchar(255) NOT NULL,
  createddate varchar(30),
  acquired date NOT NULL,
  opportunity_id int,
  format varchar(255),
  dimensions varchar(100),
  workdescription varchar(1000),
  taxestimate decimal,
  taxestimatedate date
);

CREATE TABLE donation (
  id int auto_increment NOT NULL PRIMARY KEY,
  amount decimal NOT NULL,
  creditdate date NOT NULL,
  credit_id int NOT NULL,
  opportunity_id int,
  pledge_id int,
  appeal_id int,
  tribute_id int
);

CREATE TABLE memtransaction (
  id int auto_increment NOT NULL PRIMARY KEY,
  newexpiration date NOT NULL,
  mshipaction ENUM('join','rejoin','renew','upgrade','downgrade') NOT NULL,
  membership_id int NOT NULL,
  level_id int NOT NULL,
  isgift boolean NOT NULL,
  amount decimal NOT NULL
);

CREATE TABLE ticket (
  id int auto_increment NOT NULL PRIMARY KEY,
  registrant_id int NOT NULL,
  event_id int NOT NULL,
  ticketoption_id int NOT NULL,
  status ENUM('invited','registered','cancelled','declined') NOT NULL,
  attended boolean
);

CREATE TABLE rental (
  id int NOT NULL PRIMARY KEY,
  rentaltype varchar(50) NOT NULL,
  rentalstart datetime,
  rentalend datetime,
  facility varchar(50),
  price decimal NOT NULL,
  attendees int,
  rentalnotes text
);

CREATE TABLE constituent (
  id int auto_increment NOT NULL PRIMARY KEY,
  constituentname varchar(255) NOT NULL,
  constituenttype ENUM('Household','Organization') NOT NULL,
  streetaddr varchar(50),
  aptsuite varchar(50),
  city varchar(50),
  stateprov varchar(10),
  postal varchar(20),
  country varchar(30),
  donotmail boolean,
  constnotes text,
  inactive boolean NOT NULL,
  defunct boolean NOT NULL
);

CREATE TABLE individual (
  id int auto_increment NOT NULL PRIMARY KEY,
  firstname varchar(50),
  middlename varchar(50),
  lastname varchar(50) NOT NULL,
  primaryphone varchar(25),
  secondaryphone varchar(25),
  donotcall boolean,
  primaryemail varchar(100),
  secondaryemail varchar(100),
  donotemail boolean,
  birthday date,
  maritalstatus ENUM('Single','Partnered','Married','Divorced','Widowed','Unknown'),
  indivnotes text,
  inactive boolean NOT NULL,
  deceased boolean NOT NULL
);

CREATE TABLE tag (
  id int auto_increment NOT NULL PRIMARY KEY,
  tagname varchar(30) NOT NULL,
  active boolean NOT NULL,
  tagdescription text,
  constituents boolean NOT NULL,
  individuals boolean NOT NULL
);

CREATE TABLE mshiplevel (
  id int auto_increment NOT NULL PRIMARY KEY,
  levelname varchar(50) NOT NULL,
  price decimal NOT NULL,
  term ENUM('Monthly','Annual') NOT NULL,
  leveldescription text
);

CREATE TABLE membership (
  id int auto_increment NOT NULL PRIMARY KEY,
  constituent_id int NOT NULL,
  level_id int NOT NULL,
  joined date NOT NULL,
  expiration date NOT NULL
);

CREATE TABLE benefit (
  id int auto_increment NOT NULL PRIMARY KEY,
  benefit varchar(50) NOT NULL,
  benefitdescription text,
  fmv decimal NOT NULL
);

CREATE TABLE memdiscount (
  discountcode varchar(25) NOT NULL PRIMARY KEY,
  discount decimal NOT NULL,
  pctoramt ENUM('Percent off','Amount off') NOT NULL,
  startdate date,
  enddate date,
  uselimit int
);

CREATE TABLE interaction (
  id int auto_increment NOT NULL PRIMARY KEY,
  appeal_id int,
  recipient_id int NOT NULL,
  staff_id int NOT NULL,
  plan_id int,
  status ENUM('Planned','In Progress','Completed','Cancelled') NOT NULL,
  planneddate date,
  actualdate date NOT NULL,
  interactionmethod varchar(20) NOT NULL,
  notes text
);

CREATE TABLE appeal (
  id int auto_increment NOT NULL PRIMARY KEY,
  appealname varchar(100) NOT NULL,
  appealdescription text,
  startdate date,
  enddate date
);

CREATE TABLE plan (
  id int auto_increment NOT NULL PRIMARY KEY,
  prospect_id int NOT NULL,
  planname varchar(100) NOT NULL,
  plantype ENUM('Major donor','High-level member','Estate donor','Exhibition sponsor','Program sponsor','Endowment','Other') NOT NULL,
  startdate date,
  enddate date,
  narrative text,
  planmanager_id int NOT NULL,
  participant_id int
);

CREATE TABLE opportunity (
  id int auto_increment NOT NULL PRIMARY KEY,
  plan_id int NOT NULL,
  opportunityname varchar(100) NOT NULL,
  askdate date,
  responsedate date,
  status varchar(20) NOT NULL,
  askamount decimal,
  approvedamount decimal,
  summary text
);

CREATE TABLE pledge (
  id int auto_increment NOT NULL PRIMARY KEY,
  constituent_id int NOT NULL,
  pledgedate date NOT NULL,
  total decimal NOT NULL,
  status ENUM('Pledged','Partially paid','Complete') NOT NULL,
  balance decimal,
  duedate date,
  opportunity_id int,
  appeal_id int,
  pledgenotes text
);

CREATE TABLE designation (
  id int auto_increment NOT NULL PRIMARY KEY,
  hierarchyname varchar(255) NOT NULL,
  publicname varchar(50) NOT NULL,
  designationdescription text,
  active boolean NOT NULL
);

CREATE TABLE arc (
  id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  arcname varchar(255) NOT NULL,
  arcdescription text,
  startdate date,
  enddate date,
  arctype varchar(50)
);

CREATE TABLE event (
  id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  arc_id int,
  eventname varchar(100) NOT NULL,
  description text,
  eventstart datetime NOT NULL,
  eventend datetime NOT NULL,
  location varchar(100),
  capacity int NOT NULL,
  staffcontact_id int,
  appeal_id int
);

CREATE TABLE ticketoption (
  id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  tickettype varchar(255) NOT NULL,
  price decimal NOT NULL,
  fmv decimal NOT NULL
);

CREATE TABLE ticketdiscount (
  discountcode varchar(25) NOT NULL PRIMARY KEY,
  discount decimal NOT NULL,
  pctoramt ENUM('Percent off','Amount off') NOT NULL,
  startdate date,
  enddate date,
  uselimit int
);

CREATE TABLE response (
  id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  interaction_id int NOT NULL,
  emailopened boolean,
  emailclicked boolean,
  emailunsubscribed boolean,
  emailbounced boolean,
  mailunsubscribed boolean,
  mailbadaddress boolean,
  phonehangup boolean,
  phonenoresponse boolean,
  phonebadnumber boolean
);

CREATE TABLE tribute (
  id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  tributee varchar(255) NOT NULL,
  tributetype ENUM('In memory of','In honor of','In recognition of') NOT NULL
);

CREATE TABLE purchase (
  id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  payment_id int NOT NULL,
  total decimal NOT NULL,
  discountcode varchar(25)
);

CREATE TABLE item (
  barcode int NOT NULL PRIMARY KEY,
  itemname varchar(255) NOT NULL,
  itemprice decimal NOT NULL
);

CREATE TABLE purchasediscount (
  discountcode varchar(25) NOT NULL PRIMARY KEY,
  discount decimal NOT NULL,
  pctoramt ENUM('Percent off','Amount off') NOT NULL,
  startdate date,
  enddate date,
  uselimit int
);


/* relationship tables */

CREATE TABLE payment_artwork (
  payment_id int,
  work_id varchar(30)
);

CREATE TABLE payment_donation (
  payment_id int,
  donation_id int
);

CREATE TABLE payment_membership (
  payment_id int,
  memtransaction_id int
);

CREATE TABLE payment_ticket (
  payment_id int,
  ticket_id int,
  discountcode varchar(25)
);

CREATE TABLE payment_rental (
  payment_id int,
  rental_id int
);

CREATE TABLE constituent_individual (
  constituent_id int,
  individual_id int,
  relationtoprimary varchar(255)
);

CREATE TABLE individual_tag (
  tag_id int,
  individual_id int,
  startdate date,
  enddate date,
  comments varchar(255)
);

CREATE TABLE constituent_tag (
  tag_id int,
  constituent_id int,
  startdate date,
  enddate date,
  comments varchar(255)
);

CREATE TABLE level_benefit (
  level_id int,
  benefit_id int
);

CREATE TABLE transaction_discount (
  transaction_id int,
  discountcode varchar(25)
);

CREATE TABLE donation_designation (
  donation_id int,
  designation_id int,
  amount decimal
);

CREATE TABLE pledge_designation (
  pledge_id int,
  designation_id int,
  amount decimal
);

CREATE TABLE event_option (
  event_id int,
  option_id int
);

CREATE TABLE purchase_item (
  purchase_id int,
  item_barcode int,
  quantity int
);


/* foreign keys */

ALTER TABLE payment_artwork ADD FOREIGN KEY (payment_id) REFERENCES payment (id);

ALTER TABLE payment_artwork ADD FOREIGN KEY (work_id) REFERENCES artwork (id);

ALTER TABLE payment_donation ADD FOREIGN KEY (payment_id) REFERENCES payment (id);

ALTER TABLE payment_donation ADD FOREIGN KEY (donation_id) REFERENCES donation (id);

ALTER TABLE donation ADD FOREIGN KEY (credit_id) REFERENCES constituent (id);

ALTER TABLE payment_membership ADD FOREIGN KEY (payment_id) REFERENCES payment (id);

ALTER TABLE payment_membership ADD FOREIGN KEY (memtransaction_id) REFERENCES memtransaction (id);

ALTER TABLE memtransaction ADD FOREIGN KEY (level_id) REFERENCES mshiplevel (id);

ALTER TABLE payment_ticket ADD FOREIGN KEY (payment_id) REFERENCES payment (id);

ALTER TABLE payment_ticket ADD FOREIGN KEY (ticket_id) REFERENCES ticket (id);

ALTER TABLE ticket ADD FOREIGN KEY (event_id) REFERENCES event (id);

ALTER TABLE payment_rental ADD FOREIGN KEY (payment_id) REFERENCES payment (id);

ALTER TABLE payment_rental ADD FOREIGN KEY (rental_id) REFERENCES rental (id);

ALTER TABLE payment ADD FOREIGN KEY (individual_id) REFERENCES individual (id);

ALTER TABLE payment ADD FOREIGN KEY (constituent_id) REFERENCES constituent (id);

ALTER TABLE constituent_individual ADD FOREIGN KEY (constituent_id) REFERENCES constituent (id);

ALTER TABLE constituent_individual ADD FOREIGN KEY (individual_id) REFERENCES individual (id);

ALTER TABLE individual_tag ADD FOREIGN KEY (individual_id) REFERENCES individual (id);

ALTER TABLE individual_tag ADD FOREIGN KEY (tag_id) REFERENCES tag (id);

ALTER TABLE constituent_tag ADD FOREIGN KEY (constituent_id) REFERENCES constituent (id);

ALTER TABLE constituent_tag ADD FOREIGN KEY (tag_id) REFERENCES tag (id);

ALTER TABLE ticket ADD FOREIGN KEY (registrant_id) REFERENCES individual (id);

ALTER TABLE memtransaction ADD FOREIGN KEY (membership_id) REFERENCES membership (id);

ALTER TABLE membership ADD FOREIGN KEY (constituent_id) REFERENCES constituent (id);

ALTER TABLE membership ADD FOREIGN KEY (level_id) REFERENCES mshiplevel (id);

ALTER TABLE level_benefit ADD FOREIGN KEY (level_id) REFERENCES mshiplevel (id);

ALTER TABLE level_benefit ADD FOREIGN KEY (benefit_id) REFERENCES benefit (id);

ALTER TABLE transaction_discount ADD FOREIGN KEY (transaction_id) REFERENCES memtransaction (id);

ALTER TABLE transaction_discount ADD FOREIGN KEY (discountcode) REFERENCES memdiscount (discountcode);

ALTER TABLE interaction ADD FOREIGN KEY (appeal_id) REFERENCES appeal (id);

ALTER TABLE interaction ADD FOREIGN KEY (recipient_id) REFERENCES individual (id);

ALTER TABLE interaction ADD FOREIGN KEY (staff_id) REFERENCES individual (id);

ALTER TABLE interaction ADD FOREIGN KEY (plan_id) REFERENCES plan (id);

ALTER TABLE donation ADD FOREIGN KEY (appeal_id) REFERENCES appeal (id);

ALTER TABLE plan ADD FOREIGN KEY (prospect_id) REFERENCES constituent (id);

ALTER TABLE plan ADD FOREIGN KEY (planmanager_id) REFERENCES individual (id);

ALTER TABLE plan ADD FOREIGN KEY (participant_id) REFERENCES individual (id);

ALTER TABLE opportunity ADD FOREIGN KEY (plan_id) REFERENCES plan (id);

ALTER TABLE donation ADD FOREIGN KEY (opportunity_id) REFERENCES opportunity (id);

ALTER TABLE artwork ADD FOREIGN KEY (opportunity_id) REFERENCES opportunity (id);

ALTER TABLE donation ADD FOREIGN KEY (pledge_id) REFERENCES pledge (id);

ALTER TABLE pledge ADD FOREIGN KEY (constituent_id) REFERENCES constituent (id);

ALTER TABLE pledge ADD FOREIGN KEY (opportunity_id) REFERENCES opportunity (id);

ALTER TABLE pledge ADD FOREIGN KEY (appeal_id) REFERENCES appeal (id);

ALTER TABLE pledge_designation ADD FOREIGN KEY (pledge_id) REFERENCES pledge (id);

ALTER TABLE pledge_designation ADD FOREIGN KEY (designation_id) REFERENCES designation (id);

ALTER TABLE donation_designation ADD FOREIGN KEY (donation_id) REFERENCES donation (id);

ALTER TABLE donation_designation ADD FOREIGN KEY (designation_id) REFERENCES designation (id);

ALTER TABLE event ADD FOREIGN KEY (appeal_id) REFERENCES appeal (id);

ALTER TABLE event ADD FOREIGN KEY (arc_id) REFERENCES arc (id);

ALTER TABLE event ADD FOREIGN KEY (staffcontact_id) REFERENCES individual (id);

ALTER TABLE event_option ADD FOREIGN KEY (event_id) REFERENCES event (id);

ALTER TABLE event_option ADD FOREIGN KEY (option_id) REFERENCES ticketoption (id);

ALTER TABLE ticket ADD FOREIGN KEY (ticketoption_id) REFERENCES ticketoption (id);

ALTER TABLE payment_ticket ADD FOREIGN KEY (discountcode) REFERENCES ticketdiscount (discountcode);

ALTER TABLE response ADD FOREIGN KEY (interaction_id) REFERENCES interaction (id);

ALTER TABLE donation ADD FOREIGN KEY (tribute_id) REFERENCES tribute (id);

ALTER TABLE purchase ADD FOREIGN KEY (payment_id) REFERENCES payment (id);

ALTER TABLE purchase ADD FOREIGN KEY (discountcode) REFERENCES purchasediscount (discountcode);

ALTER TABLE purchase_item ADD FOREIGN KEY (purchase_id) REFERENCES purchase (id);

ALTER TABLE purchase_item ADD FOREIGN KEY (item_barcode) REFERENCES item (barcode);


/* set primary key auto-increments */

ALTER TABLE constituent AUTO_INCREMENT = 1000000000;

ALTER TABLE individual AUTO_INCREMENT = 2000000000;

ALTER TABLE payment AUTO_INCREMENT = 1;

ALTER TABLE donation AUTO_INCREMENT = 4000000;

ALTER TABLE membership AUTO_INCREMENT = 5000000;

ALTER TABLE memtransaction AUTO_INCREMENT = 5100000;

ALTER TABLE ticket AUTO_INCREMENT = 6000000000;

ALTER TABLE rental AUTO_INCREMENT = 70000;

ALTER TABLE tag AUTO_INCREMENT = 1000;

ALTER TABLE appeal AUTO_INCREMENT = 8000000;

ALTER TABLE interaction AUTO_INCREMENT = 8100000000;

ALTER TABLE mshiplevel AUTO_INCREMENT = 5000;

ALTER TABLE benefit AUTO_INCREMENT = 7000;

ALTER TABLE plan AUTO_INCREMENT = 4100000000;

ALTER TABLE opportunity AUTO_INCREMENT = 4200000000;

ALTER TABLE pledge AUTO_INCREMENT = 4300000000;

ALTER TABLE designation AUTO_INCREMENT = 44000;

ALTER TABLE arc AUTO_INCREMENT = 900000;

ALTER TABLE event AUTO_INCREMENT = 91000000000;

ALTER TABLE ticketoption AUTO_INCREMENT = 9200000;

ALTER TABLE response AUTO_INCREMENT = 8200000000;

ALTER TABLE tribute AUTO_INCREMENT = 400000;

ALTER TABLE purchase AUTO_INCREMENT = 7000000000;