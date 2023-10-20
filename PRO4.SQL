



/*drop procedure if EXISTS pro3;
DELIMITER $

CREATE PROCEDURE pro3(p1 int , p2 varchar(20) , p3 varchar(20))
begin 
  declare exit handler for 1062 
  select "Data present" as "error" ;	
  
 INSERT into d VALUES(p1,p2,p3);
 
 
end $
delimiter ;
*/

/*
drop procedure if exists pro4;
delimiter $
create procedure pro4(p1 int , p2 VARCHAR(20) , p3 VARCHAR(20))
begin
 declare exit handler for 1062 
  select "Data present" as "error" ;
 if p3 ='pune' then insert into d values (p1,p2,p3);
         select "RECORD INSERTED SUCCESSFUL";
	
ELSE 
    SELECT "INVALID ENTRY";
 
 END IF ;
 

 
end $
delimiter ;


*/



/*
drop procedure if exists pro4;
delimiter $
create PROCEDURE pro4(_deptno int)
BEGIN
declare flag bool;

select true into flag from dept where deptno = _deptno;
if flag THEN 
     select * from dept where deptno = _deptno	 ;
	 
else 
    select "record not found";
	
end if;
	 
	 

end $
delimiter ;
*/





/*
drop PROCEDURE IF exists pro7;
delimiter $
create PROCEDURE pro7(x int)
begin 
select * from emp limit x;


end $
delimiter ;
*/


/*

drop procedure if exists pro8;
delimiter $
create procedure pro8(_tablename varchar(20))
BEGIN
set @x := concat('select * from',_tablename);
prepare z from @x;
EXECUTE z;


end $
delimiter ;

*/



/*

drop procedure if exists pro10;
delimiter $

CREATE procedure pro10(_cname int,_tname varchar(2000))
BEGIN 
set @x := concat("select" , _cname , "from", _tname);

prepare z from @x;
execute z;
end $
delimiter ;


*/


/*
drop trigger  if exists tr1;
delimiter $

create trigger tr1  before insert on d for each ROW 
BEGIN

insert into d1 values(new.deptno , new.dname , new.loc);

end $
delimiter ; 
*/


/*
drop procedure if exists pro2;
delimiter $
create procedure pro2(in x int)
BEGIN
	if x between 1 and 10 THEN
		select "Good";
	ELSE
		select "Bad";
	end if;
end $
delimiter ;


*/

/*
drop procedure if exists pro10;
delimiter $
create procedure pro10(_cName varchar(1000),_tName varchar(2000))
BEGIN
declare exit handler for 1054 select "Invalid column name in the selection list";
    set @x := concat( "select ", _cName,  " from ", _tName);
	prepare z from @x;
	execute z;
end $
delimiter ;

*/



/*
drop trigger  if exists tr1;
delimiter $

create trigger tr1  before insert on d for each ROW 
BEGIN

 if dayname(now()) = 'Sunday' then  signal sqlstate '42000' set message_text ="Today is monday HOLIDAY";
 
 else 
    insert into d1 values(new.deptno , new.dname , new.loc , CURRENT_DATE , CURRENT_TIME,USER());
 end IF;
end $
delimiter ;

*/

/*
drop trigger  if exists tr1;
delimiter $

create trigger tr1  before insert on dump for each ROW 
BEGIN

 if new.id % 3 = 0 then insert into disc3 values(new.id , new.name, new.sal);
 
 else if 
            new.id % 3 = 1 then insert into disc1 values(new.id , new.name, new.sal);
 else 
      new.id % 3 = 2 then insert into disc2 values(new.id , new.name, new.sal);
  
 end if;
end $
delimiter ;

*/

/*

drop trigger  if exists tr1;
delimiter $

create trigger tr1  before insert on dump1 for each ROW 
BEGIN

 if new.id % 3 = 0 then insert into disc3 values(new.id , new.name, new.sal);
 
  end if ;
           
if  new.id % 3 = 1 then insert into disc1 values(new.id , new.name, new.sal);
 
end if ; 
      
	  
	  
	if   new.id % 3 = 2 then insert into disc2 values(new.id , new.name, new.sal);
  
 end if;

end $
delimiter ;

*/








/*

drop trigger  if exists tr1;
delimiter $

create trigger tr1  before insert on dump1 for each ROW 
BEGIN

 if new.id % 3 = 0 then insert into disc3 values(new.id , new.name, new.sal);
 
  ELSE IF
           
 new.id % 3 = 1 then insert into disc1 values(new.id , new.name, new.sal);
 
 ELSE IF
      
	  
	  
	  new.id % 3 = 2 then insert into disc2 values(new.id , new.name, new.sal);
  
 end if;

end $
delimiter ;

*/



/*


drop PROCEDURE if EXISTS login;
delimiter $
create procedure login(name1 varchar(20), password1 VARCHAR(20) , email1 varchar(20))
BEGIN

insert into t1 (username,password,email)values(name1 , password1, email1 );

end $
delimiter ;



*/



/*
drop procedure if EXISTS checkuser;
delimiter $
create procedure checkuser(email1 varchar(20))
BEGIN
 
 declare x boolean ;
  
  select true into x from t2 where email = email1;
  
  if (x= true) 
  then 
  
  select username , password from t2;
  
  else 
   insert into t2(curr_date, curr_time) VALUES(CURRENT_DATE() , current_time());
 
  end if;
end $

delimiter ;


*/



/*

drop procedure if EXISTS sepa_rate;
delimiter $
CREATE procedure sepa_rate( name varchar(100))
begin 
 
 declare  x int ;
 set x:= 1;
 
 lbl1:LOOP
 select substring(name, x,1);
 set x := x+ 1;
 if x > LENGTH(name)
 then 
 leave lbl1;
 end if ;
 end loop ;
 
end $
delimiter ; 

*/


