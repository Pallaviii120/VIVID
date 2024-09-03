-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 14, 2022 at 12:25 PM
-- Server version: 5.6.50
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ess_ultratech_`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`db_ultra`@`%` PROCEDURE `after_24_hours_task_status` ()  BEGIN
set sql_safe_updates=0;




 update tbl_task_header  set s_status='Return' where  date_sub(d_due_date ,interval 0 hour) <=  date_sub(current_date(),interval 24 hour)  and (s_status <> 'Completed' or s_status <> 'Drop');

 
END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `attach_upload` (`att_type` VARCHAR(20), `ogi_name` VARCHAR(500), `new_name` VARCHAR(500), `spath` VARCHAR(20), `em_code` VARCHAR(50))  BEGIN

INSERT INTO  `tbl_temp_attachment` (`s_ogi_name`,`s_new_name`,`s_path`,`s_em_code`,`s_attach_type`)
VALUES (ogi_name, new_name, spath, em_code, att_type);


END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `attendance_update` (`cur_date` VARCHAR(50), `sign_in` VARCHAR(50), `sing_out` VARCHAR(50), `em_code` VARCHAR(200), `work_type` VARCHAR(100), `tag` VARCHAR(20))  BEGIN

declare shift_id varchar(10);
declare sh_strt_time varchar(10);
declare sh_end_time varchar(10);
declare sh_gross_strttym varchar(10);
declare sh_gross_endtym varchar(10);

declare shoutdatetime varchar(30);
declare shindatetime varchar(30);

declare worktime varchar (10); 
declare cnt int(2);

declare grossindtym varchar(30);
declare grossoutdtym varchar(30);

select  s_shift, t_start_time, t_end_time, s_gross_start_time, s_gross_end_time into shift_id, sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym from tbl_shift where  s_shift = (select n_shift_id from tbl_emp_shift where  s_em_code = em_code);

SELECT STR_TO_DATE(concat(cur_date,' ',sh_strt_time),'%Y-%m-%d %H:%i') into shindatetime;
SELECT STR_TO_DATE(concat(cur_date,' ',sh_end_time),'%Y-%m-%d %H:%i') into shoutdatetime;
select TIMEDIFF(shoutdatetime,shindatetime) into worktime;

select  date_add(shindatetime, interval sh_gross_strttym minute) into grossindtym;

select  date_add(shindatetime, interval -(sh_gross_endtym) minute) into grossindtym;

select count(*) into cnt from tbl_attendance where s_em_code= em_code and d_atten_date=cur_date;
if cnt = 0 and tag = 'PUNCH_IN' then 
	insert into tbl_attendance (s_em_code,d_atten_date,s_shift_id,t_signin_time,s_daily_working_hour,s_work_type) values(em_code,cur_date,shift_id,sign_in,worktime,work_type);
elseif tag = 'PUNCH_OUT' THEN
	update tbl_attendance set t_signout_time=sing_out where s_em_code= em_code and d_atten_date=cur_date;
end if;

END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `call_comment` (`tag` VARCHAR(20), `em_code` VARCHAR(50), `task_id` INT, `comments` TEXT, `com_id` INT)  BEGIN

if(tag = 'I') THEN 
INSERT INTO  `tbl_comment`
( `n_task_id`,`s_em_code`,`s_comment`) VALUES (task_id,em_code,comments);
ELSEIF tag = 'D' then 
DELETE FROM tbl_comment WHERE n_com_id=com_id AND s_em_code=em_code;
END IF;
END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `current_fisical_year` ()  BEGIN

SELECT CASE 
WHEN MONTH(current_timestamp()) > 3 THEN
          concat(YEAR(current_timestamp()), '-',SUBSTRING(YEAR(current_timestamp())+1, 3, 2)) 
	 ELSE concat(YEAR(current_timestamp())-1, '-',SUBSTRING(YEAR(current_timestamp())+1, 3, 2)) END AS financial_year;

END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `get_department_wise_return_tasklist` ()  BEGIN

 DECLARE dep_id   int(11);
 DECLARE CNT   int(11);
 
   
   DECLARE exit_loop BOOLEAN;         
   
   DECLARE dep_cur CURSOR FOR select n_dep_id from tbl_department;
   
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
   
   OPEN dep_cur;
   
   dep_cur: LOOP
     
     FETCH  dep_cur INTO dep_id;
     
     
     select COUNT(*) INTO CNT from tbl_task_header where n_dep_id = dep_id;
     IF CNT > 0  THEN 
      SELECT 
                            a.n_task_id,
                            a.n_dep_id,
                            GETDEPTBYID(a.n_dep_id) AS dep_name,
                            GET_EMAIL_BY_EMP_CODE(GET_DEPT_HEAD_BY_ID(a.n_dep_id)) AS dep_head_email,
                            a.d_start_date,
                            a.d_due_date,
                            CURRENT_DATE() - INTERVAL 1 DAY,
                            a.d_due_date,
                            a.s_task_name,
                            a.s_priority,
                        
                            GET_PROFILE(b.s_em_code) AS profile,
                            a.s_status
                        FROM
                            tbl_task_header a,
                            tbl_task_transaction b
                        WHERE
                            a.n_task_id = b.n_task_id
                                AND a.s_status = b.s_status
                           
                            
								AND a.n_dep_id = dep_id
                        GROUP BY a.n_dep_id , a.n_task_id
                        ORDER BY a.n_dep_id DESC;
			END IF;
     
     IF exit_loop THEN
         CLOSE dep_cur;
         LEAVE dep_cur;
     END IF;
   END LOOP dep_cur;
END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `start_and_stop_mysql_event_scheduler` (`action_takken` VARCHAR(150))  BEGIN
declare EVENT_NAME VARCHAR(200);
SET  EVENT_NAME = 'task_reset';
SHOW PROCESSLIST; 
if (action_takken = 'Start') then 
	
	 SET GLOBAL event_scheduler = ON;
    
elseif action_takken= 'Stop' then  
	
	SET GLOBAL event_scheduler = OFF;
end if;
SHOW EVENTS;



END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `submit_leave` (`em_code` VARCHAR(100), `type_id` INT, `start_date` VARCHAR(100), `end_date` VARCHAR(100), `leave_type` VARCHAR(100), `reason` VARCHAR(100), `created_by` VARCHAR(100), `leave_duration` VARCHAR(20), `current_date_` VARCHAR(20))  BEGIN
declare rep_pers varchar(10000);
declare rep_pers_email varchar(100); 
declare leave_allow varchar(100);
declare max_leav DECIMAL(5,2) default 0;
declare email_list varchar(5000);


SELECT group_concat( DISTINCT if(s_em_email  <> '' || s_em_email is not null,s_em_email,null) SEPARATOR':') into email_list FROM db_ess_ultratech_.tbl_employee  where s_em_role ='ADMIN' and n_status='ACTIVE';

SELECT n_max_leave_in_month into max_leav FROM tbl_assign_leave where n_type_id = type_id and s_em_code=em_code and  f_dateyear = current_fisical_year();

If leave_duration > CAST(max_leav AS DECIMAL(5,2)) then 
	set rep_pers = 'DURATION_NOT_ALLOW';
ELSE 
	SELECT  IF(CAST(sum(d_leave_duration) AS DECIMAL(5,2)) IS NULL || CAST(sum(d_leave_duration) AS DECIMAL(5,2)) < CAST(max_leav AS DECIMAL(5,2)), 'ALLOW', 'NOT_ALLOW')  INTO leave_allow FROM tbl_leave_transaction WHERE s_em_code = em_code AND MONTHNAME(current_date_) = MONTHNAME(CURRENT_DATE()) AND n_type_id = type_id and Year(CURRENT_DATE());
	IF leave_allow = 'NOT_ALLOW'  then 
			set rep_pers = 'DURATION_NOT_ALLOW';
			
	ELSE
		
		select s_em_reporting1,get_email_by_emp_code(s_em_reporting1) into rep_pers ,rep_pers_email from tbl_employee where s_em_code=em_code  and n_status='ACTIVE' ;
		if rep_pers <> null || rep_pers <> '' || rep_pers <> '-'  then 
				INSERT INTO `tbl_leave_transaction` (`s_em_code`, `n_type_id`, `d_start_date`, `d_end_date`, `s_leave_type`, `d_apply_date`, `s_reason`, `s_em_approver`,`s_created_by`,`d_leave_duration`)
			VALUES (em_code,type_id,start_date,end_date,leave_type,current_date(),reason,rep_pers,created_by,leave_duration);
            
			set rep_pers= concat(rep_pers_email,":",email_list); 
		else 
			set rep_pers= 'NOT_REPORTING_PERSON'; 
		end if;
	END IF;

END IF;
SELECT rep_pers;
END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `submit_task` (`dep_id` VARCHAR(5), `em_code` VARCHAR(100), `start_date` VARCHAR(100), `due_date` VARCHAR(100), `task_name` VARCHAR(500), `task_desc` VARCHAR(1800), `priority` VARCHAR(50), `statuss` VARCHAR(50), `created_by` VARCHAR(50))  BEGIN
declare task_id int(11);
INSERT INTO  `tbl_task_header` (`n_dep_id`, `d_start_date`, `d_due_date`, `s_task_name`, `s_task_desc` ,`s_priority`,`s_created_by`,`s_status`) VALUES (dep_id,start_date,due_date,task_name,task_desc,priority,created_by,statuss);

select n_task_id into task_id from tbl_task_header where n_dep_id=dep_id and s_task_name=task_name and s_created_by=created_by;



insert into tbl_task_transaction (n_task_id,s_em_code,s_status,s_created_by) values(task_id,em_code,statuss,created_by);

INSERT INTO `tbl_task_log`(`n_task_id`,`s_status`,`s_action_takker`,`s_tag`) VALUES (task_id,statuss,created_by,CONCAT('Task Created By',created_by));
INSERT INTO `tbl_task_log`(`n_task_id`,`s_status`,`s_action_takker`,`s_tag`) VALUES (task_id,statuss,created_by,CONCAT('Task Assign to',em_code));
END$$

CREATE DEFINER=`db_ultra`@`%` PROCEDURE `update_task` (`statuss` VARCHAR(20), `task_id` INT(11), `remark` VARCHAR(400), `em_code` VARCHAR(50), `reassign_em_code` VARCHAR(50))  BEGIN
declare sts varchar (50);
select s_status into sts from tbl_task_header where n_task_id = task_id;
if sts = 'Return' then
	update tbl_task_header set s_status= statuss ,s_updated_by=em_code,s_remark=remark where n_task_id=task_id;
	update tbl_task_transaction set s_em_code=reassign_em_code,s_status=statuss ,s_updated_by=em_code,s_remark=remark where n_task_id=task_id;
else 
	update tbl_task_header set s_status=statuss ,s_updated_by=em_code,s_remark=remark where n_task_id=task_id;
	update tbl_task_transaction set s_status=statuss ,s_updated_by=em_code,s_remark=remark where n_task_id=task_id;

end if;


INSERT INTO `tbl_task_log`(`n_task_id`,`s_status`,`s_action_takker`,`s_tag`) VALUES (task_id,statuss,em_code,remark); 
END$$

--
-- Functions
--
CREATE DEFINER=`db_ultra`@`%` FUNCTION `CHECK_DEPT_HEAD_IS` (`em_code` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET latin1 BEGIN
declare is_head binary default false ;
declare cnt int default 0 ;
 select count(*) into cnt FROM tbl_department where s_dep_head=em_code;
 if cnt <> 0 then
	set is_head = true;
else 
	set is_head = false;
end if;
RETURN is_head;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `current_fisical_year` () RETURNS VARCHAR(50) CHARSET latin1 BEGIN
 DECLARE FIYear VARCHAR(50)  ;  
set FIYear = CASE 
WHEN MONTH(current_timestamp()) > 3 THEN
          concat(YEAR(current_timestamp()), '-',SUBSTRING(YEAR(current_timestamp())+1, 3, 2)) 
	 ELSE concat(YEAR(current_timestamp())-1, '-',SUBSTRING(YEAR(current_timestamp())+1, 3, 2)) END ;

RETURN FIYear;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `getDeptById` (`id` INTEGER(11)) RETURNS VARCHAR(64) CHARSET utf8mb4 BEGIN
declare dept_nm varchar(64);
select s_dep_name into dept_nm from tbl_department where n_dep_id=id;
RETURN dept_nm;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `getEmpById` (`id` VARCHAR(64)) RETURNS VARCHAR(64) CHARSET utf8mb4 BEGIN
declare emp_nm varchar(64);
select concat(s_first_name ," ",s_last_name) into emp_nm from tbl_employee where s_em_code=id;
RETURN emp_nm;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `getLeaveNameById` (`id` INTEGER(11)) RETURNS VARCHAR(64) CHARSET utf8mb4 BEGIN
declare name varchar(64);
select s_name into name from tbl_leave_types where n_type_id=id;
RETURN name;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `getLocationById` (`id` INTEGER(11)) RETURNS VARCHAR(100) CHARSET latin1 BEGIN
declare loc_nm varchar(100);
select s_location_name into loc_nm from tbl_location_master where n_location_id=id;

RETURN loc_nm;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `getShiftNameById` (`id` INTEGER(11)) RETURNS VARCHAR(64) CHARSET utf8mb4 BEGIN
declare name varchar(64);
select s_shift into name from tbl_shift where n_shift_id=id;
RETURN name;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `get_dept_head_by_id` (`id` INTEGER(11)) RETURNS VARCHAR(64) CHARSET utf8mb4 BEGIN
declare dept_head varchar(64);
select s_dep_head into dept_head from tbl_department where n_dep_id=id;
RETURN dept_head;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `get_email_by_emp_code` (`em_code` VARCHAR(30)) RETURNS VARCHAR(500) CHARSET utf8mb4 BEGIN 
declare emp_email varchar(500);
select s_em_email into emp_email from tbl_employee where s_em_code = em_code;

RETURN emp_email;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `get_leave_type_name` (`type_id` INT(11)) RETURNS VARCHAR(100) CHARSET utf8mb4 BEGIN
declare type_name varchar(100);
select s_name into type_name from tbl_leave_types where n_type_id =type_id  ;
RETURN type_name;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `get_name_by_emp_code` (`em_code` VARCHAR(30)) RETURNS VARCHAR(500) CHARSET utf8mb4 BEGIN 
declare emp_name varchar(500);
select concat(s_first_name,' ',s_middle_name,' ',s_last_name) into emp_name from tbl_employee where s_em_code = em_code;

RETURN emp_name;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `get_profile` (`em_code` VARCHAR(30)) RETURNS VARCHAR(500) CHARSET utf8mb4 BEGIN 
declare ipath varchar(500);
select s_em_image into ipath from tbl_employee where s_em_code = em_code;

RETURN ipath;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `get_role_by_emp_code` (`em_code` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET utf8mb4 BEGIN
declare rol varchar(100);
select s_em_role into rol from tbl_employee where s_em_code = em_code;
RETURN rol;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `get_today_emp_availability` () RETURNS VARCHAR(50) CHARSET latin1 BEGIN
declare absent_emp int;
declare prasent_emp int;
declare late_in_emp int;
declare leave_today int; 
declare RETURN_VAL varchar(50); 

SELECT 
    SUM((CASE WHEN ISNULL(t_signin_time) = 0 THEN 0 ELSE 1 END)),
    SUM((CASE WHEN ISNULL(t_signin_time) = 1 THEN 0 ELSE 1 END)),
    SUM((CASE WHEN ISNULL(s_lateIn) = 0 THEN 1 ELSE 0 END))
INTO absent_emp , prasent_emp , late_in_emp FROM
    tbl_attendance
WHERE d_atten_date = DATE_SUB(CURRENT_DATE(), INTERVAL 0 DAY);

SELECT  
	COUNT(*) INTO leave_today 
FROM tbl_leave_transaction
WHERE d_start_date <= DATE_SUB(CURRENT_DATE(), INTERVAL 0 DAY);
SET RETURN_VAL = CONCAT('P=',prasent_emp,':A=',absent_emp,':LI=',late_in_emp,':L=',leave_today);

RETURN RETURN_VAL;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `upsertAssignLeave` (`em_code` VARCHAR(64), `type_id` INT(11), `current_leave` VARCHAR(50), `carry_forward_leave` VARCHAR(50), `dateyear` VARCHAR(64)) RETURNS VARCHAR(100) CHARSET utf8mb4 BEGIN
declare cnt int(10);
declare msg varchar(100);
declare assigned_day varchar(100);
set assigned_day = CAST(carry_forward_leave AS DECIMAL(5,2)) + CAST(current_leave AS DECIMAL(5,2));
SELECT 
    COUNT(*)
INTO cnt FROM
    tbl_assign_leave
WHERE
    s_em_code = em_code
        AND n_type_id = type_id
        AND f_dateyear = dateyear;
if cnt > 0 then
update tbl_assign_leave set n_assiged_days=assigned_day,n_carry_forward_leave=carry_forward_leave,n_current_leave=current_leave where s_em_code = em_code and n_type_id=type_id and f_dateyear=dateyear;
set msg="Data Updated";
else
insert into tbl_assign_leave(s_em_code,n_type_id,n_assiged_days,f_dateyear,n_carry_forward_leave,n_current_leave) values(em_code,type_id,assigned_day,dateyear,carry_forward_leave,current_leave);
set msg="Data Inserted";
end if;
RETURN msg;
END$$

CREATE DEFINER=`db_ultra`@`%` FUNCTION `upsertEmployee` (`em_code` VARCHAR(64), `designation` VARCHAR(250), `dep_id` INT(11), `first_name` VARCHAR(128), `middle_name` VARCHAR(128), `last_name` VARCHAR(128), `em_email` VARCHAR(64), `em_address` VARCHAR(512), `em_gender` VARCHAR(15), `em_phone` VARCHAR(64), `em_birthday` VARCHAR(128), `em_blood_group` VARCHAR(5), `em_joining_date` VARCHAR(128), `em_pan` VARCHAR(15), `em_adhar` VARCHAR(15), `em_pf_no` VARCHAR(20), `em_marital_status` VARCHAR(20), `em_reporting1` VARCHAR(64), `em_reporting2` VARCHAR(64), `location_id` INTEGER(11), `pass` VARCHAR(350)) RETURNS VARCHAR(64) CHARSET utf8mb4 BEGIN
declare cnt int(10);
select count(*) into cnt from  tbl_employee where s_em_code = em_code;
if cnt > 0 then
update tbl_employee set s_designation=designation,n_dep_id=dep_id,s_first_name=first_name,s_middle_name=middle_name,s_last_name=last_name,s_em_email=em_email,s_em_address=em_address,s_em_gender=em_gender,s_em_phone=em_phone,s_em_birthday=em_birthday,s_em_blood_group=em_blood_group,d_em_joining_date=em_joining_date,s_em_pan=em_pan,s_em_adhar=em_adhar,s_em_pf_no=em_pf_no,s_em_marital_status=em_marital_status,s_em_reporting1=em_reporting1,s_em_reporting2=em_reporting2,n_location_id=location_id where s_em_code = em_code;
else
insert into tbl_employee(s_em_code,s_designation,n_dep_id,s_first_name,s_middle_name,s_last_name,s_em_email,s_em_password,s_em_role,s_em_address,s_em_gender,s_em_phone,s_em_birthday,s_em_blood_group,d_em_joining_date,s_em_pan,s_em_adhar,s_em_pf_no,s_em_marital_status,s_em_reporting1,s_em_reporting2,n_location_id) values(em_code,designation,dep_id,first_name,middle_name,last_name,em_email,md5(pass),'EMPLOYEE',em_address,em_gender,em_phone,em_birthday,em_blood_group,em_joining_date,em_pan,em_adhar,em_pf_no,em_marital_status,em_reporting1,em_reporting2,location_id);
end if;
RETURN em_code;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assign_leave`
--

