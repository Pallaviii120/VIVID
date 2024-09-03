var dbValidation = require("./../../utils/dbValidation.js"); // this is contain all Validation part
const { savetasks, getallprojectlist } = require("./essController.js");
var obj = {};
module.exports = {
  /* -------------------Department Master --------------------- */

  get_location_list: function (req, res) {
    obj = {};
    obj.queryString = "SELECT * FROM tbl_location_master";
    obj.arr = [];
    return obj;
  },

  //for getting dept data
  getDeptList: function (req, res) {
    obj = {};
    obj.queryString = "select * from tbl_department;";
    obj.arr = [];
    return obj;
  },

  //for getting dept data by id
  getDeptById: function (req, res) {
    obj = {};

    obj.queryString = `select * from tbl_department where n_dep_id=?;`;
    obj.arr = [req.body.n_dep_id];

    return obj;
  },

  //for deleting dept data
  deleteDeptById: function (req, res) {
    obj = {};
    obj.queryString = "delete from tbl_department where n_dep_id=?";
    obj.arr = [req.body.n_dep_id];

    return obj;
  },
  //for updating dept data
  updateDept: function (req, res) {
    obj = {};

    obj.queryString =
      "update tbl_department set s_dep_name=?,s_dep_head=?,s_updated_by=? where n_dep_id=?";
    obj.arr = [
      req.body.s_dep_name,
      req.body.s_dep_head,
      req.body.s_created_by,
      req.body.n_dep_id,
    ];

    return obj;
  },

  //save dept data
  check_dept: function (req, res) {
    obj = {};
    obj.queryString =
      "select Count(*) as cnt from tbl_department where s_dep_name = ?";
    obj.arr = [req.body.s_dep_name];
    return obj;
  },
  saveDept: function (req, res) {
    obj = {};
    obj.queryString =
      "Insert into tbl_department (s_dep_name, s_dep_head,s_created_by) values(?,?,?)";
    obj.arr = [req.body.s_dep_name, req.body.s_dep_head, req.body.s_created_by];
    return obj;
  },
  /* -------------------End Department Master --------------------- */

  /* -------------------Shift Master --------------------- */
  //for getting Shift data
  getShiftList: function (req, res) {
    obj = {};

    obj.queryString = "select * from tbl_shift;";
    obj.arr = [];

    return obj;
  },

  //for getting Shift data by id
  getShiftById: function (req, res) {
    obj = {};

    obj.queryString = `select * from tbl_shift where n_shift_id=?;`;
    obj.arr = [req.body.n_shift_id];

    return obj;
  },

  //for deleting Shift data
  deleteShiftById: function (req, res) {
    obj = {};
    obj.queryString = "delete from tbl_shift where n_shift_id=?";
    obj.arr = [req.body.n_shift_id];

    return obj;
  },
  //for updating Shift data
  updateShift: function (req, res) {
    obj = {};

    obj.queryString =
      "update tbl_shift set s_shift=?,s_shift_desc=?,t_start_time=?,t_end_time=?,s_gross_start_time=?,s_gross_end_time=?,s_min_work_hours=? where n_shift_id=?";
    obj.arr = [
      req.body.s_shift,
      req.body.s_shift_desc,
      req.body.t_start_time,
      req.body.t_end_time,
      req.body.s_gross_start_time,
      req.body.s_gross_end_time,
      req.body.s_min_work_hours,
      req.body.n_shift_id,
    ];

    return obj;
  },

  //save Shift data
  saveShift: function (req, res) {
    obj = {};
    obj.queryString =
      "Insert into tbl_shift (s_shift, s_shift_desc,t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours) values(?,?,?,?,?,?,?)";
    obj.arr = [
      req.body.s_shift,
      req.body.s_shift_desc,
      req.body.t_start_time,
      req.body.t_end_time,
      req.body.s_gross_start_time,
      req.body.s_gross_end_time,
      req.body.s_min_work_hours,
    ];
    return obj;
  },
  /* -------------------End Shift Master --------------------- */

  /* -------------------Holiday Master --------------------- */
  //for getting Holiday data
  getHolidayList: function (req, res) {
    obj = {};

    obj.queryString = "select * from tbl_holiday;";
    obj.arr = [];

    return obj;
  },

  //for getting Holiday data by id
  getHolidayById: function (req, res) {
    obj = {};

    obj.queryString = `select * from tbl_holiday where n_id=?;`;
    obj.arr = [req.body.n_id];

    return obj;
  },

  //for deleting Holiday data
  deleteHolidayById: function (req, res) {
    obj = {};
    obj.queryString = "delete from tbl_holiday where n_id=?";
    obj.arr = [req.body.n_id];

    return obj;
  },
  //for updating Holiday data
  updateHoliday: function (req, res) {
    obj = {};

    obj.queryString =
      "update tbl_holiday set s_holiday_name=?,d_from_date=?,d_to_date=?,n_number_of_days=?,f_year=? where n_id=?";
    obj.arr = [
      req.body.s_holiday_name,
      req.body.d_from_date,
      req.body.d_to_date,
      req.body.n_number_of_days,
      req.body.f_year,
      req.body.n_id,
    ];

    return obj;
  },

  //save Holiday data
  saveHoliday: function (req, res) {
    obj = {};
    obj.queryString =
      "Insert into tbl_holiday (s_holiday_name, d_from_date,d_to_date,n_number_of_days,f_year) values(?,?,?,?,?)";
    obj.arr = [
      req.body.s_holiday_name,
      req.body.d_from_date,
      req.body.d_to_date,
      req.body.n_number_of_days,
      req.body.f_year,
    ];
    return obj;
  },
  /* -------------------End Holiday Master --------------------- */

  /* -------------------Emp Master --------------------- */
  //for getting Emp data
  getEmpList: function (req, res) {
    obj = {};
    obj.queryString = `select n_id,s_em_code,n_dep_id,concat(s_first_name," ",s_middle_name," ",s_last_name) as fullnm,s_em_email,s_em_address,s_em_gender,s_em_phone,s_em_birthday,s_em_blood_group,d_em_joining_date,s_em_image,s_em_pan,s_em_adhar,s_em_pf_no,s_em_reporting1,s_em_reporting2,getDeptById(n_dep_id) as dept,getEmpById(s_em_reporting2) as reporting2,getEmpById(s_em_reporting1) as reporting1,s_em_role as role from tbl_employee where n_status='ACTIVE' -- and  s_em_role <>'ADMIN';`;
    obj.arr = [];

    return obj;
  },
  get_inactive_emp: function (req, res) {
    obj = {};
    obj.queryString = `select n_id,s_em_code,n_dep_id,concat(s_first_name," ",s_middle_name," ",s_last_name) as fullnm,s_em_email,s_em_address,s_em_gender,s_em_phone,s_em_birthday,s_em_blood_group,d_em_joining_date,s_em_image,s_em_pan,s_em_adhar,s_em_pf_no,s_em_reporting1,s_em_reporting2,getDeptById(n_dep_id) as dept,getEmpById(s_em_reporting2) as reporting2,getEmpById(s_em_reporting1) as reporting1,s_em_role as role  from tbl_employee where n_status='INACTIVE' and  n_id <>'ADMIN';`;
    obj.arr = [];
    return obj;
  },
  //for getting Emp data by id
  getEmpById: function (req, res) {
    obj = {};

    obj.queryString = `select *,getDeptById(n_dep_id) as dept,getEmpById(s_em_reporting2) as reporting2,getEmpById(s_em_reporting1) as reporting1 from tbl_employee where s_em_code=?;`;
    obj.arr = [req.body.s_em_code];

    return obj;
  },

  //for deleting Emp data
  deleteEmpById: function (req, res) {
    obj = {};
    obj.queryString = "delete from tbl_employee where s_em_code=?";
    obj.arr = [req.body.s_em_code];

    return obj;
  },
  //for deleting Emp data
  deactivateEmpById: function (req, res) {
    obj = {};
    var stsatus = "INACTIVE";
    if (req.body.btn == "btn_deac") {
      stsatus = "INACTIVE";
    } else {
      stsatus = "ACTIVE";
    }
    obj.queryString = "update tbl_employee set n_status=?  where s_em_code=?";
    obj.arr = [stsatus, req.body.s_em_code];

    return obj;
  },
  //for updating Emp data
  updateEmp: function (req, res) {
    obj = {};
    req.body.s_em_reporting2 = dbValidation.check_string_val(
      req.body.s_em_reporting2,
      ""
    );
    obj.queryString =
      "update tbl_employee set s_first_name=?,s_middle_name=?,s_last_name=?,s_em_email=?,s_em_gender=?,s_designation=?,s_em_marital_status=?,s_em_pf_no=?,s_em_pan=?,s_em_adhar=?,s_em_blood_group=?,s_em_birthday=?,d_em_joining_date=?,s_em_address=?,s_em_reporting1=?,s_em_reporting2=?,n_dep_id=?,s_em_email=?,s_em_password=md5(?) where s_em_code=?";
    obj.arr = [
      req.body.s_first_name,
      req.body.s_middle_name,
      req.body.s_last_name,
      req.body.s_em_code,
      req.body.s_em_email,
      req.body.s_em_gender,
      req.body.s_designation,
      req.body.s_em_marital_status,
      req.body.s_em_pf_no,
      req.body.s_em_pan,
      req.body.s_em_adhar,
      req.body.s_em_blood_group,
      req.body.s_em_birthday,
      req.body.d_em_joining_date,
      req.body.s_em_address,
      req.body.s_em_reporting1,
      req.body.s_em_reporting2,
      req.body.n_dep_id,
      req.body.s_em_password,
      req.body.s_em_code,
    ];

    return obj;
  },

  //save Emp data
  saveEmp: function (req, res) {
    obj = {};
    obj.queryString =
      "select upsertEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) as emp;";
    req.body.s_em_reporting2 = dbValidation.check_string_val(
      req.body.s_em_reporting2,
      ""
    );
    obj.arr = [
      req.body.s_em_code,
      req.body.s_designation,
      req.body.n_dep_id,
      req.body.s_first_name,
      req.body.s_middle_name,
      req.body.s_last_name,
      req.body.s_em_email,
      req.body.s_em_address,
      req.body.s_em_gender,
      req.body.s_em_phone,
      req.body.s_em_birthday,
      req.body.s_em_blood_group,
      req.body.d_em_joining_date,
      req.body.s_em_pan,
      req.body.s_em_adhar,
      req.body.s_em_pf_no,
      req.body.s_em_marital_status,
      req.body.s_em_reporting1,
      req.body.s_em_reporting2,
      req.body.n_location_id,
      req.body.s_em_password,
    ];
    return obj;
  },

  //for changing Password
  changePassword: function (req, res) {
    obj = {};

    obj.queryString = `update tbl_employee set s_em_password=md5(?) where s_em_code=?;`;
    obj.arr = [req.body.s_em_password, req.body.s_em_code];

    return obj;
  },

  //for getting Emp data by id
  checkPassword: function (req, res) {
    obj = {};

    obj.queryString = `select * from tbl_employee where s_em_code=? and s_em_password=md5(?);`;
    obj.arr = [req.body.s_em_code, req.body.s_em_password];

    return obj;
  },
  /* -------------------End Emp Master --------------------- */

  /* -------------------Leave Master --------------------- */
  //for getting Leave data
  getLeaveList: function (req, res) {
    obj = {};

    obj.queryString = `select * from tbl_leave_types where n_status=1;`;
    obj.arr = [];

    return obj;
  },

  //for getting AssignLeave data
  getAssignLeaveList: function (req, res) {
    obj = {};

    obj.queryString =
      "select *,getLeaveNameById(n_type_id) as leave_nm from tbl_assign_leave where s_em_code=?;";
    obj.arr = [req.body.s_em_code];

    return obj;
  },

  //for getting AssignLeave data by id
  getAssignLeaveById: function (req, res) {
    obj = {};

    obj.queryString = `select * from tbl_assign_leave where n_al_id=?;`;
    obj.arr = [req.body.n_al_id];

    return obj;
  },

  //for deleting AssignLeave data
  deleteAssignLeaveById: function (req, res) {
    obj = {};
    obj.queryString = "delete from tbl_assign_leave where n_al_id=?";
    obj.arr = [req.body.n_al_id];

    return obj;
  },
  //for updating AssignLeave data
  updateAssignLeave: function (req, res) {
    obj = {};
    obj.queryString =
      "update tbl_assign_leave set s_em_code=?,n_type_id=?,n_assiged_days=?,f_dateyear=? where n_al_id=?";
    obj.arr = [
      req.body.s_em_code,
      req.body.n_type_id,
      req.body.n_assiged_days,
      req.body.f_dateyear,
      req.body.n_al_id,
    ];

    return obj;
  },

  //save AssignLeave data
  saveAssignLeave: function (req, res) {
    obj = {};
    obj.queryString = "select upsertAssignLeave(?,?,?,?,?,?) as assignedleave";
    obj.arr = [
      req.body.s_em_code,
      req.body.n_type_id,
      req.body.n_current_leave,
      req.body.n_carry_forward_leave,
      req.body.n_max_leave_in_month,
      req.body.f_dateyear,
    ];
    return obj;
  },

  /* -------------------End Leave Master --------------------- */

  /* -------------------Assign Shift Master --------------------- */

  //for getting AssignShift data
  getAssignShiftList: function (req, res) {
    obj = {};

    obj.queryString = "select * from tbl_emp_shift where s_em_code=?;";
    obj.arr = [req.body.s_em_code];

    return obj;
  },

  //for getting AssignShift data by id
  getAssignShiftById: function (req, res) {
    obj = {};

    obj.queryString = `select * from tbl_emp_shift where n_emp_shift_id=?;`;
    obj.arr = [req.body.n_emp_shift_id];

    return obj;
  },

  //for deleting AssignShift data
  deleteAssignShiftById: function (req, res) {
    obj = {};
    obj.queryString = "delete from tbl_emp_shift where n_emp_shift_id=?";
    obj.arr = [req.body.n_emp_shift_id];

    return obj;
  },
  //for updating AssignShift data
  updateAssignShift: function (req, res) {
    obj = {};

    obj.queryString =
      "update tbl_emp_shift set s_em_code=?,n_shift_id=?,d_start_date=?,d_end_date=? where n_emp_shift_id=?";
    obj.arr = [
      req.body.s_em_code,
      req.body.n_shift_id,
      req.body.d_start_date,
      req.body.d_end_date,
      req.body.n_emp_shift_id,
    ];

    return obj;
  },

  //save AssignShift data
  saveAssignShift: function (req, res) {
    obj = {};
    obj.queryString =
      "Insert into tbl_emp_shift (s_em_code, n_shift_id,d_start_date,d_end_date) values(?,?,?,?)";
    obj.arr = [
      req.body.s_em_code,
      req.body.n_shift_id,
      req.body.d_start_date,
      req.body.d_end_date,
    ];

    return obj;
  },

  /* -------------------End Shift Master --------------------- */
  get_emp_list: function (req, res) {
    obj = {};
    obj.queryString =
      " select s_em_code,get_name_by_emp_code(s_em_code) as name from tbl_employee  where n_status='ACTIVE' ";
    if (req.body.role == "ADMIN") {
      if (req.body.approver == "APPROVER") {
        obj.queryString += " and s_em_reporting1 = ? ";
        obj.arr = [req.body.emp_code];
      } else {
        obj.queryString += ` and s_em_role <> 'ADMIN' `;
      }
    } else if (req.body.approver != "APPROVER") {
      obj.queryString += ` and s_em_code = ? `;
      obj.arr = [req.body.emp_code];
    } else {
      obj.queryString += ` and s_em_code <> ? `;
      obj.arr = [req.body.emp_code];
    }
    obj.queryString += ` order by name asc`;
    return obj;
  },

  get_leave_type_by_id: function (req, res) {
    obj = {};
    obj.queryString = `SELECT  n_type_id,
                            GET_LEAVE_TYPE_NAME(n_type_id) AS leave_type_name,
                            n_assiged_days,n_consumed_days,n_max_leave_in_month
                        FROM
                            tbl_assign_leave 
                        where  s_em_code = ? and f_dateyear = current_fisical_year()`;
    obj.arr = [req.body.emp_code];
    return obj;
  },

  submit_leave: function (req, res) {
    obj = {};
    obj.queryString = `call submit_leave(?,?,?,?,?,?,?,?,?);`;
    obj.arr = [
      req.body.s_em_code,
      req.body.n_type_id,
      req.body.d_start_date,
      req.body.d_end_date,
      req.body.s_leave_type,
      req.body.s_reason,
      req.body.s_created_by,
      req.body.d_leave_duration,
      dbValidation.current_date(),
    ];
    return obj;
  },

  get_emp_myleave: function (req, res) {
    obj = {};
    obj.queryString = ` SELECT n_emp_leave_id,s_em_code,s_leave_type,d_start_date,d_end_date,d_apply_date,s_leave_status,s_em_approver,get_leave_type_name(n_type_id) as leave_name,get_name_by_emp_code(s_em_approver) as approve_name,d_leave_duration FROM tbl_leave_transaction where s_em_code = ? order by n_emp_leave_id desc `;
    obj.arr = [req.body.emp_code];
    return obj;
  },
  get_emp_approver_leave: function (req, res) {
    obj = {};
    obj.queryString = ` SELECT n_emp_leave_id,s_em_code,s_leave_type,d_start_date,d_end_date,d_apply_date,s_leave_status,s_em_approver,get_leave_type_name(n_type_id) as leave_name,get_name_by_emp_code(s_em_code) as emp_name,d_leave_duration FROM tbl_leave_transaction where s_em_approver = ? and s_leave_status = 'Not Approve' order by n_emp_leave_id desc `;
    obj.arr = [req.body.emp_code];
    return obj;
  },
  update_leave: function (req, res) {
    obj = {};
    var status = "";
    if (req.body.status == "btn_Approved") {
      req.body.status = "Approved";
    } else if (req.body.status == "btn_Rejected") {
      req.body.status = "Rejected";
    } else {
      req.body.status = "Not Approve";
    }
    obj.queryString = ` update tbl_leave_transaction set s_updated_by=?, s_leave_status=? where s_em_approver = ? and s_leave_status = 'Not Approve'  and n_emp_leave_id=? ;
        select *,get_email_by_emp_code(s_em_code) as  requester_email from tbl_leave_transaction where n_emp_leave_id=?;`;
    obj.arr = [
      req.body.emp_code,
      req.body.status,
      req.body.emp_code,
      req.body.id,
      req.body.id,
    ];
    return obj;
  },

  delete_rec: function (req, res) {
    obj = {};
    obj.queryString = ` delete from tbl_leave_transaction  where n_emp_leave_id = ? and s_leave_status = 'Not Approve' `;
    obj.arr = [req.body.id];
    return obj;
  },

  view_leave: function (req, res) {
    obj = {};
    obj.queryString = ` select * from tbl_leave_transaction  where n_emp_leave_id = ? and s_leave_status = 'Not Approve' and s_em_approver=? `;
    obj.arr = [req.body.id, req.body.emp_code];
    return obj;
  },

  punch_in_out: function (req, res) {
    obj = {};
    // obj.queryString = ` call attendance_update (cur_date, sign_in, sing_out, em_code, work_type, tag )`;
    obj.queryString = ` call attendance_update (?, ?, ?, ?, ?, ?)`;
    obj.arr = [
      dbValidation.current_date(),
      dbValidation.current_time(),
      dbValidation.current_time(),
      req.body.s_created_by,
      req.body.s_work_type,
      req.body.tag,
    ];
    return obj;
  },
  get_today_pucnch: function (req, res) {
    obj = {};
    // obj.queryString = ` call attendance_update (cur_date, sign_in, sing_out, em_code, work_type, tag )`;
    obj.queryString = ` select * from tbl_attendance where s_em_code= ? and d_atten_date=?  `; //and s_work_type=?
    if (req.body.tag == "PUNCH_OUT") {
      obj.queryString += " and  t_signout_time is not null ";
    }
    obj.arr = [req.body.s_created_by, dbValidation.current_date()]; //, req.body.s_work_type
    return obj;
  },

  //for getting assign leave detail base on year
  getEmpAssignLeave: function (req, res) {
    obj = {};
    obj.queryString = `Select get_leave_type_name(n_type_id) as leavenm,n_assiged_days, n_consumed_days,(n_assiged_days-n_consumed_days) as pending FROM tbl_assign_leave where f_dateyear=? and s_em_code=?;`;
    obj.arr = [req.body.f_dateyear, req.body.s_em_code];
    return obj;
  },

  //for getting assign Task detail base on year
  getEmpAssignTask: function (req, res) {
    obj = {};
    obj.queryString = `select a.s_em_code,a.n_task_id,b.s_task_name,b.s_task_desc,b.s_priority,b.d_start_date,b.d_due_date from tbl_task_transaction a,tbl_task_header b where a.n_task_id=b.n_task_id and a.s_em_code=? and b.s_status=? and get_role_by_emp_code(a.s_em_code) = ?;`;
    obj.arr = [req.body.s_em_code, req.body.s_status, req.body.type];
    return obj;
  },

  //for getting employee attendance detail
  getEmpAttend: function (req, res) {
    obj = {};
    obj.queryString = `SELECT *,get_name_by_emp_code(s_em_code) as name,get_profile(s_em_code) as profile,get_email_by_emp_code(s_em_code) as s_em_email FROM tbl_attendance  where d_atten_date=current_date() and 'ADMIN' = ? and get_role_by_emp_code(?) = 'ADMIN';`;
    obj.arr = [req.body.type, req.body.em_code];
    return obj;
  },

  getEmpAttend_report: function (req, res) {
    obj = {};
    obj.queryString = `SELECT *,get_name_by_emp_code(s_em_code) as name,get_profile(s_em_code) as profile,get_email_by_emp_code(s_em_code) as s_em_email FROM tbl_attendance  where 'ADMIN' = ?  `;
    obj.arr = [req.body.type];
    if (dbValidation.check_string_val(req.body.s_em_code, "") != "") {
      obj.queryString += ` and s_em_code = ? `;
      obj.arr.push(req.body.s_em_code);
    }
    if (dbValidation.check_string_val(req.body.date_range, "") != "") {
      obj.queryString += ` and  d_atten_date >= ?  and d_atten_date <= ? `;
      obj.arr.push(
        req.body.date_range.split(" - ")[0],
        req.body.date_range.split(" - ")[1]
      );
    } else {
      obj.queryString += ` and d_atten_date=current_date() `;
    }
    return obj;
  },
  get_dash_data_a: function (req, res) {
    obj = {};
    obj.queryString = `
        -- query 1 
        SELECT SUM(case when n_status = 'ACTIVE' then 1 else 0 end) AS CNT_ACTIVE,SUM(case when n_status = 'INACTIVE' then 1 else 0 end) AS CNT_INACTIVE, n_status  FROM tbl_employee where 'ADMIN' = ? and get_role_by_emp_code(?) = 'ADMIN' group by n_status ;
        -- query 2  
        SELECT count(*) as ttl_leave_cnt,d_start_date FROM tbl_leave_transaction where 'ADMIN' = ? and get_role_by_emp_code(?) = 'ADMIN' group  by d_start_date;
        -- query 3
        SELECT  
                SUM(CASE WHEN s_status = 'Assigned' THEN 1 ELSE 0 END) AS 'Assigned',
                concat(round(( SUM(CASE WHEN s_status = 'Assigned' THEN 1 ELSE 0 END) /count(*) * 100 ),2),'%') AS Assigned_percentage,
                SUM(CASE WHEN s_status = 'WIP' THEN 1 ELSE 0 END) AS 'WIP', 
                concat(round(( SUM(CASE WHEN s_status = 'WIP' THEN 1 ELSE 0 END) /count(*) * 100 ),2),'%') AS WIP_percentage,
                SUM(CASE WHEN s_status = 'Completed' THEN 1 ELSE 0 END) AS 'Completed', 
                concat(round(( SUM(CASE WHEN s_status = 'Completed' THEN 1 ELSE 0 END) /count(*) * 100 ),2),'%') AS Completed_percentage,
                SUM(CASE WHEN s_status = 'Drop' THEN 1 ELSE 0 END) AS 'Drop',
                concat(round(( SUM(CASE WHEN s_status = 'Drop' THEN 1 ELSE 0 END) /count(*) * 100 ),2),'%') AS Drop_percentage, 
                SUM(CASE WHEN s_status = 'Return' THEN 1 ELSE 0 END) AS 'Return' ,
                concat(round(( SUM(CASE WHEN s_status = 'Return' THEN 1 ELSE 0 END) /count(*) * 100 ),2),'%') AS Return_percentage,
                SUM((CASE WHEN s_status = 'Assigned' THEN 1 ELSE 0 END)+(CASE WHEN s_status = 'WIP' THEN 1 ELSE 0 END)+(CASE WHEN s_status = 'Return' THEN 1 ELSE 0 END)) as  Pending_task
                FROM tbl_task_header;
                -- gET ALL THE TODAYS AVAILABILITY
                SELECT get_today_emp_availability() AS today_availaility;`;
    obj.arr = [
      req.body.role,
      req.body.em_code,
      req.body.role,
      req.body.em_code,
      req.body.role,
      req.body.em_code,
    ];
    return obj;
  },
  // this report is only form deaprtmant head
  get_task_report_for_DH: function (req, res) {
    obj = {};
    obj.queryString = `SELECT   
        a.*,
        GETDEPTBYID(a.n_dep_id) AS dep_name,
        GET_NAME_BY_EMP_CODE(a.s_created_by) AS task_created_by,
        COALESCE(a.s_remark, 'NA') AS final_remark,
        GET_NAME_BY_EMP_CODE(b.s_em_code) AS assign_to,
        COALESCE(DATE_FORMAT( (SELECT max(date_sub(d_created_date,interval 24 hour)) FROM tbl_task_history where n_task_id = a.n_task_id),"%Y-%m-%d"),'NA') as revised_date,
        DATE_FORMAT(a.d_created_datetime,"%Y-%m-%d") as created_date
    FROM
        tbl_task_header a
            LEFT JOIN
        tbl_task_transaction b ON a.n_task_id = b.n_task_id where `;
    if (req.body.type == "ADMIN" && req.body.tag == 0) {
      obj.queryString += ` 1 = ?`;
      obj.arr = [1];
    } else {
      obj.queryString += ` a.n_dep_id = (select n_dep_id from tbl_department where s_dep_head = ?)`;
      obj.arr = [req.body.login_id];
    }

    if (dbValidation.check_string_val(req.body.date_range, "") != "") {
      obj.queryString += ` and  d_start_date >= ?  and d_start_date <= ? `;
      obj.arr.push(
        req.body.date_range.split(" - ")[0],
        req.body.date_range.split(" - ")[1]
      );
    } else {
      obj.queryString += ` and d_start_date=current_date() `;
    }
    if (dbValidation.check_string_val(req.body.s_em_code, "") != "") {
      obj.queryString += ` and b.s_em_code = ? `;
      obj.arr.push(req.body.s_em_code);
    }

    return obj;
  },

  get_emp_list_by_dept_by_em_code: function (req, res) {
    obj = {};
    if (req.body.role == "ADMIN" && req.body.tag == 0) {
      obj.queryString =
        "select s_dep_head as s_em_code,get_name_by_emp_code(s_dep_head) as name, getDeptById(n_dep_id) as dep_name FROM tbl_department where get_role_by_emp_code(?) = 'ADMIN' and 0=?  and get_name_by_emp_code(s_dep_head) is not null ";
      obj.arr = [req.body.emp_code, req.body.tag];
    } else {
      obj.queryString =
        " select s_em_code,get_name_by_emp_code(s_em_code) as name, getDeptById(n_dep_id) as dep_name from tbl_employee where n_status='ACTIVE' and get_role_by_emp_code(s_em_code) <> 'ADMIN' and n_dep_id in (select n_dep_id from tbl_department where s_dep_head = ? ) and 'DH' = ?";
      obj.arr = [req.body.emp_code, req.body.dep_head];
    }

    return obj;
  },

  saveactivitytask: function (req, res) {
    obj = {};
    obj.queryString =
      "Insert into tbl_activity_details (s_name,s_project_id,s_created_by) values(?,?,?)";
    obj.arr = [
      req.body.s_act_name,
      req.body.s_project_id,
      req.body.s_created_by,
    ];

    return obj;
  },
  savetasks: function (req, res) {
    let tasks = req.body.tasks;
    let activityId = req.body.activityid;
    let createdBy = req.body.s_created_by;

    let placeholders = [];
    let params = [];

    tasks.forEach((task) => {
      placeholders.push("(?, ?, ?)");
      params.push(task.task_name, activityId, createdBy);
    });

    // Join placeholders into a single SQL query string
    let queryString = `
        INSERT INTO tbl_task_of_activity 
        (s_task, s_activity_id, s_created_by) 
        VALUES ${placeholders.join(", ")}
    `;

    return { queryString, params };
  },

  getactivitytask: function (req, res) {
    obj = {};
    obj.queryString = `SELECT a.* , count(b.s_activity_id) as task_count FROM tbl_activity_details a, tbl_task_of_activity b, tbl_project_details c where a.activity_id=b.s_activity_id  and a.s_project_id=c.project_id and a.s_project_id='${req.body.projectid}' and a.s_created_by='${req.body.s_created_by}' GROUP BY a.activity_id;`;
    obj.arr = [];
    return obj;
  },

  gettaskbyactid: function (req, res) {
    obj = {};
    obj.queryString = `SELECT a.* , b.*  FROM tbl_activity_details a, tbl_task_of_activity b where a.activity_id=b.s_activity_id and a.activity_id='${req.body.actid}'`;
    obj.arr = [];
    return obj;
  },

  saveprojectdetails: function (req, res) {
    obj = {};
    obj.queryString =
      "Insert into tbl_project_details (s_title,s_desc,s_rule,s_start_date,s_end_date,s_created_by) values(?,?,?,?,?,?)";
    obj.arr = [
      req.body.s_proj_title,
      req.body.s_proj_desc,
      req.body.s_rule,
      req.body.s_startdate,
      req.body.s_enddate,
      req.body.s_created_by,
    ];
    return obj;
  },

  getprojectdetails: function (req, res) {
    obj = {};
    obj.queryString = `SELECT a.* , count(b.s_project_id) as task_count FROM tbl_project_details a, tbl_activity_details b where a.project_id=b.s_project_id  and a.s_created_by='${req.body.s_created_by}' GROUP BY b.s_project_id;`;
    obj.arr = [req.body.s_created_by];

    return obj;
  },

  getactivitylist: function (req, res) {
    obj = {};
    obj.queryString = `SELECT a.* , count(b.s_activity_id) as task_count FROM tbl_activity_details a, tbl_task_of_activity b where a.activity_id=b.s_activity_id  and a.s_project_id='${req.body.activityid}' GROUP BY a.activity_id;`;
    obj.arr = [];
    return obj;
  },
  getallprojectlistdd: function (req, res) {
    obj = {};
    obj.queryString = "select * from tbl_project_details";
    obj.arr = [];
    return obj;
  },
  getprojectactivity: function (req, res) {
    obj = {};
    obj.queryString = `SELECT * FROM tbl_activity_details where s_project_id='${req.body.proj_id}';`;
    obj.arr = [];
    return obj;
  },
  gettaskactivity: function (req, res) {
    obj = {};
    obj.queryString = `SELECT * FROM tbl_task_of_activity where s_activity_id='${req.body.act_id}';`;
    obj.arr = [];
    return obj;
  },
  savetimedetails: function (req, res) {
    let records = req.body;
    let placeholders = [];
    let params = [];
    records.forEach((record) => {
      if (record.project && record.activity) {
        record.tasks.forEach((task) => {
          placeholders.push("(?, ?, ?, ?, ?, ?, ?, ?, ?)");
          params.push(
            task.s_created_by,
            record.date,
            record.project,
            record.activity,
            task.task,
            task.hours,
            task.description,
            record.savestatus,
            record.status
          );
        });
      }
    });

    if (placeholders.length > 0) {
      let queryString = `
            INSERT INTO tbl_timesheet_details 
            (s_user_name, s_date, s_project, s_activity_name, s_task_name, s_hours, s_desc, s_save_status,s_status) 
            VALUES ${placeholders.join(", ")}
        `;
      return { queryString, params };
    }
  },
  gettimesheetdetails: function (req, res) {
    obj = {};
    obj.queryString = `SELECT a.*,b.s_title,c.s_name,b.s_desc as p_desc FROM tbl_timesheet_details a, tbl_project_details b, tbl_activity_details c where a.s_project=b.project_id and a.s_activity_name=c.activity_id  and a.s_user_name='${req.body.s_created_by}' and a.s_date between '${req.body.sdate}' and '${req.body.edate}';`;
    obj.arr = [];
    return obj;
  },
  gettimesheetreport: function (req, res) {
    obj = {};
    obj.queryString = `SELECT a.*,b.s_title,c.s_name,b.s_desc as p_desc,monthname(a.s_date) as s_month,d.s_em_code,concat(d.s_first_name,' ', d.s_last_name) as emp_name FROM tbl_timesheet_details a, tbl_project_details b, tbl_activity_details c, tbl_employee d  where a.s_project=b.project_id and a.s_activity_name=c.activity_id and a.s_user_name=d.s_em_code and a.s_project='${req.body.project_name}' and a.s_date between '${req.body.s_date}' and '${req.body.e_date}';`;
    obj.arr = [];
    return obj;
  },
  submitdraftdata: function (req, res) {
    obj = {};
    obj.queryString =
      "update tbl_timesheet_details set s_save_status='Pending',s_status='1' where id=?";
    obj.arr = [req.body.id];

    return obj;
  },
};