/*
drop procedure if EXISTS sepa_rate;
delimiter $
CREATE procedure sepa_rate( name varchar(100))
begin 
 
 
 
 declare  x int ;
 declare y varchar(20);
 set x:= 0;
 set @z:= "";
 lbl1:LOOP
  
 set x := x+ 1;
 
 if x = 1
 then 
 set @z:= concat(@z,substr(name, x,1));
 
 else 
 
 set @z:= concat(@z,',',substr(name, x,1));
 
 end if ;
 
 if x > LENGTH(name)-1
 then 
 leave lbl1;
 end if ;
 end loop ;
 
end $
delimiter ; 

*/




/*


drop procedure if EXISTS sepa_rate;
delimiter $
CREATE procedure sepa_rate( name varchar(100))
begin 
 
 
 declare  x int ;
 
 
 set x:= 0;
  set @z:= "";
  set @y:= "";
 lbl1:LOOP
  
 set x := x+ 1;
 
 if ASCII(substr(name, x,1)) < 65
 then 
 set @z:= concat(@z,substr(name, x,1));
 
 else 
 
 set @y:= concat(@y,substr(name, x,1));
 
 end if ;
 
 if x > LENGTH(name)-1
 then 
 leave lbl1;
 end if ;
 end loop ;
 
end $
delimiter ; 




*/


/*
drop procedure if EXISTS sepa_rate;
delimiter $
CREATE procedure sepa_rate( name varchar(100))
begin 
 
 
 declare  x int ;
 
 
 set x:= 0;
  set @z:= "";
  set @y:= "";
 lbl1:LOOP
  
 set x := x+ 1;
 
 if ASCII(substr(name, x,1)) < 65
 then 
 set @z:= concat(@z,substr(name, x,1));
 
 else 
 
 set @y:= concat(@y,substr(name, x,1));
 
 end if ;
 
 if x > LENGTH(name)-1
 then 
 leave lbl1;
 end if ;
 end loop ;
 
end $
delimiter ; 


*/


/*
drop procedure if EXISTS sepa_rate;
delimiter $
CREATE procedure sepa_rate( name varchar(100))
begin 
 
 
 declare  x int ;
 
 
 set x:= 0;
  set @z:= "";
  set @y:= "";
 lbl1:LOOP
  
 set x := x+ 1;
 
 if ASCII(substr(name, x,1)) < 97
 then 
 set @z:= concat(@z,substr(name, x,1));
 
 else 
 
 set @y:= concat(@y,substr(name, x,1));
 
 end if ;
 
 if x > LENGTH(name)-1
 then 
 leave lbl1;
 end if ;
 end loop ;
 
end $
delimiter ; 

*/










/*
drop procedure if EXISTS sepa_rate;
delimiter $
CREATE procedure sepa_rate( name varchar(100))
begin 
 
 declare  x int ;
 
 
 set x:=0;
 set @n:= 0;
 set @v:= 0;
 set @w:= 0;
  
 lbl1:LOOP
  
 set x := x+ 1;
 
 set @y:= substr(name, x,1);
 
 if ASCII(substr(name, x,1)) =32 
 
 then 
 set @w:= @w + 1  ;
 
  end if;
 
 if  @y BETWEEN '0' and '9'
 then 
 set @n:= @n + 1  ;
 end if;

 if @y like 'a' or @y like 'e' or @y like 'i' or @y like 'o' or @y like 'u' 
 
then 
set @v:= @v + 1  ;
 
end if ;

 


 if x > LENGTH(name)-1
 then 
 leave lbl1;
 end if ;
 end loop ;
 
end $
delimiter ; 






*/

/*
drop trigger if exists tr1;
delimiter $

create trigger tr1 before insert on insertstudent  for EACH ROW

BEGIN

insert into log values ("Record inserted successfully");

end $

delimiter ; 
*/

/*
drop trigger if exists tr1;
delimiter $

create trigger tr1 before insert on student1  for EACH ROW

BEGIN

insert into log_student values (new.id , new.firstname , new.lastname);

end $

delimiter ; 
*/

/*
drop trigger if exists tr1;
/*drop trigger if exists tr2;
/*
delimiter $




create trigger tr1 before insert on st2  for EACH ROW

BEGIN

insert into log500 values (new.id,new.name );

end $
delimiter ;

*/

/*
create trigger tr2 after UPDATE on student1  for EACH ROW

BEGIN



update log3 set firstname = new.firstname , lastname = new.lastname where id = new.id;

end $

delimiter ; 
*/

/*

drop trigger if exists tr1;

delimiter $

create trigger tr1 before DELETE on st1  for EACH ROW

BEGIN

insert into log20 values (old.id,old.name );

end $
delimiter ;

*/


/*
drop TRIGGER if EXISTS tr5;
delimiter $

create TRIGGER tr5 before insert on st1 for each row
BEGIN
IF
dayname(now())='Sunday' then
signal sqlstate '42000' SET message_text ='Invalid tran. holiday';

ELSE
insert into log20 values(new.id, new.name);
end if;
end $
delimiter ;
*/

/*

drop trigger if exists tr50;
delimiter $
create trigger tr50 before insert on rt for each row 
BEGIN
	if new.age < 18 THEN
		signal sqlstate '42000' set message_text = 'Person not eligible for voting';
	end if;

end $ 
delimiter ;

*/





drop trigger if exists tr52;
delimiter $
create trigger tr52 before insert on pre2  for each row 
BEGIN


declare pid bool;
set p:= false;
select true into pid  from patient where pid = new.pid;
if pid 
then 

 signal sqlstate '42000' set message_text = 'Person not register';


end if ;

end $ 
delimiter ;









