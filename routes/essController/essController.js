var dbqyeryexecute = require("./../../utils/dbqyeryexecute"); // this is for Query execution phase
var essSqlc = require("./essSqlc.js");
// var log4js = require('log4js');
// var log = log4js.getLogger("app");
// email service
var essEmail = require("./essEmailService"); // This is emailing .js
module.exports = {
  //from here response will get send
  get_location_list: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_location_list(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Department data found" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Department data found",
          data: record,
        });
      })
      .catch((err) => {
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  /* --------------------------Deaprtment Master--------------------------- */
  //For getting Dept Data
  getDeptList: function (req, res) {
    var Obj = essSqlc.getDeptList(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Department data found",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Department data found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for getting dept data by id
  getDeptById: function (req, res) {
    var Obj = essSqlc.getDeptById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Department data by id",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Department data by id",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for deleting dept data
  deleteDeptById: function (req, res) {
    var Obj = essSqlc.deleteDeptById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Deleting dept data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Deleting dept data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for updating dept data
  updateDept: function (req, res) {
    var Obj = essSqlc.updateDept(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Updating Dept Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Updating Dept Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for saving dept data
  saveDept: function (req, res) {
    var Obj = essSqlc.check_dept(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((records) => {
        var Obj = essSqlc.saveDept(req, res);
        if (records.length == 1 && records[0].cnt != 1) {
          dbqyeryexecute
            .executeSelect(Obj)
            .then((record) => {
              // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Saving Dept Data" });
              res.status(200).json({
                status: 200,
                mess: "Record Found !",
                mess_body: "Saving Dept Data",
                data: record,
              });
            })
            .catch((err) => {
              // log.error({ "status": 500, "mess": err.code, "mess_body": err.message });
              res.status(500).json({
                status: 500,
                mess: err.code,
                mess_body: err.message,
                data: err.message,
              });
            });
        } else {
          res.status(500).json({
            status: 500,
            mess: "Duplicate",
            mess_body: "Department Already Exists.",
          });
        }
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": err.code, "mess_body": err.message });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  /* --------------------------End Deaprtment Master--------------------------- */

  /* --------------------------Shift Master--------------------------- */
  //For getting Shift Data
  getShiftList: function (req, res) {
    var Obj = essSqlc.getShiftList(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Shift data found",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Shift data found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for getting Shift data by id
  getShiftById: function (req, res) {
    var Obj = essSqlc.getShiftById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Shift data by id",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Shift data by id",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for deleting Shift data
  deleteShiftById: function (req, res) {
    var Obj = essSqlc.deleteShiftById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Deleting Shift data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Deleting Shift data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for updating Shift data
  updateShift: function (req, res) {
    var Obj = essSqlc.updateShift(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Updating Shift Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Updating Shift Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for saving Shift data
  saveShift: function (req, res) {
    var Obj = essSqlc.saveShift(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Saving Shift Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Saving Shift Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  /* --------------------------End Shift Master--------------------------- */

  /* --------------------------Holiday Master--------------------------- */
  //For getting Holiday Data
  getHolidayList: function (req, res) {
    var Obj = essSqlc.getHolidayList(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Holiday data found",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Holiday data found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for getting Holiday data by id
  getHolidayById: function (req, res) {
    var Obj = essSqlc.getHolidayById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Holiday data by id",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Holiday data by id",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for deleting Holiday data
  deleteHolidayById: function (req, res) {
    var Obj = essSqlc.deleteHolidayById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Deleting Holiday data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Deleting Holiday data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for updating Holiday data
  updateHoliday: function (req, res) {
    var Obj = essSqlc.updateHoliday(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Updating Holiday Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Updating Holiday Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for saving Holiday data
  saveHoliday: function (req, res) {
    var Obj = essSqlc.saveHoliday(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Saving Holiday Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Saving Holiday Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  /* --------------------------End Holiday Master--------------------------- */

  /* --------------------------Emp Master--------------------------- */
  //For getting Emp Data
  getEmpList: function (req, res) {
    var Obj = essSqlc.getEmpList(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Emp data found",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Emp data found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  get_inactive_emp: function (req, res) {
    var Obj = essSqlc.get_inactive_emp(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Emp data found",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Emp data found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for getting Emp data by id
  getEmpById: function (req, res) {
    var Obj = essSqlc.getEmpById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Emp data by id",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Emp data by id",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for deleting Emp data
  deleteEmpById: function (req, res) {
    var Obj = essSqlc.deleteEmpById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Deleting Emp data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Deleting Emp data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for deactivate Emp data
  deactivateEmpById: function (req, res) {
    var Obj = essSqlc.deactivateEmpById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // change here done
        var sts = "";
        if (req.body.btn == "btn_deac") {
          sts = "INACTIVE";
        } else {
          sts = "ACTIVE";
        }
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: `${sts} Emp data`,
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for updating Emp data
  updateEmp: function (req, res) {
    var Obj = essSqlc.updateEmp(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Updating Emp Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Updating Emp Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for saving Emp data
  saveEmp: function (req, res) {
    var Obj = essSqlc.saveEmp(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Saving Emp Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Saving Employee Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
        });
      });
  },
  //for changing password
  changePassword: function (req, res) {
    var Obj = essSqlc.changePassword(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Password Changed !",
        //     "mess_body": "Password Changed",

        // });
        res.status(200).json({
          status: 200,
          mess: "Password Changed !",
          mess_body: "Password Changed",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  checkPassword: function (req, res) {
    var Obj = essSqlc.checkPassword(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Check Password !",
        //     "mess_body": "Check password",

        // });
        res.status(200).json({
          status: 200,
          mess: "Check Password !",
          mess_body: "Check password",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  /* --------------------------End Emp Master--------------------------- */

  /* --------------------------Assign Leave Master--------------------------- */
  //For getting Leave Data
  getLeaveList: function (req, res) {
    var Obj = essSqlc.getLeaveList(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Leave data found",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Leave data found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },

  //For getting AssignLeave Data
  getAssignLeaveList: function (req, res) {
    var Obj = essSqlc.getAssignLeaveList(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "AssignLeave data found",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "AssignLeave data found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for getting AssignLeave data by id
  getAssignLeaveById: function (req, res) {
    var Obj = essSqlc.getAssignLeaveById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "AssignLeave data by id",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "AssignLeave data by id",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for deleting AssignLeave data
  deleteAssignLeaveById: function (req, res) {
    var Obj = essSqlc.deleteAssignLeaveById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Deleting AssignLeave data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Deleting AssignLeave data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for updating AssignLeave data
  updateAssignLeave: function (req, res) {
    var Obj = essSqlc.updateAssignLeave(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Updating AssignLeave Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Updating AssignLeave Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for saving AssignLeave data
  saveAssignLeave: function (req, res) {
    var Obj = essSqlc.saveAssignLeave(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Saving AssignLeave Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Saving AssignLeave Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  /* --------------------------end Assign Leave Master--------------------------- */

  /* --------------------------Assign Shift Master--------------------------- */

  //For getting AssignShift Data
  getAssignShiftList: function (req, res) {
    var Obj = essSqlc.getAssignShiftList(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "AssignShift data found",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "AssignShift data found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for getting AssignShift data by id
  getAssignShiftById: function (req, res) {
    var Obj = essSqlc.getAssignShiftById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "AssignShift data by id",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "AssignShift data by id",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for deleting AssignShift data
  deleteAssignShiftById: function (req, res) {
    var Obj = essSqlc.deleteAssignShiftById(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Deleting AssignShift data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Deleting AssignShift data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for updating AssignShift data
  updateAssignShift: function (req, res) {
    var Obj = essSqlc.updateAssignShift(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Updating AssignShift Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Updating AssignShift Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  //for saving AssignShift data
  saveAssignShift: function (req, res) {
    var Obj = essSqlc.saveAssignShift(req, res);
    dbqyeryexecute
      .executeSelect(Obj)
      .then((record) => {
        // log.info({
        //     "status": 200,
        //     "mess": "Record Found !",
        //     "mess_body": "Saving AssignShift Data",

        // });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Saving AssignShift Data",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({
        //     "status": 500,
        //     "mess": err.code,
        //     "mess_body": err.message
        // });
        res.status(500).json({
          status: 500,
          mess: err.code,
          mess_body: err.message,
          data: err.message,
        });
      });
  },
  /* --------------------------end Assign Leave Master--------------------------- */

  // leave application flow

  get_emp_list: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_emp_list(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Employee Record Found" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Employee Record Found",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  get_leave_type_by_id: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_leave_type_by_id(req, res))
      .then((record) => {
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Saving Dept Data",
          data: record,
        });
      })
      .catch((err) => {
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  submit_leave: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.submit_leave(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Submitted !", "mess_body": "Submitted Successfully" });
        //
        // send email to reporting person
        if (record.length == 2 && record[0][0].rep_pers.search("@") != -1) {
          essEmail.leave_mail(req, res, "INSERT_LEAVE", record[0][0].rep_pers);
          // var res_text = record[0][0].rep_pers.search("NOT_ALLOW") != -1 ? "":"";
          setTimeout(() => {
            res.status(200).json({
              status: 200,
              mess: "Record Submitted !",
              mess_body: "Submitted Successfully",
            });
          }, 4000);
        } /* else if (record.length == 2 && record[0][0].rep_pers == "DURATION_NOT_ALLOW") {
                res.status(500).json({ "status": 500, "mess": record[0][0].rep_pers, "mess_body": "Day Duration Limit is more in Current Month limit" });
            } else if (record.length == 2 && record[0][0].rep_pers == "NOT_ALLOW") {
                res.status(500).json({ "status": 500, "mess": record[0][0].rep_pers, "mess_body": "Monthly Limit is exceeded." });
            } */ else {
          res.status(500).json({
            status: 500,
            mess: record[0][0].rep_pers,
            mess_body: "Ask your HR to assign a Reporting Person.",
          });
        }
      })
      .catch((err) => {
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  get_emp_myleave: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_emp_myleave(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Saving Dept Data" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Found Successfully",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  get_emp_approver_leave: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_emp_approver_leave(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Saving Dept Data" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Found Successfully",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  update_leave: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.update_leave(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": `Record ${req.body.status} !`, "mess_body": "Saving Dept Data" });

        if (record.length == 2 && record[1][0].requester_email) {
          setTimeout(() => {
            res.status(200).json({
              status: 200,
              mess: `Record ${req.body.status} !`,
              mess_body: `${req.body.status} Successfully`,
            });
          }, 1000);
          essEmail.leave_mail(req, res, "RESPONSE_LEAVE", record[1][0]);
        } else {
          res.status(500).json({
            status: 500,
            mess: err.code,
            mess_body: "Somthing went Wrong.",
          });
        }
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Updated !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  delete_rec: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.delete_rec(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Updated !", "mess_body": "Saving Dept Data" });
        res.status(200).json({
          status: 200,
          mess: "Record Updated !",
          mess_body: "Updated Successfully",
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Updated !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  view_leave: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.view_leave(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Saving Dept Data" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Found Successfully",
          data: record[0],
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  punch_in_out: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.punch_in_out(req, res))
      .then((record) => {
        var tag = "";
        if (req.body.tag == "PUNCH_OUT") {
          tag = "Out";
        } else {
          tag = "In";
        }
        // log.info({ "status": 200, "mess": `Punch ${tag} Done !`, "mess_body": `Punch ${tag} Successfully Done !` });
        res.status(200).json({
          status: 200,
          mess: `Punch ${tag} Done !`,
          mess_body: `Punch ${tag} Successfully Done !`,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  get_today_pucnch: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_today_pucnch(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting Punch Successfully Done !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Getting Punch-Out record Successfully found!",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  //get all assign leaves in details
  getEmpAssignLeave: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getEmpAssignLeave(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting Employee Assign Leave Successfully Done !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Getting Employee Assign Leave record Successfully found!",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  //get all assign task in detal
  getEmpAssignTask: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getEmpAssignTask(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting Employee Assign Task Successfully Done !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Getting Employee Assign Task record Successfully found!",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  //get all todays employee attendance in detal
  getEmpAttend: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getEmpAttend(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting Employee todays attendance Successfully Done !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            "Getting Employee todays attendance record Successfully found!",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  //get all todays employee attendance in detal
  getEmpAttend_report: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getEmpAttend_report(req, res))
      .then((record) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting Employee todays attendance Successfully Done !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            "Getting Employee todays attendance record Successfully found!",
          data: record,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  get_dash_data_a: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_dash_data_a(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body: "Getting All Record",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  get_task_report_for_DH: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_task_report_for_DH(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  get_emp_list_by_dept_by_em_code: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.get_emp_list_by_dept_by_em_code(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  saveactivitytask: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.saveactivitytask(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  savetasks: function (req, res) {
    dbqyeryexecute
      .executeMultiple(essSqlc.savetasks(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  getactivitytask: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getactivitytask(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  gettaskbyactid: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.gettaskbyactid(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  saveprojectdetails: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.saveprojectdetails(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "Project Saved!!",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  getprojectdetails: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getprojectdetails(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "Project Saved!!",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  getactivitylist: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getactivitylist(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  getallprojectlistdd: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getallprojectlistdd(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },

  getprojectactivity: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.getprojectactivity(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  gettaskactivity: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.gettaskactivity(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  savetimedetails: function (req, res) {
    dbqyeryexecute
      .executeMultiple(essSqlc.savetimedetails(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",

          mess_body:
            records.length > 0
              ? "Getting All Record"
              : "TimeSheet Saved SuccessFully",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  gettimesheetdetails: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.gettimesheetdetails(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  gettimesheetreport: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.gettimesheetreport(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0 ? "Getting All Record" : "No task data found",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
  submitdraftdata: function (req, res) {
    dbqyeryexecute
      .executeSelect(essSqlc.submitdraftdata(req, res))
      .then((records) => {
        // log.info({ "status": 200, "mess": "Record Found !", "mess_body": "Getting All Record !" });
        res.status(200).json({
          status: 200,
          mess: "Record Found !",
          mess_body:
            records.length > 0
              ? "Getting All Record"
              : "Submitted Successfully",
          data: records,
        });
      })
      .catch((err) => {
        // log.error({ "status": 500, "mess": "Error Found !", "mess_body": err.message });
        res
          .status(500)
          .json({ status: 500, mess: err.code, mess_body: err.message });
      });
  },
};
