var express = require('express');
var ess_task_Ctrl = require('./ess_task_Controller.js');

var ess_task_Routes = express.Router();
//-----------------------------------Developed by Shikha-----------------------------------

// task managemnt 
ess_task_Routes.route('/get_dept_list').post(ess_task_Ctrl.get_dept_list);
ess_task_Routes.route('/get_emp_list_by_dept').post(ess_task_Ctrl.get_emp_list_by_dept); //get dep_list
ess_task_Routes.route('/submit_task').post(ess_task_Ctrl.submit_task);
ess_task_Routes.route('/get_filtered_task').post(ess_task_Ctrl.get_filtered_task);

// attachements
ess_task_Routes.route('/get_attachemnt').post(ess_task_Ctrl.get_attachemnt);
ess_task_Routes.route('/delete_file').post(ess_task_Ctrl.delete_file);


//edit by id
ess_task_Routes.route('/get_task_by_id').post(ess_task_Ctrl.get_task_by_id);
ess_task_Routes.route('/update_task').post(ess_task_Ctrl.update_task);


// comments
ess_task_Routes.route('/send_comment').post(ess_task_Ctrl.send_comment);
ess_task_Routes.route('/get_comment').post(ess_task_Ctrl.get_comment);

module.exports = ess_task_Routes;