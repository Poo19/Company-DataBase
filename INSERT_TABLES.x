#include <stdio.h>
EXEC SQL INCLUDE sqlca;
EXEC SQL WHENEVER SQLERROR sqlprint;
int main()
{
EXEC SQL BEGIN DECLARE SECTION;
     char      *username= "";
     char      *password= "";
EXEC SQL END DECLARE SECTION;
     EXEC SQL CONNECT TO unix:postgresql://localhost /cs687 USER username USING password; 
     if (sqlca.sqlcode < 0) exit(-1);
     printf("CONNECTED\n");
     
  printf("Creating Employee Table\n");
//EXEC SQL CREATE SCHEMA ADAMBYREGOWDA;
EXEC SQL insert into adambryegowda.EMPLOYEE values('John','B','Smith','123456789','1965-01-09','731 Fondren, Houston, TX','M',30000,'333445555',5);
 EXEC SQL insert into adambryegowda.EMPLOYEE values('Franklin','T','Wong','333445555','1955-12-08', '638 Voss,Houston,TX','M',40000,'888665555',5);
 EXEC SQL insert into adambryegowda.EMPLOYEE values('Alicia','J','Zelaya','999887777','1968-01-19','3321 Castle,Spring,TX','F',25000,'987654321',4);
  EXEC SQL insert into adambryegowda.EMPLOYEE values('Jennifer','S','Wallace','987654321','1941-06-20','291 Berry,Bellaire,TX','F',43000,'888665555',4);
   EXEC SQL insert into adambryegowda.EMPLOYEE values('Ramesh','K','Narayana','666884444','1962-09-15','975 Fire Oak,Humble,TX','M',38000,'333445555',5);
 EXEC SQL insert into adambryegowda.EMPLOYEE values('Joyce','A','English','453453453','1972-07-31','5631 Rice,Houston,TX','F',25000,'333445555',5);
EXEC SQL insert into adambryegowda.EMPLOYEE values('Ahmad','V','Jabbar','987987987','1969-03-29','980 Dallas,Houston,TX','M',25000,'987654321',4);
EXEC SQL insert into adambryegowda.EMPLOYEE values('James','E','Borg','888665555','1937-11-10','450 Stone,Houston,TX','M',55000,'NULL',1);
 EXEC SQL insert into adambryegowda.DEPARTMENT values('Research',5,'333445555','1988-05-22');
 
 EXEC SQL insert into adambryegowda.DEPARTMENT values('Administration',4,'987654321','1995-01-01');
EXEC SQL insert into adambryegowda.DEPARTMENT values('Headquarters',1,'888665555','1981-06-19');
EXEC SQL insert into adambryegowda.DEPT_LOCATIONS values(1,'Houston');
EXEC SQL insert into adambryegowda.DEPT_LOCATIONS values(4,'Stafford');
 EXEC SQL insert into adambryegowda.DEPT_LOCATIONS values(5,'Bellaire');
 
 EXEC SQL insert into adambryegowda.DEPT_LOCATIONS values(5,'Sugarland');
 
EXEC SQL insert into adambryegowda.DEPT_LOCATIONS values(5,'Houston');
 EXEC SQL insert into adambryegowda.PROJECT values('ProductX',1,'Bellaire',5);
 
EXEC SQL insert into adambryegowda.PROJECT values('Producty',2,'Sugarland',5);
EXEC SQL insert into adambryegowda.PROJECT values('ProductZ',3,'Houston',5);
 EXEC SQL insert into adambryegowda.PROJECT values('Computerization',10,'Stafford',4);
 
EXEC SQL insert into adambryegowda.PROJECT values('Reorganization',20,'Houston',1);
 EXEC SQL insert into adambryegowda.PROJECT values('Newbenefits',30,'Stafford',4);
 
EXEC SQL insert into adambryegowda.WORKS_ON values('123456789',1,'32.5');
 EXEC SQL insert into adambryegowda.WORKS_ON values('123456789',2,'7.5');
 
 EXEC SQL insert into adambryegowda.WORKS_ON values('666884444',3,'40');
 
 EXEC SQL insert into adambryegowda.WORKS_ON values('453453453',1,'20');
 
EXEC SQL insert into adambryegowda.WORKS_ON values('453453453',2,'20');
EXEC SQL insert into adambryegowda.WORKS_ON values('333445555',2,'10');
EXEC SQL insert into adambryegowda.WORKS_ON values('333445555',3,'10');
 EXEC SQL insert into adambryegowda.WORKS_ON values('333445555',10,'10');
 
 EXEC SQL insert into adambryegowda.WORKS_ON values('999887777',30,'30');
 
 EXEC SQL insert into adambryegowda.WORKS_ON values('999887777',10,'10');
 
EXEC SQL insert into adambryegowda.WORKS_ON values('987987987',10,'35');
 EXEC SQL insert into adambryegowda.WORKS_ON values('987987987',30,'5');
 
 EXEC SQL insert into adambryegowda.WORKS_ON values('987654321',30,'20');
 
 EXEC SQL insert into adambryegowda.WORKS_ON values('987654321',20,'15');
  
EXEC SQL insert into adambryegowda.WORKS_ON values('333445555',20,'10');
 EXEC SQL insert into adambryegowda.DEPENDENT values('333445555','Alice','F','1986-04-05','Daughter');
 
EXEC SQL insert into adambryegowda.DEPENDENT values('333445555','Theodore','M','1983-10-25','Son');
  EXEC SQL insert into adambryegowda.DEPENDENT values('333445555','Joy','F','1958-05-03','Spouse');
       EXEC SQL insert into adambryegowda.DEPENDENT values('987654321','Abner','M','1942-02-28','Spouse');
  EXEC SQL insert into adambryegowda.DEPENDENT values('123456789','Michael','M','1988-01-04','Son');
 
  EXEC SQL insert into adambryegowda.DEPENDENT values('123456789','Alice','F','1988-12-30','Daughter');
EXEC SQL insert into adambryegowda.DEPENDENT values('123456789','Elizabeth','F','1967-05-05','Spouse');

if(sqlca.sqlcode>=0)
printf("Successful\n");
else 
printf("Not Successful\n");
EXEC SQL COMMIT;
EXEC SQL DISCONNECT;
return 0;
}