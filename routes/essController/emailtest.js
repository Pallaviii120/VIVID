var email = require("emailjs");
var mailserver = email.server.connect({
    user: "kamalyadav0510@gmail.com",
    password: "Psgkassss@123",
    host: "smtp.gmail.com",
    port: 465,
    ssl: true
});


var data = [ 
        {
          "n_task_id": 1,
          "dep_name": "Finance, HR, & Administration",
          "dep_head_email": "SHIKHA.DWIVEDI@APPONEXT.COM",
          "d_start_date": "2021-10-02",
          "d_due_date": "2021-10-02",
          "s_task_name": "Task 1",
          "s_priority": "Low",
          "email": "KAMAL.YADAV@APPONEXT.COM",
          "profile": "../assets/img/avatars/1631188197295-pexels-photo-771742.jpeg",
          "s_status": "Return"
        },
        {
          "n_task_id": 5,
          "dep_name": "Finance, HR, & Administration",
          "dep_head_email": "SHIKHA.DWIVEDI@APPONEXT.COM",
          "d_start_date": "2021-10-01",
          "d_due_date": "2021-10-01",
          "s_task_name": "My task Completed",
          "s_priority": "Medium",
          "email": "KAMAL.YADAV@APPONEXT.COM",
          "profile": "../assets/img/avatars/1631188197295-pexels-photo-771742.jpeg",
          "s_status": "Return"
        }
       ] ;
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
                   
                    <tr>
                        <td style="text-align:center;">
                            <a href="http://www.ultratechindia.com/" title="ultratechindia">
                            <img  src="http://13.233.106.102:8983/assets/img/logo.png" alt="Ultratech India" title="Ultratech India" ></a>
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
                                                        <!-- Here's a list of Return activities which needs your attention. -->
                                                        Here is the summary of the task completed today and WIP
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">`;
                                                data.forEach((element,i) => { 
                                                    var color = 'black';
                                                    if(element.s_priority == 'Important'){
                                                        color = 'Red';
                                                    }else if(element.s_priority == 'Medium'){
                                                        color = 'Green';
                                                    }else if(element.s_priority == 'Low'){
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

</html> `;
sub = `Return #${data.length} Task List of previous day`
console.log(html)
mailserver.send({
    from: "kamal.yadav@apponext.com",
    to: "kamal.yadav@apponext.com",
    subject: sub,
    attachment:
        [
            { data: html, alternative: true }
        ]
},
    function (err, message) {
        if (err) {
            console.log(err);
            return;
        }
        console.log(message);
    });