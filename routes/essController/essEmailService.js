var email = require("emailjs");
var mailserver = email.server.connect({
    user: "noreply@ultratechindia.com",
    password: "Ultra@2021",
    host: "smtp.gmail.com",
    port: 465,
    ssl: true
});

module.exports = {
    // leave mangemnt 
    leave_mail: function (req, res, tag, email_list) {
        var email_to = "";
        var html = ''; var sub = '', ccmail = [];
        if (tag == 'INSERT_LEAVE') {
            email_list=email_list.split("||")[0];
            email_list = Array.from(new Set(email_list.split(':'))).toString();
            email_list = email_list.split(",")
            for (let i = 0; i < email_list.length; i++) {
                if (i === 0) {
                    email_to = email_list[i];
                } else {
                    if (email_list[i] != "") {
                        ccmail.push(email_list[i]);
                    }
                }
            }

            html = `
                <!doctype html>
                <html lang="en-US">
                <head>
                    <meta charset="utf-8"> 
                </head>
                    <style>
                    a:hover { text-decoration: underline !important;}
                    </style>
                <body  marginheight="0" topmargin="0" marginwidth="0" style="margin: 0px; background-color: #f2f8f9;" leftmargin="0">
                    <table cellspacing="0" border="0" cellpadding="0" width="100%" bgcolor="#f2f8f9" style="@import url(https://fonts.googleapis.com/css?family=Roboto:300,400,500); font-family: 'Roboto', sans-serif , Arial, Helvetica, sans-serif;">
                        <tr>
                            <td>
                                <table style="background-color: #f2f8f9; max-width:670px; margin:0 auto;" width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="height:80px;">&nbsp;</td>
                                    </tr>
                                    <!-- Logo -->
                                     <tr>
                                        <td style="text-align:center;">
                                            <a href="http://www.ultratechindia.com/" title="ultratechindia">
                                            <img  src="http://www.ultratechindia.com/" alt="Ultratech India" title="Ultratech India" ></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height:40px;">&nbsp;</td>
                                    </tr>
                                    <!-- Email Content -->
                                    <tr>
                                        <td>
                                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="max-width:670px; background:#fff; border-radius:3px; -webkit-box-shadow:0 1px 3px 0 rgba(0, 0, 0, 0.16), 0 1px 3px 0 rgba(0, 0, 0, 0.12);-moz-box-shadow:0 1px 3px 0 rgba(0, 0, 0, 0.16), 0 1px 3px 0 rgba(0, 0, 0, 0.12);box-shadow:0 1px 3px 0 rgba(0, 0, 0, 0.16), 0 1px 3px 0 rgba(0, 0, 0, 0.12); padding:0 40px;">
                                                <tr>
                                                    <td style="height:40px;">&nbsp;</td>
                                                </tr>
                                                <!-- Title -->
                                                <tr>
                                                    <td style="padding:0 15px; text-align:center;">
                                                        <h1 style="color:#3075BA; font-weight:400; margin:0;font-size:32px;">Leave Application</h1>
                                                        <span style="display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; 
                                                        width:100px;"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height:40px;">
                                                        <h3>Hi,</h3>
                                                        <blockquote>This is to inform you that Mr/Ms/Mrs has been applied for leave.<br>
                                                            Kindly approve the same<blockquote>
                                                    </td>
                                                </tr>
                                                <!-- Details Table -->
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" style="width: 100%; border: 1px solid #ededed">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; border-right: 1px solid #ededed; width: 35%; font-weight:500; color:#171f23de">Employee Code:</td>
                                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; color: rgba(23,31,35,.87);" >${req.body.s_em_code}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed;border-right: 1px solid #ededed; width: 35%; font-weight:500; color:#171f23de">Leave Type:</td>
                                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; color: rgba(23,31,35,.87);">${req.body.s_leave_type}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding: 10px;  border-bottom: 1px solid #ededed; border-right: 1px solid #ededed; width: 35%;font-weight:500; color:#171f23de">Start Date:</td>
                                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; color: rgba(23,31,35,.87);">${req.body.d_start_date}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; border-right: 1px solid #ededed; width: 35%;font-weight:500; color:#171f23de">End Date:</td>
                                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; color: rgba(23,31,35,.87); ">${req.body.d_end_date == "" ? "-" : req.body.d_end_date}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding: 10px; border-right: 1px solid #ededed; width: 35%;font-weight:500; color:#171f23de">Reason:</td>
                                                                    <td style="padding: 10px; color: rgba(23,31,35,.87);">${req.body.s_reason}</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height:40px;">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td style="height:20px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>Thanks & Regards</p><br>
                                            <p style="font-size:14px; color:#455056bd; line-height:18px; margin:0 0 0;"><b>Note:</b>*** This is a system generated email, please do not reply. ***</p>
                                        </td>
                                    </tr> 
                                </table>
                            </td>
                        </tr>
                    </table>
                </body>
                </html> `;
            sub = `Leave application requested by employee` // '${req.body.s_leave_type}'
        } else if (tag === "RESPONSE_LEAVE") {
            email_to = email_list.requester_email;
            sub = `Leave application is '${email_list.s_leave_status}'`
            html = `Hi,<br>`;
            if (email_list.s_leave_status == 'Approved') {
                html += `<b>Congratulations your leave request has <i>Approved</i></b>`;
            } else {
                html += `<b>Your leave request has been <i>Rejected</i></b>`;
            };

            html += `<br><br>With Regards,<br><font color='red'><b>Note:</b>*** This is a system generated email, please do not reply. ***`;
            ccmail = '';
        };

        mailserver.send({
            from: "kamal.yadav@apponext.com",
            to: "kamal.yadav@apponext.com", // email_to, 
            // to: email_to,
            // cc: ccmail.toString(),
            subject: sub,
            attachment:
                [
                    { data: html, alternative: true },

                ]
        },
            function (err, message) {
                if (err) {
                    console.log(err);
                    return;
                }
                console.log(message);
            });
    },
    // task managemnt 
    task_email: function (records) {
        var email = "";
        var html = ''; var sub = '';
        email = records[0].dep_head_email;
        if (email == '' || email == null || email == undefined) {
            return;
        };
        // dep wise mail trigger to Head 
        // query = 
        // select a.n_task_id,getDeptById(a.n_dep_id) as dep_name,get_email_by_emp_code(get_dept_head_by_id(a.n_dep_id)) as dep_head_email,a.d_start_date,current_date() - interval 1 day,a.d_due_date,a.s_task_name,a.s_priority ,get_email_by_emp_code(b.s_em_code) as email,get_profile(b.s_em_code) as profile,a.s_status from tbl_task_header a,tbl_task_transaction b where a.n_task_id=b.n_task_id and a.s_status=b.s_status  and cast(a.d_due_date as date) <= current_date() - interval 1 day  and a.s_status = 'Return'  group by a.n_dep_id,a.n_task_id order by a.n_dep_id desc; 
        var data = records;
        /* [
            {
                "n_task_id": 7,
                "dep_name": "Finance, HR, & Administration",
                "dep_head_email": "SHIKHA.DWIVEDI@APPONEXT.COM",
                "d_start_date": "2021-10-04",
                "d_due_date": "2021-10-06",
                "s_task_name": "To-do lists",
                "s_priority": "Important",
                "email": "KAMAL.YADAV@APPONEXT.COM",
                "profile": "../assets/img/avatars/1631188197295-pexels-photo-771742.jpeg"
            },
            {
                "n_task_id": 10,
                "dep_name": "Finance, HR, & Administration",
                "dep_head_email": "SHIKHA.DWIVEDI@APPONEXT.COM",
                "d_start_date": "2021-10-06",
                "d_due_date": "2021-10-06",
                "s_task_name": "To-do lists2",
                "s_priority": "Important",
                "email": "SACHIN.KANWAR@APPONEXT.COM",
                "profile": null
            }
        ] */
        email = email_to;
        // var email = email_to;
        var html = `<!doctype html>
        <html lang="en-US">

        <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <title>ESS Task List</title> 
        <style type="text/css">
        a:hover {
        text-decoration: none !important;
        }

        :focus {
        outline: none;
        border: 0;
        }
        </style>
        </head>

        <body marginheight="0" topmargin="0" marginwidth="0" style="margin: 0px; background-color: #f2f8f9;" bgcolor="#eaeeef" leftmargin="0">
        <!--100% body table-->
        <table cellspacing="0" border="0" cellpadding="0" width="100%" bgcolor="#f2f8f9" style="@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300); font-family: 'Roboto', sans-serif , Arial,  Helvetica, sans-serif;">
        <tr>
        <td>
        <table style="background-color: #f2f8f9; max-width:670px; margin:0 auto;" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
        <td style="height:80px;">&nbsp;</td>
        </tr> 
        <!-- Logo -->
        <tr>
        <td style="text-align:center;">
        <a href="http://www.ultratechindia.com/" title="ultratechindia">
        <img  src="http://www.ultratechindia.com/" alt="Ultratech India" title="Ultratech India" ></a>
        </td>
        </tr>
        <tr>
        <td height="40px;">&nbsp;</td>
        </tr>
        <tr>
        <td>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0"
        style="max-width:600px; background:#fff; border-radius:3px; text-align:left; -webkit-box-shadow:0 1px 3px 0 rgba(0, 0, 0, 0.16), 0 1px 3px 0 rgba(0, 0, 0, 0.12);-moz-box-shadow:0 1px 3px 0 rgba(0, 0, 0, 0.16), 0 1px 3px 0 rgba(0, 0, 0, 0.12);box-shadow:0 1px 3px 0 rgba(0, 0, 0, 0.16), 0 1px 3px 0 rgba(0, 0, 0, 0.12)">
        <tr>
            <td style="padding:40px;">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <h1
                                style="color: #3075BA; font-weight: 400; margin: 0; font-size: 32px;">
                                Dear Sir/Madam,</h1>

                            <p
                                style="font-size:15px; color:#171f23de; line-height:24px; margin:8px 0 30px;">
                                Here's a list of Return activities which needs your attention.
                                    <!-- Here is the summary of the task completed today and WIP -->
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">`;
        data.forEach((element, i) => {
            var color = 'black';
            if (element.s_priority == 'Important') {
                color = 'Red';
            } else if (element.s_priority == 'Medium') {
                color = 'Green';
            } else if (element.s_priority == 'Low') {
                color = 'blue';
            }
            html += `
                    <tr style="border-bottom:1px solid #ebebeb; margin-bottom:26px; padding-bottom:29px; display:block;">
                        <td width="84">
                            <a href="http://localhost:9000/main#/tasks?task_key=${element.n_task_id}" style="height:64px;width: 83px;text-align:center;display:block;margin-top: 16px;margin-right: 16px;"> 
                                #T${element.n_task_id}
                            </a>
                        </td>
                        <td style="vertical-align:top;">
                            <h3 style="color: #4d4d4d; font-size: 20px; font-weight: 400; line-height: 30px; margin-bottom: 3px; margin-top:0;"><a href="http://localhost:9000/main#/tasks?task_key=${element.n_task_id}"> ${element.s_task_name}</a></h3>
                            <span style="color:#737373; font-size:14px;">Created Date : ${element.d_start_date}</span>
                            <span style="color:#737373; font-size:14px;">Due Date : ${element.d_due_date}</span>
                            <br>
                            <span style="color:#737373; font-size:14px;">Priority : <b style="color:${color}">${element.s_priority}</b></span>
                        </td>
                    </tr>`;
            });
            html += `</table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="height:25px;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <p>With Regards, <p>
                                    <p style="font-size:14px; color:#455056bd; line-height:18px; margin:0 0 0;">
                                        <font color='red'><b>Note:</b>*** This is a system generated email, please do not reply. *** 
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="height:80px;">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!--/100% body table-->
            </body> 
            </html>`;
        sub = `Total #${data.length} Return Task List of previous day`
        mailserver.send({
            from: "kamal.yadav@apponext.com",
            to: "kamal.yadav@apponext.com", // 'hrd@ultratechindia.com', 
            // bcc: email+",kamal.yadav@apponext.com", //ccmail,
            subject: sub,
            attachment:
                [
                    { data: html, alternative: true },
                ]
        },
            function (err, message) {
                if (err) {
                    console.log(err);
                    return;
                }
                console.log(message);
            });
    },

}