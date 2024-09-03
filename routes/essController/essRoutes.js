var express = require("express");
var essCtrl = require("./essController.js");

var essRoutes = express.Router();
//-----------------------------------Developed by Shikha-----------------------------------

essRoutes.route("/get_location_list").post(essCtrl.get_location_list); // get all location
/* -------------------------------------department master------------------- */
essRoutes.route("/getDeptList").post(essCtrl.getDeptList); // Get all department data
essRoutes.route("/getDeptById").post(essCtrl.getDeptById); // getting dept data by id
essRoutes.route("/deleteDeptById").post(essCtrl.deleteDeptById); // for deleting dept data
essRoutes.route("/updateDept").post(essCtrl.updateDept); // for updating dept data
essRoutes.route("/saveDept").post(essCtrl.saveDept); // for saving dept data
/* -------------------------------------end department master------------------- */

/* -------------------------------------Shift master------------------- */
essRoutes.route("/getShiftList").post(essCtrl.getShiftList); // Get all Shift data
essRoutes.route("/getShiftById").post(essCtrl.getShiftById); // getting Shift data by id
essRoutes.route("/deleteShiftById").post(essCtrl.deleteShiftById); // for deleting Shift data
essRoutes.route("/updateShift").post(essCtrl.updateShift); // for updating Shift data
essRoutes.route("/saveShift").post(essCtrl.saveShift); // for saving Shift data
/* -------------------------------------end Shift master------------------- */

/* -------------------------------------Holiday master------------------- */
essRoutes.route("/getHolidayList").post(essCtrl.getHolidayList); // Get all Holiday data
essRoutes.route("/getHolidayById").post(essCtrl.getHolidayById); // getting Holiday data by id
essRoutes.route("/deleteHolidayById").post(essCtrl.deleteHolidayById); // for deleting Holiday data
essRoutes.route("/updateHoliday").post(essCtrl.updateHoliday); // for updating Holiday data
essRoutes.route("/saveHoliday").post(essCtrl.saveHoliday); // for saving Holiday data
/* -------------------------------------end Holiday master------------------- */

/* -------------------------------------Emp master------------------- */
essRoutes.route("/getEmpList").post(essCtrl.getEmpList); // Get all Emp data
essRoutes.route("/getEmpById").post(essCtrl.getEmpById); // getting Emp data by id
essRoutes.route("/deleteEmpById").post(essCtrl.deleteEmpById); // for deleting Emp data
essRoutes.route("/deactivateEmpById").post(essCtrl.deactivateEmpById); // for deactivate Emp data
essRoutes.route("/updateEmp").post(essCtrl.updateEmp); // for updating Emp data
essRoutes.route("/saveEmp").post(essCtrl.saveEmp); // for saving Emp data
essRoutes.route("/get_inactive_emp").post(essCtrl.get_inactive_emp); // get oinactive emp

essRoutes.route("/changePassword").post(essCtrl.changePassword); // for saving Emp data
essRoutes.route("/checkPassword").post(essCtrl.checkPassword); // for saving Emp data
/* -------------------------------------end Emp master------------------- */

/* --------------------------- Assign Leave -------------------------- */
essRoutes.route("/getLeaveList").post(essCtrl.getLeaveList); // Get all Leave data

essRoutes.route("/getAssignLeaveList").post(essCtrl.getAssignLeaveList); // Get all Assign Leave data
essRoutes.route("/getAssignLeaveById").post(essCtrl.getAssignLeaveById); // Get all Assign Leave data
essRoutes.route("/deleteAssignLeaveById").post(essCtrl.deleteAssignLeaveById); // delete Assign Leave data
essRoutes.route("/updateAssignLeave").post(essCtrl.updateAssignLeave); // for updating AssignLeave data
essRoutes.route("/saveAssignLeave").post(essCtrl.saveAssignLeave); // for saving AssignLeave data
/* --------------------------- End Assign Leave -------------------- */

/* --------------------------- Assign Shift -------------------------- */

essRoutes.route("/getAssignShiftList").post(essCtrl.getAssignShiftList); // Get all Assign Shift data
essRoutes.route("/getAssignShiftById").post(essCtrl.getAssignShiftById); // Get all Assign Shift data
essRoutes.route("/deleteAssignShiftById").post(essCtrl.deleteAssignShiftById); // delete Assign Shift data
essRoutes.route("/updateAssignShift").post(essCtrl.updateAssignShift); // for updating AssignShift data
essRoutes.route("/saveAssignShift").post(essCtrl.saveAssignShift); // for saving AssignShift data

/* --------------------------- End Assign Shift -------------------- */

// leave transaction

essRoutes.route("/get_emp_list").post(essCtrl.get_emp_list); //get emp details
essRoutes.route("/get_leave_type_by_id").post(essCtrl.get_leave_type_by_id);
essRoutes.route("/submit_leave").post(essCtrl.submit_leave);
essRoutes.route("/get_emp_myleave").post(essCtrl.get_emp_myleave);
essRoutes.route("/get_emp_approver_leave").post(essCtrl.get_emp_approver_leave);
essRoutes.route("/update_leave").post(essCtrl.update_leave);
essRoutes.route("/delete_rec").post(essCtrl.delete_rec);
essRoutes.route("/view_leave").post(essCtrl.view_leave);

// punch in
essRoutes.route("/punch_in_out").post(essCtrl.punch_in_out);
essRoutes.route("/get_today_pucnch").post(essCtrl.get_today_pucnch);

//Emp dashboard data

essRoutes.route("/getEmpAssignLeave").post(essCtrl.getEmpAssignLeave);
essRoutes.route("/getEmpAssignTask").post(essCtrl.getEmpAssignTask);

essRoutes.route("/getEmpAttend").post(essCtrl.getEmpAttend);
essRoutes.route("/getEmpAttend_report").post(essCtrl.getEmpAttend_report);

// admin dashboard
essRoutes.route("/get_dash_data_a").post(essCtrl.get_dash_data_a);

// deaprtment head repost task
essRoutes.route("/get_task_report_for_DH").post(essCtrl.get_task_report_for_DH);
essRoutes
  .route("/get_emp_list_by_dept_by_em_code")
  .post(essCtrl.get_emp_list_by_dept_by_em_code);
essRoutes.route("/saveactivitytask").post(essCtrl.saveactivitytask);
essRoutes.route("/savetasks").post(essCtrl.savetasks);
essRoutes.route("/getactivitytask").post(essCtrl.getactivitytask);
essRoutes.route("/gettaskbyactid").post(essCtrl.gettaskbyactid);
essRoutes.route("/saveprojectdetails").post(essCtrl.saveprojectdetails);
essRoutes.route("/getprojectdetails").post(essCtrl.getprojectdetails);
essRoutes.route("/getactivitylist").post(essCtrl.getactivitylist);
essRoutes.route("/getallprojectlist").post(essCtrl.getallprojectlistdd);
essRoutes.route("/getprojectactivity").post(essCtrl.getprojectactivity);
essRoutes.route("/gettaskactivity").post(essCtrl.gettaskactivity);
essRoutes.route("/savetimedetails").post(essCtrl.savetimedetails);
essRoutes.route("/gettimesheetdetails").post(essCtrl.gettimesheetdetails);
essRoutes.route("/gettimesheetreport").post(essCtrl.gettimesheetreport);
essRoutes.route("/submitdraftdata").post(essCtrl.submitdraftdata);
module.exports = essRoutes;
