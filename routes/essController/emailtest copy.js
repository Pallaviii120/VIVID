var email = require("emailjs");
var path = require("path");
var mailserver = email.server.connect({
    user: "kamalyadav0510@gmail.com",
    password: "Psgkassss@123",
    host: "smtp.gmail.com",
    port: 465,
    ssl: true
});


// var data = [ 
//         {
//           "n_task_id": 1,
//           "dep_name": "Finance, HR, & Administration",
//           "dep_head_email": "SHIKHA.DWIVEDI@APPONEXT.COM",
//           "d_start_date": "2021-10-02",
//           "d_due_date": "2021-10-02",
//           "s_task_name": "Task 1",
//           "s_priority": "Low",
//           "email": "KAMAL.YADAV@APPONEXT.COM",
//           "profile": "../assets/img/avatars/1631188197295-pexels-photo-771742.jpeg",
//           "s_status": "Return"
//         },
//         {
//           "n_task_id": 5,
//           "dep_name": "Finance, HR, & Administration",
//           "dep_head_email": "SHIKHA.DWIVEDI@APPONEXT.COM",
//           "d_start_date": "2021-10-01",
//           "d_due_date": "2021-10-01",
//           "s_task_name": "My task Completed",
//           "s_priority": "Medium",
//           "email": "KAMAL.YADAV@APPONEXT.COM",
//           "profile": "../assets/img/avatars/1631188197295-pexels-photo-771742.jpeg",
//           "s_status": "Return"
//         }
//        ] ;
// var email = email_to;
var html =  `  
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
                            <img  src="cid:logo@apponext.ee" alt="Ultratech India" title="Ultratech India" ></a>
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
                                <!-- Details Table -->
                                

                                <tr>
                                    <td style="height:40px;">
                                        <h3>Hi,</h3>
                                        <blockquote>This is to inform you that Mr/Ms/Mrs has been applied for leave.<br>
                                            Kindly approve the same<blockquote>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" style="width: 100%; border: 1px solid #ededed">
                                            <tbody>
                                                <tr>
                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; border-right: 1px solid #ededed; width: 35%; font-weight:500; color:#171f23de">Employee Code:</td>
                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; color: rgba(23,31,35,.87);" >text here</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed;border-right: 1px solid #ededed; width: 35%; font-weight:500; color:#171f23de">Leave Type:</td>
                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; color: rgba(23,31,35,.87);">text here</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 10px;  border-bottom: 1px solid #ededed; border-right: 1px solid #ededed; width: 35%;font-weight:500; color:#171f23de">Start Date:</td>
                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; color: rgba(23,31,35,.87);">text here</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; border-right: 1px solid #ededed; width: 35%;font-weight:500; color:#171f23de">End Date:</td>
                                                    <td style="padding: 10px; border-bottom: 1px solid #ededed; color: rgba(23,31,35,.87); ">text here</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 10px; border-right: 1px solid #ededed; width: 35%;font-weight:500; color:#171f23de">Reason:</td>
                                                    <td style="padding: 10px; color: rgba(23,31,35,.87);">text here</td>
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
                        <td style="text-align:center;">
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
sub = `Leave application requested by employee`;
// var resources = path.join(__dirname, '');
mailserver.send({
    from: "kamal.yadav@apponext.com",
    to: "kamal.yadav@apponext.com",
    subject: sub,
    attachment:
        [
            { data: html, alternative: true },
            {
                filename: 'logo.png',
                path: `${__dirname}/logo.png`,
                cid: 'logo@apponext.ee',
             },
        ]
},
    function (err, message) {
        if (err) {
            console.log(err);
            return;
        }
        console.log(message);
    });