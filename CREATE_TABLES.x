#include <stdio.h>

EXEC SQL INCLUDE sqlca;

EXEC SQL WHENEVER SQLERROR sqlprint;

int main()
{
EXEC SQL BEGIN DECLARE SECTION;
     char      *username= "psql cs687 pg0018";
     char      *password= "f16687";
EXEC SQL END DECLARE SECTION;

     EXEC SQL CONNECT TO unix:postgresql://localhost /cs687 USER pg0018 USING "f16687"; 
     if (sqlca.sqlcode < 0) exit(-1);
     printf("CONNECTED\n");
     
	 printf("Creating Employee Table\n");

EXEC SQL CREATE SCHEMA ADAMBYREGOWDA;

EXEC SQL CREATE TABLE ADAMBYREGOWDA.EMPLOYEE (
Fname		VARCHAR(15)     NOT NULL,
Minit		CHAR,
Lname		VARCHAR(15)     NOT NULL,
Ssn			CHAR(9)         NOT NULL,
Bdate		DATE,
Address		VARCHAR(30),
Sex			CHAR,
Salary		DECIMAL(10,2),
Super_ssn	CHAR(9),
Dno         INT             NOT NULL  DEFAULT 1,
PRIMARY KEY (Ssn)
);

EXEC SQL CREATE TABLE ADAMBYREGOWDA.DEPARTMENT
( 
	Dname				VARCHAR(15)  NOT NULL,
	Dnumber				INT NOT NULL,
	Mgr_ssn 			CHAR(9)  	 NOT NULL,
	Mgr_start_date      DATE,
	PRIMARY KEY (Dnumber),
	UNIQUE (Dname),
	FOREIGN KEY (Mgr_ssn) REFERENCES ADAMBYREGOWDA.EMPLOYEE(Ssn) 
);
EXEC SQL CREATE TABLE ADAMBYREGOWDA.DEPT_LOCATIONS
( 	
	Dnumber	    INT			NOT NULL,
	Dlocation	VARCHAR(15) NOT NULL,
	PRIMARY KEY (Dnumber, Dlocation),
	FOREIGN KEY (Dnumber) REFERENCES ADAMBYREGOWDA.DEPARTMENT(Dnumber)
);

EXEC SQL CREATE TABLE ADAMBYREGOWDA.PROJECT
( 	
	Pname		VARCHAR(15)	NOT NULL,
	Pnumber	 	INT			NOT NULL,
	Plocation	VARCHAR(15),
	Dnum		INT			NOT NULL,
	PRIMARY KEY (Pnumber),
	UNIQUE (Pname),
	FOREIGN KEY (Dnum) REFERENCES ADAMBYREGOWDA.DEPARTMENT(Dnumber)
);

EXEC SQL CREATE TABLE ADAMBYREGOWDA.WORKS_ON
( 	
	Essn	 CHAR(9)		NOT NULL,
	Pno	 	 INT			NOT NULL,
	Hours	 DECIMAL(3,1)	NOT NULL,
	PRIMARY KEY (Essn, Pno),
	FOREIGN KEY (Essn) REFERENCES ADAMBYREGOWDA.EMPLOYEE(Ssn),
	FOREIGN KEY (Pno) REFERENCES ADAMBYREGOWDA.PROJECT(Pnumber) 
);
  
EXEC SQL CREATE TABLE ADAMBYREGOWDA.DEPENDENT
( 	
	Essn				CHAR(9)	NOT NULL,
	Dependent_name		VARCHAR(15) NOT NULL,
	Sex					CHAR,
	Bdate				DATE,
	Relationship		VARCHAR(8),
	PRIMARY KEY (Essn, Dependent_name),
	FOREIGN KEY (Essn) REFERENCES ADAMBYREGOWDA.EMPLOYEE(Ssn) 
);


if(sqlca.sqlcode>=0)
printf("Successful\n");
else 
printf("Not Successful\n");

EXEC SQL COMMIT;

EXEC SQL DISCONNECT;

return 0;

}