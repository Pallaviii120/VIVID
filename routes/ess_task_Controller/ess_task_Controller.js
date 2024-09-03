var dbqyeryexecute = require("./../../utils/dbqyeryexecute"); // this is for Query execution phase
var ess_task_Sqlc = require("./ess_task_Sqlc.js");
var con = require("./../../config/config"); // this is for Query execution phase with COnnection
//var con = config.connection;

// var log4js = require('log4js');
// var log = log4js.getLogger("app");
//var jwtauth = require("./essVerifyToken")
module.exports = {
    //from here response will get send 
    get_dept_list: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.get_dept_list(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !", data: record });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },
    get_emp_list_by_dept: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.get_emp_list_by_dept(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !" });
            var mes='';
            if(record.length ==0){
               mes =  "No Record Found !";
            }else{
                mes =  "Record Found Successfully !";
            }
            res.status(200).json({ "status": 200, "mess": "Record Found !", "mess_body":mes, data: record });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },
    submit_task: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.submit_task(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Save !", "mess_body": "Record Save Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record Save !", "mess_body": "Record Save Successfully !" });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },
    get_filtered_task: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.get_filtered_task(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !", data: record });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },


    get_attachemnt: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.get_attachemnt(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !", data: record });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },

    delete_file: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.delete_file(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Deleted !", "mess_body": "Record Deleted Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record Deleted !", "mess_body": "Record Deleted Successfully !" });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },


    get_task_by_id: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.get_task_by_id(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !", data: record[0] });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },

    update_task: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.update_task(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Updated !", "mess_body": "Record Updated Successfully !" });
            let sts = "Status Updated Successfully !"
            if (req.body.btn == 're_assign_task') {
                sts = "Task Reassign Successfully !"
            };

            res.status(200).json({ "status": 200, "mess": "Record Updated !", "mess_body": sts });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Updated !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },

    send_comment: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.send_comment(req, res)).then(record => {
            let action = '';
            if (req.body.tag == "I") {
                action = 'Inserted';
            } else if (req.body.tag == "D") {
                action = 'Deleted';
            }
            // log.info({ "status": 200, "mess": "Record " + action + " !", "mess_body": "Record " + action + " Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record " + action + " !", "mess_body": "Comment " + action + " Successfully !" });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Updated !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },

    get_comment: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.get_comment(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Record Found Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record Found !", "mess_body": "Comment Found Successfully !", data: record });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Updated !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },

    delete_comment: function (req, res) {
        dbqyeryexecute.executeSelect(ess_task_Sqlc.delete_comment(req, res)).then(record => {
            // log.info({ "status": 200, "mess": "Record Deleted !", "mess_body": "Comment Deleted Successfully !" });
            res.status(200).json({ "status": 200, "mess": "Record Deleted !", "mess_body": "Comment Deleted Successfully !", data: record });
        })
            .catch(err => {
                // log.error({ "status": 500, "mess": "Error Updated !", "mess_body": err.message });
                res.status(500).json({ "status": 500, "mess": err.code, "mess_body": err.message });
            });
    },
}