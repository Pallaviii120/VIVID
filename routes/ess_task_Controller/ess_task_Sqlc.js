var dbValidation = require("./../../utils/dbValidation.js"); // this is contain all Validation part
var obj = {};
module.exports = {
    /* -------------------Task Master --------------------- */
    get_dept_list: function (req, res) {
        obj = {};
        obj.arr = [req.body.emp_code];
        if ('ADMIN' != req.body.role) {
            obj.queryString = " select * FROM tbl_department where  n_dep_id = ( select  n_dep_id from tbl_employee where n_status='ACTIVE' and get_role_by_emp_code(s_em_code) <> 'ADMIN' and s_em_code = ? ) ";
        } else if ('ADMIN' == req.body.role && '0' == req.body.tag) { //  mtlb not a system admin
            obj.queryString = " select * FROM tbl_department where  if(get_role_by_emp_code(?) = 'ADMIN',1,0)=1 and 0=? ";
            obj.arr.push(req.body.tag);
        } else {
            obj.queryString = " select * FROM tbl_department where if(get_role_by_emp_code(?) <> 'ADMIN',1,0) =1 ";
        };

        return obj;
    },
    get_emp_list_by_dept: function (req, res) {
        obj = {};
        obj.queryString = " select s_em_code,get_name_by_emp_code(s_em_code) as name, getDeptById(n_dep_id) as dep_name from tbl_employee where n_status='ACTIVE' and get_role_by_emp_code(s_em_code) <> 'ADMIN' and n_dep_id = ? ";
        obj.arr = [req.body.dep];
        if ('ADMIN' == req.body.role && '0' == req.body.tag) {
            obj.queryString = "select s_dep_head as s_em_code,get_name_by_emp_code(s_dep_head) as name, getDeptById(n_dep_id) as dep_name FROM tbl_department where n_dep_id = ? and  get_role_by_emp_code(?) = 'ADMIN' and 0=?  and get_name_by_emp_code(s_dep_head) is not null ";
            obj.arr = [req.body.dep,req.body.emp_code,req.body.tag];
        } else if (req.body.dep_head == 'NDH') { //'ADMIN' != req.body.role && if admin add kare to
            obj.queryString += `and s_em_code = ?`;
            obj.arr.push(req.body.emp_code)
        };

        return obj;
    },

    submit_task: function (req, res) {
        obj = {};
        obj.queryString = `call submit_task( ? , ? , ? , ? , ? , ? , ? , ? , ? )`;
        obj.arr = [req.body.n_dep_id, req.body.s_em_code, req.body.d_start_date, req.body.d_due_date, req.body.s_task_name, req.body.s_task_desc, req.body.s_priority, req.body.s_status, req.body.s_created_by];
        return obj;
    },

    get_filtered_task: function (req, res) {
        obj = {};
        obj.queryString = `SELECT a.*,get_name_by_emp_code(a.s_created_by) as created_by,b.*,get_name_by_emp_code(b.s_em_code) as assign_to FROM tbl_task_header a left join tbl_task_transaction b  on a.n_task_id=b.n_task_id where  `;
        obj.arr = [req.body.emp_code, req.body.emp_code];
        if (req.body.filter_task != 'ALL') {
            if (req.body.filter_task == 'Self_Assigned') {
                obj.queryString += `  (b.s_em_code =? and a.s_created_by =?)  `;
            } else if (req.body.filter_task == 'Created_Task') {
                obj.queryString += `  (a.s_created_by =?)  `;
            } else {
                obj.queryString += ` (b.s_em_code =? or a.s_created_by =?) and a.s_status = ? `;
                obj.arr.push(req.body.filter_task);
            }
        } else {
            if (req.body.dep_head === 'NDH') {
                obj.queryString += `  a.s_status <> 'Return' and `;
            };
            obj.queryString += ` (b.s_em_code =? or a.s_created_by =?)   `;
        }
        obj.queryString += ` and a.s_status <> 'Drop' order by a.d_start_date `;
        return obj;
    },
    get_attachemnt: function (req, res) {
        obj = {};
        if (dbValidation.check_string_val(req.body.task_head, '') != '') {
            obj.queryString = `
                select * from tbl_attachment where n_task_id = ? `;
            obj.arr = [req.body.task_head];
        } else {
            obj.queryString = `
                select * from tbl_temp_attachment where s_em_code = ? `;
            obj.arr = [req.body.emp_code];
        }
        return obj;
    },

    delete_file: function (req, res) {
        obj = {};
        obj.queryString = `
                delete from tbl_temp_attachment where s_em_code = ? and n_temp_id = ? `;
        obj.arr = [req.body.emp_code, req.body.id];
        return obj;
    },


    get_task_by_id: function (req, res) {
        obj = {};
        obj.queryString = `
                SELECT a.*, b.* FROM tbl_task_header a left join tbl_task_transaction b on a.n_task_id = b.n_task_id where (b.s_em_code =? or a.s_created_by =?)  and a.n_task_id = ? order by a.d_start_date `;
        obj.arr = [req.body.emp_code, req.body.emp_code, req.body.id];
        return obj;
    },

    update_task: function (req, res) {
        obj = {};
        // update_task (statuss varchar(20), task_id int(11), remark varchar(400),em_code varchar(50)
        obj.queryString = `call update_task( ?, ?, ?, ?, ? );`;
        if (req.body.btn == 'drop_task_status') {
            req.body.s_status = 'Drop';
        };
        obj.arr = [req.body.s_status, req.body.task_id, req.body.s_remark, req.body.emp_code, req.body.ass_employee];
        return obj;
    },

    send_comment: function (req, res) {
        obj = {};
        obj.queryString = `call call_comment(?,?,?,?,?);`;
        if (req.body.tag == 'btn_add_comn') {
            req.body.tag = "I";
        }
        obj.arr = [req.body.tag, req.body.emp_code, req.body.task_id, req.body.s_comment, req.body.com_id];
        return obj;
    },

    get_comment: function (req, res) {
        obj = {};
        obj.queryString = `SELECT *,date_format(d_created_datetime , '%Y-%m-%d %r')  as created_datetime,get_name_by_emp_code(s_em_code) as emp_name FROM tbl_comment where n_task_id=? order by d_created_datetime asc`;
        obj.arr = [req.body.task_id];
        return obj;
    },

    delete_comment: function (req, res) {
        obj = {};
        obj.queryString = `DELETE FROM tbl_comment where n_task_id=? AND n_com_id=?`;
        obj.arr = [req.body.task_id, req.body.com_id];
        return obj;
    },

}