CREATE TABLE `tbl_assign_leave` (
  `n_al_id` int(11) NOT NULL,
  `s_em_code` varchar(64) DEFAULT NULL,
  `n_type_id` int(11) NOT NULL,
  `n_assiged_days` varchar(50) DEFAULT '0',
  `n_consumed_days` varchar(50) DEFAULT '0',
  `f_dateyear` varchar(64) DEFAULT NULL,
  `n_carry_forward_leave` varchar(45) DEFAULT '0',
  `n_current_leave` varchar(45) DEFAULT '0',
  `n_max_leave_in_month` decimal(5,2) DEFAULT '3.00',
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_assign_leave`
--

INSERT INTO `tbl_assign_leave` (`n_al_id`, `s_em_code`, `n_type_id`, `n_assiged_days`, `n_consumed_days`, `f_dateyear`, `n_carry_forward_leave`, `n_current_leave`, `n_max_leave_in_month`, `d_created_datetime`, `d_updated_datetime`) VALUES
(1, 'F/09-10/PJ', 1, '26.00', '0', '2021-22', '0', '26', '5.00', '2021-10-19 15:16:57', '2021-10-19 15:20:10'),
(5, 'F/07-08/SP', 1, '30.00', '0', '2021-22', '2', '28', '3.00', '2021-10-28 15:05:41', '2021-10-28 15:05:41'),
(8, 'F/05-06/MA', 1, '26.00', '0', '2021-22', '0', '26', '3.00', '2021-11-22 11:32:26', '2021-11-22 11:32:57'),
(12, 'O/08-09/SP', 1, '28.00', '0', '2021-22', '2', '26', '3.00', '2022-01-14 11:45:16', '2022-01-14 11:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attachment`
--

CREATE TABLE `tbl_attachment` (
  `n_id` int(11) NOT NULL,
  `s_ogi_name` varchar(500) DEFAULT NULL,
  `s_new_name` varchar(500) DEFAULT NULL,
  `s_path` varchar(45) DEFAULT NULL,
  `s_em_code` varchar(50) DEFAULT NULL,
  `s_attach_type` varchar(45) DEFAULT NULL,
  `n_task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_attachment`
--

INSERT INTO `tbl_attachment` (`n_id`, `s_ogi_name`, `s_new_name`, `s_path`, `s_em_code`, `s_attach_type`, `n_task_id`) VALUES
(1, 'Dump20210930.sql', '1633073185248_Dump20210930.sql', '/task_attach', 'EMP02', 'TASK_FILE', 1),
(2, '94.0.4606.71.manifest', '1633160145950_94.0.4606.71.manifest', '/task_attach', 'EMP01', 'TASK_FILE', 5),
(3, 'chrome.dll', '1633247554808_chrome.dll', '/task_attach', 'EMP02', 'TASK_FILE', 6),
(4, 'details_close.png', '1633489550850_details_close.png', '/task_attach', 'EMP02', 'TASK_FILE', 1),
(5, 'details_open.png', '1633489606637_details_open.png', '/task_attach', 'EMP02', 'TASK_FILE', 2),
(6, 'arrow_right_12x12.png', '1633489864532_arrow_right_12x12.png', '/task_attach', 'EMP02', 'TASK_FILE', 3),
(7, 'ESS.csv', '1633678781841_ESS.csv', '/task_attach', 'EMP01', 'TASK_FILE', 4),
(8, 'ESS.csv', '1633679565988_ESS.csv', '/task_attach', 'EMP01', 'TASK_FILE', 5),
(9, 'boy1.jpg', '1633679574903_boy1.jpg', '/task_attach', 'EMP01', 'TASK_FILE', 5),
(10, 'ESS.csv', '1634121549773_ESS.csv', '/task_attach', 'EMP02', 'TASK_FILE', 6),
(11, 'boy1.jpg', '1634552403624_boy1.jpg', '/task_attach', 'EMP02', 'TASK_FILE', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `n_att_id` int(11) NOT NULL,
  `s_em_code` varchar(64) DEFAULT NULL,
  `s_shift_id` varchar(10) DEFAULT NULL,
  `d_atten_date` varchar(64) DEFAULT NULL,
  `t_signin_time` varchar(64) DEFAULT NULL,
  `t_signout_time` varchar(64) DEFAULT NULL,
  `s_daily_working_hour` varchar(64) DEFAULT NULL,
  `s_actual_working_hour` varchar(64) DEFAULT NULL,
  `s_absence` varchar(128) DEFAULT NULL,
  `s_earlyIn` varchar(65) DEFAULT NULL,
  `s_lateIn` varchar(65) DEFAULT NULL,
  `s_earlyOut` varchar(65) DEFAULT NULL,
  `s_lateOut` varchar(65) DEFAULT NULL,
  `s_overtime` varchar(128) DEFAULT NULL,
  `s_first_half` varchar(45) DEFAULT NULL,
  `s_scound_half` varchar(45) DEFAULT NULL,
  `s_status` varchar(64) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_work_type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_attendance`
--

INSERT INTO `tbl_attendance` (`n_att_id`, `s_em_code`, `s_shift_id`, `d_atten_date`, `t_signin_time`, `t_signout_time`, `s_daily_working_hour`, `s_actual_working_hour`, `s_absence`, `s_earlyIn`, `s_lateIn`, `s_earlyOut`, `s_lateOut`, `s_overtime`, `s_first_half`, `s_scound_half`, `s_status`, `d_created_datetime`, `d_updated_datetime`, `s_work_type`) VALUES
(1, 'EMP02', 'A', '2021-10-04', '10:19', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-04 10:19:23', '2021-10-04 10:19:23', 'WFH'),
(2, 'EMP01', 'A', '2021-10-04', '11:12', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-04 11:12:57', '2021-10-04 11:12:57', 'WFH'),
(3, 'EMP03', 'B', '2021-10-04', '11:15', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-04 11:15:12', '2021-10-04 11:15:12', 'WFH'),
(4, 'EMP03', 'B', '2021-10-06', '08:22', '23:33', '08:00:00', '15:11:00', NULL, NULL, '-398 minute', '33 minute', NULL, '431 minute', 'P', 'P', 'P', '2021-10-06 08:22:28', '2021-10-06 23:33:22', 'WFH'),
(5, 'EMP01', 'A', '2021-10-06', '08:24', '23:32', '08:00:00', '15:08:00', NULL, NULL, '84 minute', '512 minute', NULL, '428 minute', 'A', 'P', 'HD', '2021-10-06 08:24:56', '2021-10-06 23:32:16', 'WFH'),
(6, 'EMP02', 'A', '2021-10-06', '08:27', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-06 08:27:21', '2021-10-06 08:27:21', 'WFH'),
(7, 'EMP02', 'A', '2021-10-07', '14:43', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-07 14:43:15', '2021-10-07 14:43:15', 'OFFICE'),
(8, 'EMP01', 'A', '2021-10-07', '15:20', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-07 15:20:50', '2021-10-07 15:20:50', 'OFFICE'),
(9, 'EMP01', 'A', '2021-10-08', '09:10', '14:30', '08:00:00', '05:20:00', NULL, NULL, '130 minute', '-30 minute', NULL, '0 minute', 'A', 'P', 'HD', '2021-10-08 09:10:54', '2021-10-08 14:30:11', 'FACTORY'),
(10, 'EMP02', 'A', '2021-10-08', '14:29', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-08 14:29:24', '2021-10-08 14:29:24', 'OFFICE'),
(11, 'EMP01', 'A', '2021-10-12', '16:14', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-12 16:14:38', '2021-10-12 16:14:38', 'OFFICE'),
(12, 'EMP03', 'B', '2021-10-12', '16:15', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-12 16:15:47', '2021-10-12 16:15:47', 'OFFICE'),
(13, 'EMP01', 'A', '2021-10-13', '12:06', '14:50', '08:00:00', '02:44:00', NULL, NULL, '306 minute', '-10 minute', NULL, '0 minute', 'A', 'P', 'HD', '2021-10-13 12:06:44', '2021-10-13 14:50:42', 'OFFICE'),
(14, 'EMP02', 'A', '2021-10-13', '12:06', '16:41', '08:00:00', '04:35:00', NULL, NULL, '306 minute', '101 minute', NULL, '0 minute', 'A', 'P', 'HD', '2021-10-13 12:06:54', '2021-10-13 16:41:21', 'OFFICE'),
(17, 'EMP03', 'B', '2021-10-13', '15:34', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-10-13 15:34:03', '2021-10-13 15:34:03', 'OFFICE'),
(18, 'EMP01', 'A', '2021-10-18', '14:18', NULL, '15:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-10-18 14:18:45', '2021-10-18 14:18:45', 'OFFICE'),
(19, 'EMP02', 'A', '2021-10-18', '16:04', NULL, '15:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-10-18 16:04:24', '2021-10-18 16:04:24', 'OFFICE'),
(20, 'EMP03', 'B', '2021-10-18', '16:27', NULL, '08:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-10-18 16:27:22', '2021-10-18 16:27:22', 'OFFICE'),
(21, 'EMP05', 'A', '2021-10-18', '16:27', '16:37', '15:00:00', '00:10:00', NULL, NULL, '597 minute', '-293 minute', NULL, '0 minute', 'A', 'A', 'A', '2021-10-18 16:27:56', '2021-10-18 16:37:34', 'OFFICE'),
(22, 'F/09-10/PJ', NULL, '2021-10-19', '15:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-10-19 15:01:22', '2021-10-19 15:01:22', 'OFFICE'),
(23, 'emp2948', 'A', '2021-10-23', '11:58', '15:21', '09:00:00', '03:23:00', NULL, NULL, '148 minute', '-189 minute', NULL, '0 minute', 'A', 'A', 'A', '2021-10-23 11:58:38', '2021-10-23 15:21:26', 'OFFICE'),
(24, 'F/09-10/PJ', 'A', '2021-10-23', '12:02', '15:21', '09:00:00', '03:19:00', NULL, NULL, '152 minute', '-189 minute', NULL, '0 minute', 'A', 'A', 'A', '2021-10-23 12:02:12', '2021-10-23 15:21:42', 'OFFICE'),
(25, 'Emp234', 'T-FS', '2021-10-25', '13:07', NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-10-25 13:07:40', '2021-10-25 13:07:40', 'OFFICE'),
(26, 'emp0123', NULL, '2021-10-26', '11:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-10-26 11:49:22', '2021-10-26 11:49:22', 'OFFICE'),
(27, 'ULT0012', 'A', '2021-11-11', '17:53', '17:53', '09:00:00', '00:00:00', NULL, NULL, '503 minute', '-37 minute', NULL, '0 minute', 'A', 'A', 'A', '2021-11-11 17:53:26', '2021-11-11 17:53:45', 'OFFICE'),
(28, 'ULT0012', 'A', '2021-11-12', '10:36', NULL, '09:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-11-12 10:36:13', '2021-11-12 10:36:13', 'OFFICE'),
(29, 'emp0123', 'A', '2021-11-12', '10:39', NULL, '09:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-11-12 10:39:18', '2021-11-12 10:39:18', 'OFFICE'),
(30, 'F/07-08/SP', 'A', '2021-11-13', '12:07', NULL, '09:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-11-13 12:07:39', '2021-11-13 12:07:39', 'FACTORY'),
(31, 'F/05-06/MA', NULL, '2021-11-22', '11:35', '11:35', '09:00:00', '00:00:00', NULL, NULL, '125 minute', '-415 minute', NULL, '0 minute', 'A', 'A', 'A', '2021-11-22 11:35:12', '2021-11-22 11:35:17', 'OFFICE'),
(32, 'F/07-08/SP', 'A', '2021-11-22', '11:37', NULL, '09:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2021-11-22 11:37:14', '2021-11-22 11:37:14', 'OFFICE'),
(33, 'O/08-09/SP', NULL, '2022-01-11', '15:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, '2022-01-11 15:04:13', '2022-01-11 15:04:13', 'FACTORY');

--
-- Triggers `tbl_attendance`
--
DELIMITER $$
CREATE TRIGGER `tbl_attendance_AFTER_INSERT` AFTER INSERT ON `tbl_attendance` FOR EACH ROW BEGIN

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tbl_attendance_BEFORE_INSERT` BEFORE INSERT ON `tbl_attendance` FOR EACH ROW BEGIN
declare inhour integer(4);
declare outhour integer(4);
declare indatetime varchar(30);
declare outdate varchar(30);
declare outdatetime varchar(30);
declare actualwork varchar (10); 
declare attenddate varchar(30);

declare shiftid varchar(11);
declare shinhour integer(4);
declare shouthour integer(4);
declare sh_strt_time varchar(10);
declare sh_end_time varchar(10);
declare sh_gross_strttym varchar(10);
declare sh_gross_endtym varchar(10);
declare shoutdate varchar(30);
declare shoutdatetime varchar(30);
declare shindatetime varchar(30);
declare worktime varchar (10); 
declare eout integer(10);
declare lin integer(10);
declare glin integer(10);
declare geout integer(10);
declare overtym integer(10);
declare grossindtym varchar(30);
declare grossoutdtym varchar(30);
declare minwork integer(4);



if new.t_signin_time is not null and new.t_signin_time !='' and upper(new.t_signin_time) !='NULL' and new.t_signin_time !='null' and new.t_signout_time is not null and new.t_signout_time != '' and upper(new.t_signout_time) !='NULL' and new.t_signout_time !='null' THEN
	select hour(new.t_signin_time),hour(new.t_signout_time) into inhour,outhour;

	SELECT DATE_FORMAT(STR_TO_DATE(new.d_atten_date, '%Y-%m-%d'), '%Y-%m-%d') into attenddate;
	if inhour > 12 and outhour < 12 then
	SELECT DATE_ADD(attenddate, INTERVAL 1 DAY) into outdate;
	else
	set outdate = attenddate;
	end if;

	SELECT STR_TO_DATE(concat(attenddate,' ',new.t_signin_time),'%Y-%m-%d %H:%i') into indatetime;

	SELECT STR_TO_DATE(concat(outdate,' ',new.t_signout_time),'%Y-%m-%d %H:%i') into outdatetime;

	select TIMEDIFF(outdatetime,indatetime) into actualwork;
	set new.s_actual_working_hour=actualwork;
	
	
	select n_shift_id into shiftid from tbl_emp_shift where n_emp_shift_id = (select max(n_emp_shift_id) from tbl_emp_shift where s_em_code=new.s_em_code);
	if shiftid is not null then

	set new.s_shift_id=shiftid;

	select t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours into sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym,minwork from tbl_shift where s_shift=shiftid;
	else
	SELECT t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours into sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym,minwork FROM tbl_shift GROUP BY ABS(Time_to_sec(t_start_time)) ORDER BY MIN(ABS(ABS(Time_to_sec(t_start_time))  - Time_to_sec(new.t_signin_time))) LIMIT 1;
	end if;

	select hour(sh_strt_time),hour(sh_end_time) into shinhour,shouthour;
	if shinhour > 12 and shouthour < 12 then
	SELECT DATE_ADD(attenddate, INTERVAL 1 DAY) into shoutdate;
	else
	set shoutdate = attenddate;
	end if;
		SELECT STR_TO_DATE(concat(attenddate,' ',sh_strt_time),'%Y-%m-%d %H:%i') into shindatetime;
		SELECT STR_TO_DATE(concat(shoutdate,' ',sh_end_time),'%Y-%m-%d %H:%i') into shoutdatetime;
		select TIMEDIFF(shoutdatetime,shindatetime) into worktime;

		set new.s_daily_working_hour=worktime;
		

		
		select date_add(shindatetime,interval sh_gross_strttym minute) into grossindtym;
		select date_add(shoutdatetime,interval sh_gross_endtym minute) into grossoutdtym;

		
		SELECT round((TIME_TO_SEC(actualwork) - TIME_TO_SEC(worktime))/60,2 ) into overtym;
		if overtym < 1 then
		set new.s_overtime="0 minute";
		else
		set new.s_overtime=concat(overtym," minute");
		end if;
		 
	

		select TIMESTAMPDIFF(MINUTE,indatetime,shindatetime) into lin;
		 if lin > 1 then
			
			set new.s_lateIn =concat('-',lin," minute"); 
			set new.s_first_half="P";
		else 
			
			set new.s_lateIn=concat(abs(lin)," minute");  
			select TIMESTAMPDIFF(MINUTE,shindatetime,indatetime) into glin;
			if glin <= sh_gross_strttym then
				set new.s_first_half="P";
			else
				set new.s_first_half="A";
			end if;
			
	end if;
	

	select TIMESTAMPDIFF(MINUTE,outdatetime,shoutdatetime) into eout;
	 if eout > 1 then
		
		set new.s_earlyOut =concat('-',eout," minute"); 
		
		select TIMESTAMPDIFF(MINUTE,outdatetime,shoutdatetime) into geout;
		if geout <= sh_gross_endtym then
			set new.s_scound_half="P";
		else
			set new.s_scound_half="A";
		end if;
	else 
		
		set new.s_earlyOut=concat(abs(eout)," minute");  
		set new.s_scound_half="P";
		 
	end if;
	if new.s_first_half = 'P' and new.s_scound_half= 'P' then
		set new.s_status='P';
	elseif (new.s_first_half = 'P' and new.s_scound_half= 'A') or (new.s_first_half = 'A' and new.s_scound_half= 'P') then
		set new.s_status='HD';
	elseif new.s_first_half = 'A' and new.s_scound_half= 'A' then
		set new.s_status='A';
	end if;
    
elseif  (new.t_signin_time is not null and new.t_signin_time !='' and upper(new.t_signin_time) !='NULL' and new.t_signin_time !='null') then

	SELECT DATE_FORMAT(STR_TO_DATE(new.d_atten_date, '%Y-%m-%d'), '%Y-%m-%d') into 	attenddate;
    SELECT STR_TO_DATE(concat(attenddate,' ',new.t_signin_time),'%Y-%m-%d %H:%i') into indatetime;
	select hour(sh_strt_time) into shinhour;
	SELECT STR_TO_DATE(concat(attenddate,' ',sh_strt_time),'%Y-%m-%d %H:%i') into shindatetime;
	select date_add(shindatetime,interval sh_gross_strttym minute) into grossindtym;
	select TIMESTAMPDIFF(MINUTE,indatetime,shindatetime) into lin; 
		 if lin > 1 then
			
			set new.s_lateIn =concat('-',lin," minute"); 
			set new.s_first_half="P";
		
		else 
			
			set new.s_lateIn=concat(abs(lin)," minute");  
			select TIMESTAMPDIFF(MINUTE,shindatetime,indatetime) into glin;
			if glin <= sh_gross_strttym then
				set new.s_first_half="P";
			else
				set new.s_first_half="A";
			end if;
			
	end if;
end if;


END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tbl_attendance_BEFORE_UPDATE` BEFORE UPDATE ON `tbl_attendance` FOR EACH ROW BEGIN
declare inhour integer(4);
declare outhour integer(4);
declare indatetime varchar(30);
declare outdate varchar(30);
declare outdatetime varchar(30);
declare actualwork varchar (10); 
declare attenddate varchar(30);

declare shiftid varchar(11);
declare shinhour integer(4);
declare shouthour integer(4);
declare sh_strt_time varchar(10);
declare sh_end_time varchar(10);
declare sh_gross_strttym varchar(10);
declare sh_gross_endtym varchar(10);
declare shoutdate varchar(30);
declare shoutdatetime varchar(30);
declare shindatetime varchar(30);
declare worktime varchar (10); 
declare eout integer(10);
declare lin integer(10);
declare glin integer(10);
declare geout integer(10);
declare overtym integer(10);
declare grossindtym varchar(30);
declare grossoutdtym varchar(30);
declare minwork integer(4);

if new.s_status = 'E' THEN
set new.s_status='P';
end If;

if new.t_signin_time is not null and new.t_signin_time !='' and upper(new.t_signin_time) !='NULL' and new.t_signin_time !='null' and new.t_signout_time is not null and new.t_signout_time != '' and upper(new.t_signout_time) !='NULL' and new.t_signout_time !='null' THEN

select hour(new.t_signin_time),hour(new.t_signout_time) into inhour,outhour;

SELECT DATE_FORMAT(STR_TO_DATE(new.d_atten_date, '%Y-%m-%d'), '%Y-%m-%d') into attenddate;
if inhour > 12 and outhour < 12 then
SELECT DATE_ADD(attenddate, INTERVAL 1 DAY) into outdate;
else
set outdate = attenddate;
end if;

SELECT STR_TO_DATE(concat(attenddate,' ',new.t_signin_time),'%Y-%m-%d %H:%i') into indatetime;

SELECT STR_TO_DATE(concat(outdate,' ',new.t_signout_time),'%Y-%m-%d %H:%i') into outdatetime;

select TIMEDIFF(outdatetime,indatetime) into actualwork;
set new.s_actual_working_hour=actualwork;


select n_shift_id into shiftid from tbl_emp_shift where n_emp_shift_id = (select max(n_emp_shift_id) from tbl_emp_shift where s_em_code=new.s_em_code);
if shiftid is not null then

set new.s_shift_id=shiftid;

select t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours into sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym,minwork from tbl_shift where s_shift=shiftid;
else
SELECT t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours into sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym,minwork FROM tbl_shift GROUP BY ABS(Time_to_sec(t_start_time)) ORDER BY MIN(ABS(ABS(Time_to_sec(t_start_time))  - Time_to_sec(new.t_signin_time))) LIMIT 1;
end if;

select hour(sh_strt_time),hour(sh_end_time) into shinhour,shouthour;
if shinhour > 12 and shouthour < 12 then
SELECT DATE_ADD(attenddate, INTERVAL 1 DAY) into shoutdate;
else
set shoutdate = attenddate;
end if;
SELECT STR_TO_DATE(concat(attenddate,' ',sh_strt_time),'%Y-%m-%d %H:%i') into shindatetime;
SELECT STR_TO_DATE(concat(shoutdate,' ',sh_end_time),'%Y-%m-%d %H:%i') into shoutdatetime;
select TIMEDIFF(shoutdatetime,shindatetime) into worktime;

set new.s_daily_working_hour=worktime;



select date_add(shindatetime,interval sh_gross_strttym minute) into grossindtym;
select date_add(shoutdatetime,interval sh_gross_endtym minute) into grossoutdtym;


SELECT round((TIME_TO_SEC(actualwork) - TIME_TO_SEC(worktime))/60,2 ) into overtym;
if overtym < 1 then
set new.s_overtime="0 minute";
else
set new.s_overtime=concat(overtym," minute");
end if;
 


select TIMESTAMPDIFF(MINUTE,indatetime,shindatetime) into lin;
 if lin > 1 then
	
	set new.s_lateIn =concat('-',lin," minute"); 
	set new.s_first_half="P";
else 
	
	set new.s_lateIn=concat(abs(lin)," minute");  
    select TIMESTAMPDIFF(MINUTE,shindatetime,indatetime) into glin;
    if glin <= sh_gross_strttym then
		set new.s_first_half="P";
	else
		set new.s_first_half="A";
    end if;
    
end if;


select TIMESTAMPDIFF(MINUTE,outdatetime,shoutdatetime) into eout;
 if eout > 1 then
	
	set new.s_earlyOut =concat('-',eout," minute"); 
    
    select TIMESTAMPDIFF(MINUTE,outdatetime,shoutdatetime) into geout;
	if geout <= sh_gross_endtym then
		set new.s_scound_half="P";
	else
		set new.s_scound_half="A";
    end if;
else 
	
	set new.s_earlyOut=concat(abs(eout)," minute");  
    set new.s_scound_half="P";
    
    
end if;
if new.s_first_half = 'P' and new.s_scound_half= 'P' then
	set new.s_status='P';
elseif (new.s_first_half = 'P' and new.s_scound_half= 'A') or (new.s_first_half = 'A' and new.s_scound_half= 'P') then
	set new.s_status='HD';
elseif new.s_first_half = 'A' and new.s_scound_half= 'A' then
	set new.s_status='A';
end if;

end if;


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `n_com_id` int(11) NOT NULL,
  `s_type` varchar(45) DEFAULT 'TASK_MASTER',
  `n_task_id` int(11) NOT NULL,
  `s_em_code` varchar(50) DEFAULT NULL,
  `s_comment` text,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`n_com_id`, `s_type`, `n_task_id`, `s_em_code`, `s_comment`, `d_created_datetime`, `d_updated_datetime`) VALUES
(1, 'TASK_MASTER', 17, 'EMP01', 'Enter you commenst s', '2021-09-20 16:48:48', NULL),
(2, 'TASK_MASTER', 19, 'EMP01', 'please eneter the data as per given sheets', '2021-09-20 16:51:47', NULL),
(3, 'TASK_MASTER', 19, 'EMP01', 'oostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya han', '2021-09-20 16:55:02', NULL),
(4, 'TASK_MASTER', 19, 'EMP01', 'fttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo e', '2021-09-20 16:55:31', NULL),
(5, 'TASK_MASTER', 19, 'EMP01', 'ugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plax', '2021-09-21 16:57:00', NULL),
(6, 'TASK_MASTER', 19, 'EMP01', 'cs c cdc ', '2021-09-21 16:57:11', NULL),
(7, 'TASK_MASTER', 19, 'EMP01', 'avfg b', '2021-09-21 17:04:18', NULL),
(8, 'TASK_MASTER', 19, 'EMP01', 'okay fine', '2021-09-21 18:01:03', NULL),
(9, 'TASK_MASTER', 11, 'EMP01', 'sb v  yjmy ujm ', '2021-09-21 18:21:48', NULL),
(10, 'TASK_MASTER', 16, 'EMP01', 'Fhhjj fhhfyy gjgv', '2021-09-20 18:34:29', NULL),
(11, 'TASK_MASTER', 18, 'EMP01', 'ss', '2021-09-22 15:39:57', NULL),
(12, 'TASK_MASTER', 16, 'EMP01', 'sdfn', '2021-09-22 16:27:14', NULL),
(13, 'TASK_MASTER', 18, 'EMP01', 'ok', '2021-10-01 00:15:48', NULL),
(18, 'TASK_MASTER', 1, 'EMP02', 'this is urgent work need to start working on it ', '2021-10-02 12:49:02', NULL),
(19, 'TASK_MASTER', 1, 'EMP01', 'okay ma\'am ', '2021-10-02 13:02:36', NULL),
(20, 'TASK_MASTER', 1, 'EMP02', 'scd c', '2021-10-03 12:36:09', NULL),
(21, 'TASK_MASTER', 1, 'EMP01', 'this is work=ed ir not \'dkbk fv', '2021-10-03 13:03:46', NULL),
(22, 'TASK_MASTER', 3, 'EMP05', 'Okay Ma\'am.', '2021-10-06 08:43:25', NULL),
(23, 'TASK_MASTER', 2, 'EMP05', 'okay ill try my best to complete this as soon as possible ', '2021-10-06 08:44:05', NULL),
(24, 'TASK_MASTER', 3, 'EMP05', ' NO TIMESLOT AV.', '2021-10-06 16:21:50', NULL),
(25, 'TASK_MASTER', 3, 'EMP02', 'OKAY ARRQANG ON NEXT DAY ', '2021-10-06 16:23:32', NULL),
(26, 'TASK_MASTER', 2, 'EMP01', 'klkhl\n', '2021-10-07 15:35:28', NULL),
(27, 'TASK_MASTER', 6, 'EMP02', 'okay \n', '2021-10-13 18:59:09', NULL),
(28, 'TASK_MASTER', 15, 'F/09-10/PJ', 'done . it is done ', '2021-10-25 14:04:59', NULL),
(29, 'TASK_MASTER', 10, 'F/09-10/PJ', 'now remark is working sachin sir', '2021-10-25 14:24:49', NULL),
(30, 'TASK_MASTER', 17, 'ULT0012', 'ok Sir will start it from tomorrow.', '2021-11-12 10:47:50', NULL),
(31, 'TASK_MASTER', 17, 'emp0123', 'please make it quick', '2021-11-12 11:23:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `n_dep_id` int(11) NOT NULL,
  `s_dep_name` varchar(64) NOT NULL,
  `s_dep_head` varchar(64) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`n_dep_id`, `s_dep_name`, `s_dep_head`, `d_created_datetime`, `d_updated_datetime`, `s_created_by`, `s_updated_by`) VALUES
(6, 'PRO003', 'F/09-10/PJ', '2021-08-31 21:44:40', '2021-10-19 14:54:41', 'ROHAN.PATIL@APPONEXT.COM', 'ADM04'),
(7, 'QAD006', 'NONE', '2021-10-12 15:31:41', '2021-10-18 19:17:51', 'ADM04', 'ADM04'),
(10, 'ACC013', 'NONE', '2021-10-18 19:20:44', '2021-10-18 19:20:44', 'ADM04', NULL),
(11, 'SAL001', 'NONE', '2021-10-18 19:20:56', '2021-10-18 19:20:56', 'ADM04', NULL),
(12, 'LOG004', 'NONE', '2021-10-18 19:21:08', '2021-10-18 19:21:08', 'ADM04', NULL),
(13, 'HRD011', 'F/12-13/SM', '2021-10-18 19:21:25', '2021-10-25 11:54:14', 'ADM04', 'ADM04'),
(14, 'QUA007', 'NONE', '2021-10-18 19:21:43', '2021-10-18 19:21:43', 'ADM04', NULL),
(15, 'PUR002', 'NONE', '2021-10-18 19:21:53', '2021-10-18 19:21:53', 'ADM04', NULL),
(16, 'PRJ010', 'NONE', '2021-10-18 19:22:02', '2021-10-18 19:22:02', 'ADM04', NULL),
(17, 'STO005', 'NONE', '2021-10-18 19:22:11', '2021-10-18 19:22:11', 'ADM04', NULL),
(18, 'DES012', 'NONE', '2021-10-18 19:22:34', '2021-10-18 19:22:34', 'ADM04', NULL),
(19, 'REA009', 'NONE', '2021-10-18 19:23:21', '2021-10-18 19:23:21', 'ADM04', NULL),
(20, 'REG008', 'NONE', '2021-10-18 19:58:39', '2021-10-18 19:58:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `n_id` int(11) NOT NULL,
  `n_location_id` int(11) DEFAULT '0',
  `s_em_code` varchar(64) NOT NULL,
  `s_designation` varchar(150) DEFAULT NULL,
  `n_dep_id` int(11) DEFAULT NULL,
  `s_first_name` varchar(128) DEFAULT NULL,
  `s_middle_name` varchar(128) DEFAULT NULL,
  `s_last_name` varchar(128) DEFAULT NULL,
  `s_em_email` varchar(64) DEFAULT NULL,
  `s_em_password` varchar(512) NOT NULL,
  `s_em_role` enum('ADMIN','EMPLOYEE','SUPER ADMIN') NOT NULL DEFAULT 'EMPLOYEE',
  `s_em_address` varchar(512) DEFAULT NULL,
  `n_status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `s_em_gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `s_em_phone` varchar(64) DEFAULT NULL,
  `s_em_birthday` varchar(128) DEFAULT NULL,
  `s_em_blood_group` enum('NA','O+','O-','A+','A-','B+','B-','AB+','AB-') DEFAULT NULL,
  `d_em_joining_date` varchar(128) DEFAULT NULL,
  `s_em_image` varchar(128) DEFAULT NULL,
  `s_em_age` int(11) DEFAULT NULL,
  `s_em_pan` varchar(15) DEFAULT NULL,
  `s_em_adhar` varchar(15) DEFAULT NULL,
  `s_em_pf_no` varchar(20) DEFAULT NULL,
  `s_em_marital_status` varchar(20) DEFAULT NULL,
  `s_em_reporting1` varchar(64) NOT NULL DEFAULT '-',
  `s_em_reporting2` varchar(65) NOT NULL DEFAULT '-',
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_system_admin` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`n_id`, `n_location_id`, `s_em_code`, `s_designation`, `n_dep_id`, `s_first_name`, `s_middle_name`, `s_last_name`, `s_em_email`, `s_em_password`, `s_em_role`, `s_em_address`, `n_status`, `s_em_gender`, `s_em_phone`, `s_em_birthday`, `s_em_blood_group`, `d_em_joining_date`, `s_em_image`, `s_em_age`, `s_em_pan`, `s_em_adhar`, `s_em_pf_no`, `s_em_marital_status`, `s_em_reporting1`, `s_em_reporting2`, `d_created_datetime`, `d_updated_datetime`, `s_system_admin`) VALUES
(1, 0, 'ADM04', '2', 4, 'System', '', 'Admin', 'noreply@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'ADMIN', '-', 'ACTIVE', 'Male', '9078563412', '26-10-1994', 'O+', NULL, '../assets/img/avatars/1638182626134-logo.png', 26, 'OPI7856FTF', '45670987455666', '123UGRER', 'UNMARIED', '', '', '2021-08-26 16:59:01', '2021-11-29 16:13:46', 1),
(46, 1, 'O/92-93/RB', 'CMD', 0, 'Rishi ', '', 'Bhatia', 'info@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'ADMIN', '', 'ACTIVE', 'Male', '', '', '', '2002-06-20', '../assets/img/avatars/1634569344666-admin.PNG', NULL, '', '', '', NULL, 'ADM04', '', '2021-10-18 19:55:10', '2022-01-14 12:02:38', 0),
(47, NULL, 'O/20-21/AB', NULL, NULL, 'Alok Bhatia', '', '', 'ab@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'ADMIN', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, '../assets/img/avatars/1634569386710-admin.PNG', NULL, NULL, NULL, NULL, NULL, '', '', '2021-10-18 19:55:10', '2021-10-18 20:33:06', 0),
(48, NULL, 'F/01-02/MT', NULL, NULL, 'Manoj Thakur', '', '', 'mythakur@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'ADMIN', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, '../assets/img/avatars/1634569416494-admin.PNG', NULL, NULL, NULL, NULL, NULL, '', '', '2021-10-18 19:55:10', '2021-10-18 20:33:36', 0),
(49, 2, 'F/07-08/SP', 'MANAGER - QA', 7, 'Swapnali ', '', 'Patil', 'qad@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', '', 'ACTIVE', 'Male', '', '', '', '2002-01-01', NULL, NULL, '', '', '', NULL, 'F/01-02/MT', 'O/92-93/RB', '2021-10-18 19:55:10', '2022-01-14 12:03:57', 0),
(50, 2, 'F/03-04/NK', NULL, 6, 'Nirmal Kumar', '', '', 'plant@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(51, 2, 'F/05-06/MA', 'PM', 6, 'Mahesh', '', 'Afzalpurkar', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', '', 'ACTIVE', 'Male', '', '', 'O+', '2005-05-11', NULL, NULL, '', '', '', NULL, 'F/03-04/NK', 'F/07-08/SP', '2021-10-18 19:55:10', '2021-11-22 11:33:48', 0),
(52, 2, 'F/97-98/DB', NULL, 6, 'Devi Prasad Bhatt', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(53, 2, 'F/08-09/AA', NULL, 6, 'Arun Ambdoskar', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(54, 2, 'F/09-10/PJ', NULL, 6, 'Pravin Jogale', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, '../assets/img/avatars/1634635894610-boy1.jpg', NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-19 15:01:34', 0),
(55, 2, 'F/09-10/PD', NULL, 6, 'Pravin Dhongade', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(56, 2, 'F/98-99/PS', NULL, 6, 'P. K. Singh', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(57, 2, 'F/09-10/RD', NULL, 6, 'Rakesh Dhongade', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(58, 1, 'O/11-12/RB', NULL, 10, 'Ruchi Bigharia ', '', '', 'accounts@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/92-93/RB', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(59, 1, 'O/01-02/RB', NULL, 11, 'Rajwant Kaur Bajwa', '', '', 'bdm@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/92-93/RB', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(60, 2, 'O/03-04/SG', NULL, 12, 'Santosh Gaikwad', '', '', 'logistics@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(61, 1, 'O/08-09/HS', NULL, 13, 'Harichandra Panduran Shingre', '', '', 'admin2@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/08-09/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(62, 2, 'O/08-09/SP', 'HR & Admin Manager', 13, 'Shruti', '', ' Patil', 'hrd@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', '', 'ACTIVE', 'Female', '', '', '', '2008-11-03', NULL, NULL, '', '', '', NULL, 'O/92-93/RB', '', '2021-10-18 19:55:10', '2022-01-11 15:07:17', 0),
(63, 1, 'O/09-10/DM', NULL, 13, 'Dinesh Kumar Mahato', '', '', 'admin2@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/08-09/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(64, 2, 'F/11-12/GP', NULL, 14, 'Girish Patil', '', '', 'quality@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(65, 2, 'O/11-12/RL', NULL, 15, 'Rakesh Lad', '', '', 'purchase@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(66, 2, 'F/12-13/RK', NULL, 16, 'Rajesh Korgaonkar', '', '', 'technical@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(67, 2, 'F/12-13/SM', NULL, 17, 'Sandeep Mhatre', '', '', 'stores@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(68, 2, 'F/13-14/RG', NULL, 14, 'RAHUL GAWAND', '', '', 'quality@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(69, 2, 'F/13-14/KT', NULL, 14, 'KAILAS THOMBRE', '', '', 'quality@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(70, 2, 'F/14-15/JK', NULL, 6, 'JANARDHAN KAWADE', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(71, 1, 'O/15-16/JK', NULL, 11, 'JIDNYASA KEDARE', '', '', 'sales2@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/01-02/RB', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(72, 2, 'O/16-17/SP', NULL, 18, 'SUSHANT PAWAR', '', '', 'designs@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(73, 2, 'F/19-20/VM', NULL, 16, 'VISHWANATH MAINKAR', '', '', 'projects@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(74, 2, 'F/19-20/AU', NULL, 14, 'AMOL ULVEKAR', '', '', 'quality@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(75, 2, 'F/19-20/NC', NULL, 16, 'NAVIN CHAVAN', '', '', 'projects@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(76, 2, 'F/16-17/PR', NULL, 16, 'PRITAM RANSHINGE', '', '', 'projects@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(77, 2, 'F/20-21/SB', NULL, 19, 'SURAJ BELOSHE', '', '', 'research@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(78, 2, 'F/20-21/NP', NULL, 16, 'NILESH PAWAR', '', '', 'projects@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(79, 2, 'F/21-22/MP', NULL, 20, 'MRUNMAYEE PARAB', '', '', 'regulatory2@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(80, 2, 'F/21-22/VN', NULL, 14, 'VAISHALI NARAWADE', '', '', 'qad2@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(81, 2, 'F/21-22/SJ', NULL, 20, 'SNEHAL SACHIN JADHAV', '', '', 'regulatory3@ultratechinidia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(82, 2, 'F/21-22/VT', NULL, 19, 'VIKAS TIWARI', '', '', 'research@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(83, 2, 'F/21-22/S', NULL, 16, 'SUKHLAL', '', '', 'projects@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(84, 2, 'F/21-22/KK', NULL, 19, 'KRISHNA KHARAT', '', '', 'research@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(85, 2, 'F/21-22/PD', NULL, 6, 'PRAVIN DISALE', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0),
(86, 2, 'F/21-22/D', NULL, 6, 'DASHRATH PASWAN', '', '', 'production@ultratechindia.com', '202cb962ac59075b964b07152d234b70', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:55:10', '2021-10-18 20:01:32', 0);

--
-- Triggers `tbl_employee`
--
DELIMITER $$
CREATE TRIGGER `tbl_employee_AFTER_DELETE` AFTER DELETE ON `tbl_employee` FOR EACH ROW BEGIN

delete from tbl_emp_shift where s_em_code = old.s_em_code;
delete from tbl_assign_leave where s_em_code = old.s_em_code;


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_upload_csv`
--

CREATE TABLE `tbl_employee_upload_csv` (
  `n_id` int(11) NOT NULL,
  `n_location_id` varchar(64) DEFAULT '0',
  `s_em_code` varchar(64) NOT NULL,
  `s_designation` varchar(150) DEFAULT NULL,
  `n_dep_id` varchar(64) DEFAULT NULL,
  `s_first_name` varchar(128) DEFAULT NULL,
  `s_middle_name` varchar(128) DEFAULT NULL,
  `s_last_name` varchar(128) DEFAULT NULL,
  `s_em_email` varchar(64) DEFAULT NULL,
  `s_em_password` varchar(512) NOT NULL,
  `s_em_role` varchar(64) NOT NULL DEFAULT 'EMPLOYEE',
  `s_em_address` varchar(512) DEFAULT NULL,
  `n_status` varchar(64) NOT NULL DEFAULT 'ACTIVE',
  `s_em_gender` varchar(64) NOT NULL DEFAULT 'Male',
  `s_em_phone` varchar(64) DEFAULT NULL,
  `s_em_birthday` varchar(128) DEFAULT NULL,
  `s_em_blood_group` varchar(64) DEFAULT NULL,
  `d_em_joining_date` varchar(128) DEFAULT NULL,
  `s_em_image` varchar(128) DEFAULT NULL,
  `s_em_age` varchar(64) DEFAULT NULL,
  `s_em_pan` varchar(15) DEFAULT NULL,
  `s_em_adhar` varchar(15) DEFAULT NULL,
  `s_em_pf_no` varchar(20) DEFAULT NULL,
  `s_em_marital_status` varchar(20) DEFAULT NULL,
  `s_em_reporting1` varchar(64) NOT NULL DEFAULT '-',
  `s_em_reporting2` varchar(65) NOT NULL DEFAULT '-',
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_employee_upload_csv`
--

INSERT INTO `tbl_employee_upload_csv` (`n_id`, `n_location_id`, `s_em_code`, `s_designation`, `n_dep_id`, `s_first_name`, `s_middle_name`, `s_last_name`, `s_em_email`, `s_em_password`, `s_em_role`, `s_em_address`, `n_status`, `s_em_gender`, `s_em_phone`, `s_em_birthday`, `s_em_blood_group`, `d_em_joining_date`, `s_em_image`, `s_em_age`, `s_em_pan`, `s_em_adhar`, `s_em_pf_no`, `s_em_marital_status`, `s_em_reporting1`, `s_em_reporting2`, `d_created_datetime`, `d_updated_datetime`) VALUES
(136, '', 'O/92-93/RB', NULL, '', 'Rishi Bhatia', '', '', '', '', 'ADMIN', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(137, '', 'O/20-21/AB', NULL, '', 'Alok Bhatia', '', '', 'ab@ultratechindia.com', '', 'ADMIN', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(138, '', 'F/01-02/MT', NULL, '', 'Manoj Thakur', '', '', 'mythakur@ultratechindia.com', '', 'ADMIN', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(139, 'Taloja', 'F/07-08/SP', NULL, 'QAD006', 'Swapnali Patil', '', '', 'qad@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(140, 'Taloja', 'F/03-04/NK', NULL, 'PRO003', 'Nirmal Kumar', '', '', 'plant@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(141, 'Taloja', 'F/05-06/MA', NULL, 'PRO003', 'Mahesh Afzalpurkar', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(142, 'Taloja', 'F/97-98/DB', NULL, 'PRO003', 'Devi Prasad Bhatt', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(143, 'Taloja', 'F/08-09/AA', NULL, 'PRO003', 'Arun Ambdoskar', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(144, 'Taloja', 'F/09-10/PJ', NULL, 'PRO003', 'Pravin Jogale', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(145, 'Taloja', 'F/09-10/PD', NULL, 'PRO003', 'Pravin Dhongade', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(146, 'Taloja', 'F/98-99/PS', NULL, 'PRO003', 'P. K. Singh', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(147, 'Taloja', 'F/09-10/RD', NULL, 'PRO003', 'Rakesh Dhongade', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(148, 'Vashi', 'O/11-12/RB', NULL, 'ACC013', 'Ruchi Bigharia ', '', '', 'accounts@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/92-93/RB', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(149, 'Vashi', 'O/01-02/RB', NULL, 'SAL001', 'Rajwant Kaur Bajwa', '', '', 'bdm@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/92-93/RB', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(150, 'Taloja', 'O/03-04/SG', NULL, 'LOG004', 'Santosh Gaikwad', '', '', 'logistics@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(151, 'Vashi', 'O/08-09/HS', NULL, 'HRD011', 'Harichandra Panduran Shingre', '', '', 'admin2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/08-09/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(152, 'Taloja', 'O/08-09/SP', NULL, 'HRD011', 'Shruti Patil', '', '', 'hrd@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/92-93/RB', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(153, 'Vashi', 'O/09-10/DM', NULL, 'HRD011', 'Dinesh Kumar Mahato', '', '', 'admin2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/08-09/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(154, 'Taloja', 'F/11-12/GP', NULL, 'QUA007', 'Girish Patil', '', '', 'quality@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(155, 'Taloja', 'O/11-12/RL', NULL, 'PUR002', 'Rakesh Lad', '', '', 'purchase@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(156, 'Taloja', 'F/12-13/RK', NULL, 'PRJ010', 'Rajesh Korgaonkar', '', '', 'technical@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(157, 'Taloja', 'F/12-13/SM', NULL, 'STO005', 'Sandeep Mhatre', '', '', 'stores@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(158, 'Taloja', 'F/13-14/RG', NULL, 'QUA007', 'RAHUL GAWAND', '', '', 'quality@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(159, 'Taloja', 'F/13-14/KT', NULL, 'QUA007', 'KAILAS THOMBRE', '', '', 'quality@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(160, 'Taloja', 'F/14-15/JK', NULL, 'PRO003', 'JANARDHAN KAWADE', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(161, 'Vashi', 'O/15-16/JK', NULL, 'SAL001', 'JIDNYASA KEDARE', '', '', 'sales2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/01-02/RB', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(162, 'Taloja', 'O/16-17/SP', NULL, 'DES012', 'SUSHANT PAWAR', '', '', 'designs@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(163, 'Taloja', 'F/19-20/VM', NULL, 'PRJ010', 'VISHWANATH MAINKAR', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(164, 'Taloja', 'F/19-20/AU', NULL, 'QUA007', 'AMOL ULVEKAR', '', '', 'quality@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(165, 'Taloja', 'F/19-20/NC', NULL, 'PRJ010', 'NAVIN CHAVAN', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(166, 'Taloja', 'F/16-17/PR', NULL, 'PRJ010', 'PRITAM RANSHINGE', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(167, 'Taloja', 'F/20-21/SB', NULL, 'REA009', 'SURAJ BELOSHE', '', '', 'research@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(168, 'Taloja', 'F/20-21/NP', NULL, 'PRJ010', 'NILESH PAWAR', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(169, 'Taloja', 'F/21-22/MP', NULL, 'REG008', 'MRUNMAYEE PARAB', '', '', 'regulatory2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(170, 'Taloja', 'F/21-22/VN', NULL, 'QUA007', 'VAISHALI NARAWADE', '', '', 'qad2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(171, 'Taloja', 'F/21-22/SJ', NULL, 'REG008', 'SNEHAL SACHIN JADHAV', '', '', 'regulatory3@ultratechinidia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(172, 'Taloja', 'F/21-22/VT', NULL, 'REA009', 'VIKAS TIWARI', '', '', 'research@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(173, 'Taloja', 'F/21-22/S', NULL, 'PRJ010', 'SUKHLAL', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(174, 'Taloja', 'F/21-22/KK', NULL, 'REA009', 'KRISHNA KHARAT', '', '', 'research@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(175, 'Taloja', 'F/21-22/PD', NULL, 'PRO003', 'PRAVIN DISALE', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(176, 'Taloja', 'F/21-22/D', NULL, 'PRO003', 'DASHRATH PASWAN', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:57:48', '2021-10-18 19:57:48'),
(180, '', 'O/92-93/RB', NULL, '', 'Rishi Bhatia', '', '', '', '', 'ADMIN', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(181, '', 'O/20-21/AB', NULL, '', 'Alok Bhatia', '', '', 'ab@ultratechindia.com', '', 'ADMIN', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(182, '', 'F/01-02/MT', NULL, '', 'Manoj Thakur', '', '', 'mythakur@ultratechindia.com', '', 'ADMIN', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(183, 'Taloja', 'F/07-08/SP', NULL, 'QAD006', 'Swapnali Patil', '', '', 'qad@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(184, 'Taloja', 'F/03-04/NK', NULL, 'PRO003', 'Nirmal Kumar', '', '', 'plant@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(185, 'Taloja', 'F/05-06/MA', NULL, 'PRO003', 'Mahesh Afzalpurkar', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(186, 'Taloja', 'F/97-98/DB', NULL, 'PRO003', 'Devi Prasad Bhatt', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(187, 'Taloja', 'F/08-09/AA', NULL, 'PRO003', 'Arun Ambdoskar', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(188, 'Taloja', 'F/09-10/PJ', NULL, 'PRO003', 'Pravin Jogale', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(189, 'Taloja', 'F/09-10/PD', NULL, 'PRO003', 'Pravin Dhongade', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(190, 'Taloja', 'F/98-99/PS', NULL, 'PRO003', 'P. K. Singh', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(191, 'Taloja', 'F/09-10/RD', NULL, 'PRO003', 'Rakesh Dhongade', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(192, 'Vashi', 'O/11-12/RB', NULL, 'ACC013', 'Ruchi Bigharia ', '', '', 'accounts@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/92-93/RB', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(193, 'Vashi', 'O/01-02/RB', NULL, 'SAL001', 'Rajwant Kaur Bajwa', '', '', 'bdm@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/92-93/RB', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(194, 'Taloja', 'O/03-04/SG', NULL, 'LOG004', 'Santosh Gaikwad', '', '', 'logistics@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(195, 'Vashi', 'O/08-09/HS', NULL, 'HRD011', 'Harichandra Panduran Shingre', '', '', 'admin2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/08-09/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(196, 'Taloja', 'O/08-09/SP', NULL, 'HRD011', 'Shruti Patil', '', '', 'hrd@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/92-93/RB', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(197, 'Vashi', 'O/09-10/DM', NULL, 'HRD011', 'Dinesh Kumar Mahato', '', '', 'admin2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/08-09/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(198, 'Taloja', 'F/11-12/GP', NULL, 'QUA007', 'Girish Patil', '', '', 'quality@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(199, 'Taloja', 'O/11-12/RL', NULL, 'PUR002', 'Rakesh Lad', '', '', 'purchase@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(200, 'Taloja', 'F/12-13/RK', NULL, 'PRJ010', 'Rajesh Korgaonkar', '', '', 'technical@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(201, 'Taloja', 'F/12-13/SM', NULL, 'STO005', 'Sandeep Mhatre', '', '', 'stores@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(202, 'Taloja', 'F/13-14/RG', NULL, 'QUA007', 'RAHUL GAWAND', '', '', 'quality@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(203, 'Taloja', 'F/13-14/KT', NULL, 'QUA007', 'KAILAS THOMBRE', '', '', 'quality@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(204, 'Taloja', 'F/14-15/JK', NULL, 'PRO003', 'JANARDHAN KAWADE', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(205, 'Vashi', 'O/15-16/JK', NULL, 'SAL001', 'JIDNYASA KEDARE', '', '', 'sales2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O/01-02/RB', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(206, 'Taloja', 'O/16-17/SP', NULL, 'DES012', 'SUSHANT PAWAR', '', '', 'designs@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(207, 'Taloja', 'F/19-20/VM', NULL, 'PRJ010', 'VISHWANATH MAINKAR', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(208, 'Taloja', 'F/19-20/AU', NULL, 'QUA007', 'AMOL ULVEKAR', '', '', 'quality@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(209, 'Taloja', 'F/19-20/NC', NULL, 'PRJ010', 'NAVIN CHAVAN', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(210, 'Taloja', 'F/16-17/PR', NULL, 'PRJ010', 'PRITAM RANSHINGE', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(211, 'Taloja', 'F/20-21/SB', NULL, 'REA009', 'SURAJ BELOSHE', '', '', 'research@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(212, 'Taloja', 'F/20-21/NP', NULL, 'PRJ010', 'NILESH PAWAR', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(213, 'Taloja', 'F/21-22/MP', NULL, 'REG008', 'MRUNMAYEE PARAB', '', '', 'regulatory2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(214, 'Taloja', 'F/21-22/VN', NULL, 'QUA007', 'VAISHALI NARAWADE', '', '', 'qad2@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(215, 'Taloja', 'F/21-22/SJ', NULL, 'REG008', 'SNEHAL SACHIN JADHAV', '', '', 'regulatory3@ultratechinidia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/07-08/SP', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(216, 'Taloja', 'F/21-22/VT', NULL, 'REA009', 'VIKAS TIWARI', '', '', 'research@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(217, 'Taloja', 'F/21-22/S', NULL, 'PRJ010', 'SUKHLAL', '', '', 'projects@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(218, 'Taloja', 'F/21-22/KK', NULL, 'REA009', 'KRISHNA KHARAT', '', '', 'research@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/12-13/RK', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(219, 'Taloja', 'F/21-22/PD', NULL, 'PRO003', 'PRAVIN DISALE', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46'),
(220, 'Taloja', 'F/21-22/D', NULL, 'PRO003', 'DASHRATH PASWAN', '', '', 'production@ultratechindia.com', '', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'F/01-02/MT', '', '2021-10-18 19:58:46', '2021-10-18 19:58:46');

--
-- Triggers `tbl_employee_upload_csv`
--
DELIMITER $$
CREATE TRIGGER `tbl_employee_upload_csv_AFTER_INSERT` AFTER INSERT ON `tbl_employee_upload_csv` FOR EACH ROW BEGIN

declare dep_id int;
declare loc_id int;
declare emp_cnt int;
SELECT n_dep_id into dep_id FROM tbl_department where s_dep_name = new.n_dep_id;
SELECT n_location_id into loc_id FROM tbl_location_master where s_location_name = new.n_location_id;

select count(*) into emp_cnt from tbl_employee where s_em_code = new.s_em_code;

if emp_cnt = 0 then
	INSERT INTO  `tbl_employee`(`n_location_id`,`s_em_code`,`s_designation`,`n_dep_id`,`s_first_name`,`s_middle_name`,`s_last_name`, `s_em_email`,`s_em_role`,`s_em_address`,`n_status`,`s_em_gender`,`s_em_phone`,`s_em_birthday`,`s_em_blood_group`,`d_em_joining_date`,`s_em_image`,`s_em_age`,`s_em_pan`,`s_em_adhar`,`s_em_pf_no`,`s_em_marital_status`,`s_em_reporting1`,`s_em_reporting2`)
	VALUES (loc_id,new.s_em_code,new.s_designation,dep_id,new.`s_first_name`,new.`s_middle_name`,new.`s_last_name`, new.`s_em_email`,new.`s_em_role`,new.`s_em_address`,new.`n_status`,new.`s_em_gender`,new.`s_em_phone`,new.`s_em_birthday`,new.`s_em_blood_group`,new.`d_em_joining_date`,new.`s_em_image`,new.`s_em_age`,new.`s_em_pan`,new.`s_em_adhar`,new.`s_em_pf_no`,new.`s_em_marital_status`,new.`s_em_reporting1`,new.`s_em_reporting2`);
else 
	update tbl_employee set n_location_id=loc_id,s_designation=new.s_designation,n_dep_id=dep_id   where s_em_code = new.s_em_code;
end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_emp_shift`
--

CREATE TABLE `tbl_emp_shift` (
  `n_emp_shift_id` int(11) NOT NULL,
  `s_em_code` varchar(65) NOT NULL,
  `n_shift_id` varchar(30) NOT NULL,
  `d_start_date` varchar(20) NOT NULL,
  `d_end_date` varchar(20) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_emp_shift`
--

INSERT INTO `tbl_emp_shift` (`n_emp_shift_id`, `s_em_code`, `n_shift_id`, `d_start_date`, `d_end_date`, `d_created_datetime`, `d_updated_datetime`) VALUES
(1, 'F/09-10/PJ', 'A', '2021-10-01', '2022-01-01', '2021-10-19 15:17:10', '2021-10-19 15:17:10'),
(4, 'F/07-08/SP', 'A', '2021-10-25', '2021-10-31', '2021-10-25 14:59:43', '2021-10-25 14:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_holiday`
--

CREATE TABLE `tbl_holiday` (
  `n_id` int(11) NOT NULL,
  `n_location_id` int(11) DEFAULT NULL,
  `s_holiday_name` varchar(256) DEFAULT NULL,
  `d_from_date` varchar(64) DEFAULT NULL,
  `d_to_date` varchar(64) DEFAULT NULL,
  `n_number_of_days` varchar(64) DEFAULT NULL,
  `f_year` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_holiday`
--

INSERT INTO `tbl_holiday` (`n_id`, `n_location_id`, `s_holiday_name`, `d_from_date`, `d_to_date`, `n_number_of_days`, `f_year`) VALUES
(1, 1, 'Gandhi Jayanti', '2021-10-02', '2021-09-02', '1', '2021'),
(2, 2, 'Manin fen vr', '2021-10-22', '2021-10-30', '2', '2021'),
(3, NULL, 'christmas', '2021-12-25', '2021-12-25', '1', '2021');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leave_transaction`
--

CREATE TABLE `tbl_leave_transaction` (
  `n_emp_leave_id` int(11) NOT NULL,
  `s_em_code` varchar(64) DEFAULT NULL,
  `n_type_id` int(11) NOT NULL,
  `s_leave_type` varchar(64) DEFAULT NULL,
  `d_start_date` varchar(64) DEFAULT NULL,
  `d_end_date` varchar(64) DEFAULT NULL,
  `d_leave_duration` varchar(10) DEFAULT NULL,
  `d_apply_date` varchar(64) DEFAULT NULL,
  `s_reason` varchar(1024) DEFAULT NULL,
  `s_leave_status` enum('Approved','Not Approve','Rejected') NOT NULL DEFAULT 'Not Approve',
  `s_em_approver` varchar(65) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_leave_transaction`
--

INSERT INTO `tbl_leave_transaction` (`n_emp_leave_id`, `s_em_code`, `n_type_id`, `s_leave_type`, `d_start_date`, `d_end_date`, `d_leave_duration`, `d_apply_date`, `s_reason`, `s_leave_status`, `s_em_approver`, `d_created_datetime`, `d_updated_datetime`, `s_created_by`, `s_updated_by`) VALUES
(24, 'F/09-10/PJ', 1, 'FULL DAY', '2021-10-21', '', '1', '2021-10-20', 'C EF EF REFRE', 'Not Approve', 'F/01-02/MT', '2021-10-20 16:28:25', '2021-10-20 16:28:25', 'F/09-10/PJ', NULL),
(25, 'emp2948', 1, 'ABOVE A DAY', '2021-10-24', '2021-10-25', '2', '2021-10-23', 'felling sick ', 'Rejected', 'F/05-06/MA', '2021-10-23 13:50:27', '2021-10-23 13:55:34', 'emp2948', 'F/05-06/MA'),
(26, 'emp2948', 1, 'ABOVE A DAY', '2021-10-24', '2021-10-25', '2', '2021-10-23', 'sick leave', 'Approved', 'F/05-06/MA', '2021-10-23 15:04:54', '2021-10-23 15:05:41', 'emp2948', 'F/05-06/MA'),
(27, 'Emp234', 2, 'FULL DAY', '2021-10-29', '', '1', '2021-10-25', 'sick not feeling well', 'Approved', 'F/07-08/SP', '2021-10-25 13:12:08', '2021-10-25 13:17:11', 'Emp234', 'F/07-08/SP'),
(28, 'F/09-10/PJ', 1, 'ABOVE A DAY', '2021-10-29', '2021-10-31', '3', '2021-10-25', 'gju gvyti  yugu iu', 'Not Approve', 'F/01-02/MT', '2021-10-25 13:31:05', '2021-10-25 13:31:05', 'F/09-10/PJ', NULL),
(29, 'Emp234', 2, 'FULL DAY', '2021-10-26', '', '1', '2021-10-25', 'not feeling well . djskas', 'Approved', 'F/09-10/PJ', '2021-10-25 13:32:54', '2021-10-25 13:34:08', 'Emp234', 'F/09-10/PJ'),
(30, 'emp0123', 2, 'ABOVE A DAY', '2021-10-26', '2021-10-28', '3', '2021-10-26', 'vacation for diwali', 'Rejected', 'F/07-08/SP', '2021-10-26 11:57:26', '2021-10-26 11:58:11', 'emp0123', 'F/07-08/SP'),
(31, 'F/07-08/SP', 1, 'FULL DAY', '2021-10-29', '', '1', '2021-10-28', 'gdf dfhdg ', 'Not Approve', 'F/01-02/MT', '2021-10-28 15:10:13', '2021-10-28 15:10:13', 'ADM04', NULL),
(32, 'ULT0012', 1, 'ABOVE A DAY', '2021-11-12', '2021-11-13', '2', '2021-11-11', 'sick leave ', 'Approved', 'emp0123', '2021-11-11 17:54:24', '2021-11-11 17:56:43', 'ULT0012', 'emp0123'),
(33, 'ULT0012', 2, '1 HALF', '2021-11-13', '', '0.5', '2021-11-12', 'going to bank for ACCOUNT OPENING', 'Approved', 'emp0123', '2021-11-12 10:37:04', '2021-11-12 10:39:36', 'ULT0012', 'emp0123');

--
-- Triggers `tbl_leave_transaction`
--
DELIMITER $$
CREATE TRIGGER `tbl_leave_transaction_AFTER_UPDATE` AFTER UPDATE ON `tbl_leave_transaction` FOR EACH ROW BEGIN
declare em_code varchar(100);
declare type_id  int(11);
declare assiged_days  varchar(10);
declare consumed_days  varchar(10);
declare dateyear  varchar(20);
declare consumed_cal decimal(5,2);
select  s_em_code,n_type_id,n_assiged_days,n_consumed_days,f_dateyear into  em_code,type_id,assiged_days,consumed_days,dateyear from tbl_assign_leave where s_em_code=new.s_em_code and n_type_id=new.n_type_id and f_dateyear=current_fisical_year();

if new.s_leave_status = 'Approved' then
set consumed_cal =  CAST(consumed_days  as decimal(5,2)) +  CAST(new.d_leave_duration  as decimal(5,2));
UPDATE tbl_assign_leave 
SET 
    n_consumed_days = consumed_cal
WHERE
    s_em_code = new.s_em_code
        AND n_type_id = new.n_type_id
        AND f_dateyear = CURRENT_FISICAL_YEAR();
end if;


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leave_types`
--

CREATE TABLE `tbl_leave_types` (
  `n_type_id` int(11) NOT NULL,
  `s_name` varchar(64) NOT NULL,
  `n_leave_day` varchar(255) NOT NULL,
  `n_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_leave_types`
--

INSERT INTO `tbl_leave_types` (`n_type_id`, `s_name`, `n_leave_day`, `n_status`) VALUES
(1, 'FACTORY', '26', 1),
(2, 'OFFICE', '24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location_master`
--

CREATE TABLE `tbl_location_master` (
  `n_location_id` int(11) NOT NULL,
  `s_location_name` varchar(100) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_location_master`
--

INSERT INTO `tbl_location_master` (`n_location_id`, `s_location_name`, `d_created_date`, `d_updated_date`) VALUES
(1, 'Vashi', '2021-09-28 15:53:33', NULL),
(2, 'Taloja', '2021-09-28 15:53:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shift`
--

CREATE TABLE `tbl_shift` (
  `n_shift_id` int(11) NOT NULL,
  `s_shift` varchar(30) DEFAULT NULL,
  `s_shift_desc` varchar(30) DEFAULT NULL,
  `t_start_time` varchar(20) DEFAULT NULL,
  `t_end_time` varchar(20) DEFAULT NULL,
  `s_gross_start_time` varchar(20) DEFAULT NULL,
  `s_gross_end_time` varchar(20) DEFAULT NULL,
  `s_min_work_hours` int(11) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_shift`
--

INSERT INTO `tbl_shift` (`n_shift_id`, `s_shift`, `s_shift_desc`, `t_start_time`, `t_end_time`, `s_gross_start_time`, `s_gross_end_time`, `s_min_work_hours`, `d_created_datetime`, `d_updated_datetime`) VALUES
(1, 'A', 'SHIFT A', '09:30', '18:30', '15', '15', 4, '2021-08-26 16:44:48', '2021-10-18 20:20:03'),
(2, 'T-FS', 'TALOJA-FS', '07:00', '15:00', '15', '15', 4, '2021-08-26 16:44:48', '2021-10-18 20:23:06'),
(8, 'T-SS', 'TALOJA-SS', '15:00', '23:00', '15', '15', 4, '2021-10-18 20:24:46', '2021-10-18 20:24:46'),
(9, 'T-TS', 'TALOJA-TS', '23:00', '07:00', '15', '15', 4, '2021-10-18 20:24:47', '2021-10-18 20:25:17'),
(10, 'General', 'Staff Shift', '09:00', '17:30', '15', '60', 8, '2022-01-11 15:08:47', '2022-01-11 15:08:47'),
(11, 'General', 'Staff Shift', '09:00', '17:30', '15', '60', 8, '2022-01-11 15:08:48', '2022-01-11 15:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task_header`
--

CREATE TABLE `tbl_task_header` (
  `n_task_id` int(11) NOT NULL,
  `n_dep_id` int(11) DEFAULT NULL,
  `d_start_date` varchar(64) DEFAULT NULL,
  `d_due_date` varchar(64) DEFAULT NULL,
  `s_task_name` varchar(500) DEFAULT NULL,
  `s_task_desc` varchar(2000) DEFAULT NULL,
  `s_remark` varchar(500) DEFAULT NULL,
  `s_priority` enum('Important','Medium','Low') DEFAULT 'Low',
  `s_status` enum('WIP','Completed','Return','Assigned','Drop') DEFAULT 'Assigned',
  `s_created_by` varchar(45) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_task_header`
--

INSERT INTO `tbl_task_header` (`n_task_id`, `n_dep_id`, `d_start_date`, `d_due_date`, `s_task_name`, `s_task_desc`, `s_remark`, `s_priority`, `s_status`, `s_created_by`, `d_created_datetime`, `s_updated_by`, `d_updated_datetime`) VALUES
(1, 2, '2021-10-18', '2021-10-19', 'Gathering informaion from Ultratech', 'Call maam to get the all r3equired documents', '', 'Important', 'Return', 'EMP02', '2021-10-18 15:49:17', 'EMP05', '2021-10-20 13:28:07'),
(2, 2, '2021-10-19', '2021-10-20', 'Hire New Emp', 'Hire new employee for Development ', '', 'Important', 'WIP', 'EMP02', '2021-10-18 15:50:13', 'EMP05', '2021-10-18 16:33:42'),
(3, 2, '2021-10-19', '2021-10-20', 'Arrange Meeting', 'Arrange the meeting with Finacial team to know the budger of this year', NULL, 'Important', 'Assigned', 'EMP02', '2021-10-18 15:51:11', NULL, '2021-10-18 15:51:11'),
(4, 2, '2021-10-20', '2021-10-20', 'Arrange training for newcomers', 'Setup a 2 to 3 new Webinar for newcomers.', NULL, 'Important', 'WIP', 'EMP02', '2021-10-18 16:01:54', NULL, '2021-10-18 16:03:07'),
(5, 6, '2021-10-18', '2021-10-18', '19-10-TASK1', 'TEST FOR REUTURN', '', 'Important', 'Drop', 'F/09-10/PJ', '2021-10-19 17:27:48', 'F/09-10/PJ', '2021-10-25 14:32:49'),
(6, 17, '2021-10-24', '2021-10-26', 'capsules', 'capsule packaging', NULL, 'Low', 'Assigned', 'emp2948', '2021-10-23 13:57:10', NULL, '2021-10-23 13:57:10'),
(7, 6, '2021-10-24', '2021-10-26', 'capsules', 'cAPSULE PACKAGING', NULL, 'Medium', 'Assigned', 'F/05-06/MA', '2021-10-23 13:57:59', NULL, '2021-10-23 13:57:59'),
(8, 6, '2021-10-30', '2021-10-31', 'capsules', 'start prodcution of 10 kilo ton capsule', '', 'Important', 'Completed', 'F/09-10/PJ', '2021-10-23 14:02:44', 'F/05-06/MA', '2021-10-23 14:03:09'),
(9, 6, '2021-10-26', '2021-10-29', 'maintenance', 'sasssdfsf dssf fsdds', '', 'Important', 'Completed', 'Emp234', '2021-10-25 13:10:38', 'Emp234', '2021-10-25 13:22:40'),
(15, 6, '2021-10-26', '2021-10-28', 'hardware', 'sddsa gtrgrg ythyth hjyyjyujyu', 'ok done ', 'Important', 'Completed', 'F/09-10/PJ', '2021-10-25 13:51:46', 'F/09-10/PJ', '2021-10-25 14:05:06'),
(16, 4, '2021-11-12', '2021-11-14', 'production', 'production of medical gloves', '', 'Important', 'Completed', 'ULT0012', '2021-11-11 18:00:11', 'ULT0012', '2021-11-12 10:38:14'),
(17, 4, '2021-11-13', '2021-11-16', 'software upgrade', 'upgrade the software of al the machines ', '', 'Important', 'WIP', 'emp0123', '2021-11-12 10:46:54', 'ULT0012', '2021-11-12 10:48:07'),
(18, 13, '2022-01-11', '2022-01-13', 'Testing of TSS', 'Testing all aspects and concepts', '', 'Important', 'Assigned', 'O/08-09/SP', '2022-01-11 15:18:09', 'O/08-09/SP', '2022-01-11 15:20:15'),
(19, 13, '2022-01-14', '2022-01-15', 'abc', 'Testing hskfksnfgsndnglksn ', NULL, 'Important', 'Assigned', 'O/08-09/SP', '2022-01-14 11:52:01', NULL, '2022-01-14 11:52:01');

--
-- Triggers `tbl_task_header`
--
DELIMITER $$
CREATE TRIGGER `tbl_task_header_AFTER_INSERT` AFTER INSERT ON `tbl_task_header` FOR EACH ROW BEGIN

INSERT INTO `tbl_attachment`(`s_ogi_name`,`s_new_name`,`s_path`,`s_em_code`,`s_attach_type`,`n_task_id`)
SELECT  `s_ogi_name`, `s_new_name`,  `s_path`, `s_em_code`, `s_attach_type`,new.n_task_id
FROM `tbl_temp_attachment` where s_em_code=new.s_created_by;

delete from tbl_temp_attachment where s_em_code=new.s_created_by;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tbl_task_header_AFTER_UPDATE` AFTER UPDATE ON `tbl_task_header` FOR EACH ROW BEGIN

if new.s_status = 'Return' then
	update tbl_task_transaction  set s_status='Return'  where n_task_id = new.n_task_id;
end if;

insert into tbl_task_log(n_task_id,s_status,s_action_takker) values(new.n_task_id,new.s_status,new.s_updated_by);
 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tbl_task_header_BEFORE_UPDATE` BEFORE UPDATE ON `tbl_task_header` FOR EACH ROW BEGIN

IF new.s_status = 'Return' then
	INSERT INTO  tbl_task_history( n_task_id,s_last_action_takken,s_status,s_action_done_by)
	VALUES (new.n_task_id,new.s_updated_by,OLD.s_status,'Auto');
end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task_history`
--

CREATE TABLE `tbl_task_history` (
  `n_id` int(11) NOT NULL,
  `n_task_id` int(11) DEFAULT NULL,
  `s_last_action_takken` varchar(100) DEFAULT NULL,
  `s_status` varchar(100) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_action_done_by` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_task_history`
--

INSERT INTO `tbl_task_history` (`n_id`, `n_task_id`, `s_last_action_takken`, `s_status`, `d_created_date`, `s_action_done_by`) VALUES
(1, 1, 'EMP05', 'WIP', '2021-10-20 13:28:07', 'Auto'),
(2, 5, 'F/09-10/PJ', 'Assigned', '2021-10-20 13:28:07', 'Auto');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task_log`
--

CREATE TABLE `tbl_task_log` (
  `n_log_id` int(11) NOT NULL,
  `n_task_id` int(11) DEFAULT NULL,
  `s_status` varchar(45) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_action_takker` varchar(100) DEFAULT NULL,
  `s_tag` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_task_log`
--

INSERT INTO `tbl_task_log` (`n_log_id`, `n_task_id`, `s_status`, `d_created_datetime`, `s_action_takker`, `s_tag`) VALUES
(1, 1, 'Assigned', '2021-10-18 15:49:17', 'EMP02', 'Task Created ByEMP02'),
(2, 1, 'Assigned', '2021-10-18 15:49:17', 'EMP02', 'Task Assign toEMP05'),
(3, 2, 'Assigned', '2021-10-18 15:50:13', 'EMP02', 'Task Created ByEMP02'),
(4, 2, 'Assigned', '2021-10-18 15:50:13', 'EMP02', 'Task Assign toEMP05'),
(5, 3, 'Assigned', '2021-10-18 15:51:11', 'EMP02', 'Task Created ByEMP02'),
(6, 3, 'Assigned', '2021-10-18 15:51:11', 'EMP02', 'Task Assign toEMP05'),
(7, 4, 'WIP', '2021-10-18 16:01:54', 'ADM04', 'Task Created ByADM04'),
(8, 4, 'WIP', '2021-10-18 16:01:54', 'ADM04', 'Task Assign toEMP05'),
(9, 4, 'WIP', '2021-10-18 16:03:07', NULL, NULL),
(10, 1, 'WIP', '2021-10-18 16:29:12', 'EMP05', NULL),
(11, 1, 'WIP', '2021-10-18 16:29:12', 'EMP05', ''),
(12, 1, 'WIP', '2021-10-18 16:29:28', 'EMP05', NULL),
(13, 1, 'WIP', '2021-10-18 16:29:28', 'EMP05', ''),
(14, 1, 'Assigned', '2021-10-18 16:31:30', 'EMP05', NULL),
(15, 1, 'Assigned', '2021-10-18 16:31:30', 'EMP05', ''),
(16, 1, 'WIP', '2021-10-18 16:32:33', 'EMP05', NULL),
(17, 1, 'WIP', '2021-10-18 16:32:33', 'EMP05', ''),
(18, 1, 'Assigned', '2021-10-18 16:32:41', 'EMP05', NULL),
(19, 1, 'Assigned', '2021-10-18 16:32:41', 'EMP05', ''),
(20, 1, 'WIP', '2021-10-18 16:33:26', 'EMP05', NULL),
(21, 1, 'WIP', '2021-10-18 16:33:26', 'EMP05', ''),
(22, 2, 'WIP', '2021-10-18 16:33:42', 'EMP05', NULL),
(23, 2, 'WIP', '2021-10-18 16:33:42', 'EMP05', ''),
(24, 5, 'Assigned', '2021-10-19 17:27:48', 'F/09-10/PJ', 'Task Created ByF/09-10/PJ'),
(25, 5, 'Assigned', '2021-10-19 17:27:48', 'F/09-10/PJ', 'Task Assign toF/08-09/AA'),
(26, 5, 'Assigned', '2021-10-19 18:04:56', 'F/09-10/PJ', NULL),
(27, 5, 'Assigned', '2021-10-19 18:04:56', 'F/09-10/PJ', ''),
(28, 1, 'Return', '2021-10-20 13:28:07', 'EMP05', NULL),
(29, 5, 'Return', '2021-10-20 13:28:07', 'F/09-10/PJ', NULL),
(30, 6, 'Assigned', '2021-10-23 13:57:10', 'emp2948', 'Task Created Byemp2948'),
(31, 6, 'Assigned', '2021-10-23 13:57:10', 'emp2948', 'Task Assign toemp2948'),
(32, 7, 'Assigned', '2021-10-23 13:57:59', 'F/05-06/MA', 'Task Created ByF/05-06/MA'),
(33, 7, 'Assigned', '2021-10-23 13:57:59', 'F/05-06/MA', 'Task Assign toF/05-06/MA'),
(34, 8, 'Assigned', '2021-10-23 14:02:44', 'F/09-10/PJ', 'Task Created ByF/09-10/PJ'),
(35, 8, 'Assigned', '2021-10-23 14:02:44', 'F/09-10/PJ', 'Task Assign toF/05-06/MA'),
(36, 8, 'Completed', '2021-10-23 14:03:09', 'F/05-06/MA', NULL),
(37, 8, 'Completed', '2021-10-23 14:03:09', 'F/05-06/MA', ''),
(38, 9, 'Assigned', '2021-10-25 13:10:38', 'Emp234', 'Task Created ByEmp234'),
(39, 9, 'Assigned', '2021-10-25 13:10:38', 'Emp234', 'Task Assign toEmp234'),
(40, 9, 'WIP', '2021-10-25 13:13:22', 'Emp234', NULL),
(41, 9, 'WIP', '2021-10-25 13:13:23', 'Emp234', 'not yet completed '),
(42, 9, 'Completed', '2021-10-25 13:22:40', 'Emp234', NULL),
(43, 9, 'Completed', '2021-10-25 13:22:41', 'Emp234', ''),
(44, 9, 'Completed', '2021-10-25 13:22:41', 'Emp234', NULL),
(45, 9, 'Completed', '2021-10-25 13:22:41', 'Emp234', ''),
(46, 10, 'Assigned', '2021-10-25 13:23:31', 'F/09-10/PJ', 'Task Created ByF/09-10/PJ'),
(47, 10, 'Assigned', '2021-10-25 13:23:31', 'F/09-10/PJ', 'Task Assign toEmp234'),
(48, 10, 'WIP', '2021-10-25 13:24:19', 'Emp234', NULL),
(49, 10, 'WIP', '2021-10-25 13:24:19', 'Emp234', 'ok i will start it by today'),
(50, 15, 'Assigned', '2021-10-25 13:51:46', 'F/09-10/PJ', 'Task Created ByF/09-10/PJ'),
(51, 15, 'Assigned', '2021-10-25 13:51:46', 'F/09-10/PJ', 'Task Assign toEmp234'),
(52, 15, 'WIP', '2021-10-25 13:55:52', 'Emp234', NULL),
(53, 15, 'WIP', '2021-10-25 13:55:52', 'Emp234', 'ok sir i will start '),
(54, 15, 'Completed', '2021-10-25 14:05:06', 'F/09-10/PJ', NULL),
(55, 15, 'Completed', '2021-10-25 14:05:06', 'F/09-10/PJ', 'ok done '),
(56, 10, 'WIP', '2021-10-25 14:13:29', 'Emp234', NULL),
(57, 10, 'WIP', '2021-10-25 14:13:30', 'Emp234', 'i will do it later'),
(58, 5, 'Drop', '2021-10-25 14:32:49', 'F/09-10/PJ', NULL),
(59, 5, 'Drop', '2021-10-25 14:32:49', 'F/09-10/PJ', ''),
(60, 16, 'Assigned', '2021-11-11 18:00:11', 'ULT0012', 'Task Created ByULT0012'),
(61, 16, 'Assigned', '2021-11-11 18:00:11', 'ULT0012', 'Task Assign toULT0012'),
(62, 16, 'Completed', '2021-11-12 10:38:14', 'ULT0012', NULL),
(63, 16, 'Completed', '2021-11-12 10:38:14', 'ULT0012', ''),
(64, 16, 'Completed', '2021-11-12 10:38:28', 'ULT0012', NULL),
(65, 16, 'Completed', '2021-11-12 10:38:28', 'ULT0012', ''),
(66, 17, 'Assigned', '2021-11-12 10:46:54', 'emp0123', 'Task Created Byemp0123'),
(67, 17, 'Assigned', '2021-11-12 10:46:54', 'emp0123', 'Task Assign toULT0012'),
(68, 17, 'WIP', '2021-11-12 10:48:07', 'ULT0012', NULL),
(69, 17, 'WIP', '2021-11-12 10:48:07', 'ULT0012', ''),
(70, 18, 'Assigned', '2022-01-11 15:18:09', 'O/08-09/SP', 'Task Created ByO/08-09/SP'),
(71, 18, 'Assigned', '2022-01-11 15:18:09', 'O/08-09/SP', 'Task Assign toO/08-09/SP'),
(72, 18, 'Assigned', '2022-01-11 15:20:15', 'O/08-09/SP', NULL),
(73, 18, 'Assigned', '2022-01-11 15:20:15', 'O/08-09/SP', ''),
(74, 19, 'Assigned', '2022-01-14 11:52:01', 'O/08-09/SP', 'Task Created ByO/08-09/SP'),
(75, 19, 'Assigned', '2022-01-14 11:52:01', 'O/08-09/SP', 'Task Assign toO/08-09/SP');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task_transaction`
--

CREATE TABLE `tbl_task_transaction` (
  `n_tran_task_id` int(11) NOT NULL,
  `n_task_id` int(11) DEFAULT NULL,
  `s_em_code` varchar(64) DEFAULT NULL,
  `s_remark` varchar(500) DEFAULT NULL,
  `s_status` enum('WIP','Completed','Return','Assigned','Drop') DEFAULT 'Assigned',
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_task_transaction`
--

INSERT INTO `tbl_task_transaction` (`n_tran_task_id`, `n_task_id`, `s_em_code`, `s_remark`, `s_status`, `d_created_datetime`, `d_updated_datetime`, `s_created_by`, `s_updated_by`) VALUES
(1, 1, 'EMP05', '', 'Return', '2021-10-18 15:49:17', '2021-10-20 13:28:07', 'EMP02', 'EMP05'),
(2, 2, 'EMP05', '', 'WIP', '2021-10-18 15:50:13', '2021-10-18 16:33:42', 'EMP02', 'EMP05'),
(3, 3, 'EMP05', NULL, 'Assigned', '2021-10-18 15:51:11', '2021-10-18 15:51:11', 'EMP02', NULL),
(4, 4, 'EMP05', NULL, 'WIP', '2021-10-18 16:01:54', '2021-10-18 16:01:54', 'ADM04', NULL),
(5, 5, 'F/08-09/AA', '', 'Drop', '2021-10-19 17:27:48', '2021-10-25 14:32:49', 'F/09-10/PJ', 'F/09-10/PJ'),
(6, 6, 'emp2948', NULL, 'Assigned', '2021-10-23 13:57:10', '2021-10-23 13:57:10', 'emp2948', NULL),
(7, 7, 'F/05-06/MA', NULL, 'Assigned', '2021-10-23 13:57:59', '2021-10-23 13:57:59', 'F/05-06/MA', NULL),
(8, 8, 'F/05-06/MA', '', 'Completed', '2021-10-23 14:02:44', '2021-10-23 14:03:09', 'F/09-10/PJ', 'F/05-06/MA'),
(9, 9, 'Emp234', '', 'Completed', '2021-10-25 13:10:38', '2021-10-25 13:22:41', 'Emp234', 'Emp234'),
(10, 10, 'Emp234', 'i will do it later', 'WIP', '2021-10-25 13:23:31', '2021-10-25 14:13:30', 'F/09-10/PJ', 'Emp234'),
(11, 15, 'Emp234', 'ok done ', 'Completed', '2021-10-25 13:51:46', '2021-10-25 14:05:06', 'F/09-10/PJ', 'F/09-10/PJ'),
(12, 16, 'ULT0012', '', 'Completed', '2021-11-11 18:00:11', '2021-11-12 10:38:14', 'ULT0012', 'ULT0012'),
(13, 17, 'ULT0012', '', 'WIP', '2021-11-12 10:46:54', '2021-11-12 10:48:07', 'emp0123', 'ULT0012'),
(14, 18, 'O/08-09/SP', '', 'Assigned', '2022-01-11 15:18:09', '2022-01-11 15:20:15', 'O/08-09/SP', 'O/08-09/SP'),
(15, 19, 'O/08-09/SP', NULL, 'Assigned', '2022-01-14 11:52:01', '2022-01-14 11:52:01', 'O/08-09/SP', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_temp_attachment`
--

CREATE TABLE `tbl_temp_attachment` (
  `n_temp_id` int(11) NOT NULL,
  `s_ogi_name` varchar(500) DEFAULT NULL,
  `s_new_name` varchar(500) DEFAULT NULL,
  `s_path` varchar(45) DEFAULT NULL,
  `s_em_code` varchar(50) DEFAULT NULL,
  `s_attach_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='attchemnt for task';

-- --------------------------------------------------------

--
-- Stand-in structure for view `tbl_vw_login`
-- (See below for the actual view)
--
CREATE TABLE `tbl_vw_login` (
`s_em_code` varchar(64)
,`n_dep_id` int(11)
,`s_em_password` varchar(512)
,`s_em_role` enum('ADMIN','EMPLOYEE','SUPER ADMIN')
,`n_status` enum('ACTIVE','INACTIVE')
,`name` varchar(386)
,`s_em_email` varchar(64)
,`dep_head` varchar(3)
,`s_em_image` varchar(128)
,`s_system_admin` int(1)
);

-- --------------------------------------------------------

--
-- Structure for view `tbl_vw_login`
--
DROP TABLE IF EXISTS `tbl_vw_login`;

CREATE ALGORITHM=UNDEFINED DEFINER=`db_ultra`@`%` SQL SECURITY DEFINER VIEW `tbl_vw_login`  AS SELECT `tbl_employee`.`s_em_code` AS `s_em_code`, `tbl_employee`.`n_dep_id` AS `n_dep_id`, `tbl_employee`.`s_em_password` AS `s_em_password`, `tbl_employee`.`s_em_role` AS `s_em_role`, `tbl_employee`.`n_status` AS `n_status`, concat(`tbl_employee`.`s_first_name`,' ',`tbl_employee`.`s_middle_name`,' ',`tbl_employee`.`s_last_name`) AS `name`, `tbl_employee`.`s_em_email` AS `s_em_email`, if((`CHECK_DEPT_HEAD_IS`(`tbl_employee`.`s_em_code`) = 1),'DH','NDH') AS `dep_head`, `tbl_employee`.`s_em_image` AS `s_em_image`, `tbl_employee`.`s_system_admin` AS `s_system_admin` FROM `tbl_employee` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_assign_leave`
--
ALTER TABLE `tbl_assign_leave`
  ADD PRIMARY KEY (`n_al_id`);

--
-- Indexes for table `tbl_attachment`
--
ALTER TABLE `tbl_attachment`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`n_att_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`n_com_id`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`n_dep_id`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `tbl_employee_upload_csv`
--
ALTER TABLE `tbl_employee_upload_csv`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `tbl_emp_shift`
--
ALTER TABLE `tbl_emp_shift`
  ADD PRIMARY KEY (`n_emp_shift_id`);

--
-- Indexes for table `tbl_holiday`
--
ALTER TABLE `tbl_holiday`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `tbl_leave_transaction`
--
ALTER TABLE `tbl_leave_transaction`
  ADD PRIMARY KEY (`n_emp_leave_id`);

--
-- Indexes for table `tbl_leave_types`
--
ALTER TABLE `tbl_leave_types`
  ADD PRIMARY KEY (`n_type_id`);

--
-- Indexes for table `tbl_location_master`
--
ALTER TABLE `tbl_location_master`
  ADD PRIMARY KEY (`n_location_id`);

--
-- Indexes for table `tbl_shift`
--
ALTER TABLE `tbl_shift`
  ADD PRIMARY KEY (`n_shift_id`);

--
-- Indexes for table `tbl_task_header`
--
ALTER TABLE `tbl_task_header`
  ADD PRIMARY KEY (`n_task_id`);

--
-- Indexes for table `tbl_task_history`
--
ALTER TABLE `tbl_task_history`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `tbl_task_log`
--
ALTER TABLE `tbl_task_log`
  ADD PRIMARY KEY (`n_log_id`);

--
-- Indexes for table `tbl_task_transaction`
--
ALTER TABLE `tbl_task_transaction`
  ADD PRIMARY KEY (`n_tran_task_id`);

--
-- Indexes for table `tbl_temp_attachment`
--
ALTER TABLE `tbl_temp_attachment`
  ADD PRIMARY KEY (`n_temp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_assign_leave`
--
ALTER TABLE `tbl_assign_leave`
  MODIFY `n_al_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_attachment`
--
ALTER TABLE `tbl_attachment`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `n_att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `n_com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `n_dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `tbl_employee_upload_csv`
--
ALTER TABLE `tbl_employee_upload_csv`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `tbl_emp_shift`
--
ALTER TABLE `tbl_emp_shift`
  MODIFY `n_emp_shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_holiday`
--
ALTER TABLE `tbl_holiday`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_leave_transaction`
--
ALTER TABLE `tbl_leave_transaction`
  MODIFY `n_emp_leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_leave_types`
--
ALTER TABLE `tbl_leave_types`
  MODIFY `n_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_location_master`
--
ALTER TABLE `tbl_location_master`
  MODIFY `n_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_shift`
--
ALTER TABLE `tbl_shift`
  MODIFY `n_shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_task_header`
--
ALTER TABLE `tbl_task_header`
  MODIFY `n_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_task_history`
--
ALTER TABLE `tbl_task_history`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_task_log`
--
ALTER TABLE `tbl_task_log`
  MODIFY `n_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `tbl_task_transaction`
--
ALTER TABLE `tbl_task_transaction`
  MODIFY `n_tran_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_temp_attachment`
--
ALTER TABLE `tbl_temp_attachment`
  MODIFY `n_temp_id` int(11) NOT NULL AUTO_INCREMENT;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`db_ultra`@`%` EVENT `task_reset` ON SCHEDULE EVERY 4 HOUR STARTS '2021-10-08 13:28:07' ON COMPLETION NOT PRESERVE ENABLE DO call after_24_hours_task_status$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
