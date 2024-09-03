const express = require("express");
const bodyParser = require("body-parser");
const session = require("express-session");
http = require("http");
const fs = require("fs");
const formidable = require("formidable");
const csv = require("csvtojson");
var csvToJson = require("convert-csv-to-json");
// var log4js = require('log4js');

const busboy = require("connect-busboy");
var path = require("path");
const app = express();

app.set("views", __dirname + "/public"); // Main Entrance of project
app.use(express.static(__dirname + "/public")); // Main Entrance of Doctor
app.use(express.static(__dirname + "/public/assets")); // Main Entrance of Doctor
app.use(express.static(__dirname + "/utils")); // Main Entrance of Doctor
app.use(express.static(__dirname + "/uploads")); // Main Entrance of Doctor

// log4js.configure('./config/log4js.json');

app.use(
  busboy({
    // This is BusBoy File Uploadiing MiddelWare
    highWaterMark: 2 * 1024 * 1024, // Set 2MiB buffer
  })
); // Insert the busboy middle-ware

app.set("view engine", "ejs"); //extension of views
// app.use(bodyParser({
//   limit: '50mb'
// }));
app.use(
  bodyParser.json({
    limit: "50mb",
    extended: true,
  })
); // this is 4 Json Data
app.use(
  bodyParser.urlencoded({
    limit: "50mb",
    extended: true,
    parameterLimit: 1000000000,
  })
);
//app.use(bodyParser.urlencoded({ extended: false }));
app.use(
  session({
    secret: "ssshhhhh",
  })
);

app.use(function (req, res, next) {
  // Website you wish to allow to connect
  res.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:9001/");

  // Request methods you wish to allow
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, PATCH, DELETE"
  );

  // Request headers you wish to allow
  res.setHeader(
    "Access-Control-Allow-Headers",
    "X-Requested-With,content-type,application-json"
  );

  // Set to true if you need the website to include cookies in the requests sent
  // to the API (e.g. in case you use sessions)
  res.setHeader("Access-Control-Allow-Credentials", true);

  // Pass to next layer of middleware
  next();
});

var config = require("./config/config.js"); //this is server configuration file.
// var con = config.connection; // DB conectivity

// global variable
var sess;
// var date = Date.now();  // current datetime
/*******Login Page******/

// var log = log4js.getLogger("app");
// routes goes here
// var project_admin = require('./utils/route_goes_here');
// app.use('/dashboard', project_admin)
// app.use(log4js.connectLogger(log4js.getLogger("http"), {
//     level: 'auto'
// }));
// Url Routes goes here
var essRoutes = require("./routes/essController/essRoutes");
app.use("/ess", essRoutes);
// task management
var ess_task_Routes = require("./routes/ess_task_Controller/ess_task_Routes");
app.use("/task", ess_task_Routes);

var con = require("./utils/dbqyeryexecute").executeSelect;
var conmul = require("./utils/dbqyeryexecute").executeMultiple;

var extraCode = require("./utils/extraCode");

app.use(function (req, res, next) {
  const { rawHeaders, httpVersion, method, socket, url } = req;
  const { remoteAddress, remoteFamily } = socket;
  // log.info(`Incoming request`,
  //     JSON.stringify({ timestamp: Date.now(), rawHeaders, httpVersion, method, remoteAddress, remoteFamily, url })
  // )
  next();
});
app.get("/", function (req, res) {
  res.sendfile("./public/index.html");
});

app.get("/kamal", function (req, res) {
  res.send("kamal");
});

// var jwt = require('jsonwebtoken');

app.post("/login", function (req, res) {
  var user_name = req.body.username;
  var password = req.body.password;
  var obj = {};
  obj.queryString =
    "SELECT * FROM tbl_employee WHERE s_em_code =? and s_em_password=md5(?)";
  obj.arr = [user_name, password];
  con(obj)
    .then((data) => {
      if (data.length == 0) {
        // log.warn({ "status": 400, "mess": "Record Not Found !", "mess_body": "You have Entered Wrong Credentials." });
        res
          .status(400)
          .json({
            status: 400,
            mess: "Record Not Found !",
            mess_body: "You have Entered Wrong Credentials.",
          });
      } else {
        delete data[0].s_em_password;
        if (data[0].n_status != "ACTIVE") {
          // log.warn({ "status": 400, "mess": "Inactive Account !", "mess_body": "Your account was Inactive by Admin." });
          res
            .status(400)
            .json({
              status: 400,
              mess: "Inactive Account !",
              mess_body: "Your account was Inactive by Admin.",
            });
        } else {
          getsession(data, req, res);
          res
            .status(200)
            .json({
              status: 200,
              mess: "Record Found !",
              mess_body: "Credentials Successfully Authenticate.",
              data: data[0],
            });
        }
      }
    })
    .catch((err) => {
      console.log(err);
      // log.error({ "status": 500, "mess": `${err.code} !`, "mess_body": err.message });
      res
        .status(500)
        .json({ status: 500, mess: `${err.code} !`, mess_body: err.message });
    });
});

function getsession(data, req, res) {
  sess = req.session;
  sess.user_name = req.body.username;
  //   console.log(sess.user_name);
}

app.get("/main", function (req, res) {
  sess = req.session;
  if (sess.user_name) {
    res.sendfile("./public/views/main.html");
  } else {
    res.redirect("/login");
  }
});

app.get("/login", function (req, res) {
  sess = req.session;
  if (sess.user_name) {
    res.redirect("/main");
  } else {
    res.redirect("/");
  }
});

app.post("/my_profile_pic", function (req, res) {
  try {
    var photos = [],
      fieldss = [];
    form = new formidable.IncomingForm();

    form.multiples = false;
    // Upload directory for the images
    form.uploadDir = path.join(__dirname, "./public/assets/img/avatars/");

    form.on("file", function (name, file) {
      try {
        // Allow only 3 files to be uploaded.
        if (photos.length === 2) {
          fs.unlink(file.path);
          return true;
        }

        var buffer = null,
          type = file.type,
          filename = "";

        // // Read a chunk of the file.
        // buffer = readChunk.sync(file.path, 0, 262);
        // // Get the file type using the buffer read using read-chunk
        // type = fileType(buffer);

        // Check the file type, must be either png,jpg or jpeg
        if (
          type !== null &&
          (type === "image/png" ||
            type === "image/jpg" ||
            type === "image/jpeg")
        ) {
          // Assign new file name
          filename = Date.now() + "-" + file.name;

          // Move the file with the new file name
          fs.rename(
            file.path,
            path.join(__dirname, "./public/assets/img/avatars/" + filename),
            function (err, data) {
              if (err) {
                console.log(err);
              } else {
                // Add to the list of photos
                photos.push({
                  status: true,
                  filename: filename,
                  type: type,
                  s_og_name: file.name,
                  publicPath: "../assets/img/avatars/" + filename,
                  empcode: fieldss[0].empcode,

                  s_type: fieldss[0].s_type,
                });
                photos = photos[0];
                var date = new Date();
                var d_created_date = date.getTime();

                if (photos.empcode != "" || photos.empcode != undefined) {
                  var obj = {};
                  obj.queryString = `update tbl_employee set s_em_image=? where s_em_code=?;`;

                  obj.arr = [photos.publicPath, photos.empcode];
                }

                con(obj)
                  .then((data) => {
                    res.status(200).json({
                      status: 200,
                      mess: "Updated !",
                      mess_body: `Image Uploading Successfully.`,
                      data: photos.publicPath,
                    });
                  })
                  .catch((err) => {
                    res.status(500).json({
                      code: 500,
                      status: 500,
                      mess: "Error !",
                      mess_body: `Error Uploading file.`,
                    });
                  });
              }
            }
          );
        } else {
          photos.push({
            status: false,
            filename: file.name,
            message: "Invalid file type",
          });
          fs.unlink(file.path, function (err, data) {
            if (err) {
              console.log(err);
            } else {
              console.log(`${file.path} deleted Succesfully.`);
            }
          });
        }
      } catch (error) {
        res.status(500).json(error);
      }
    });

    form.on("error", function (err) {
      console.log("Error occurred during processing - " + err);
    });

    // Invoked when all the fields have been processed.
    form.on("end", function (err, fields, files) {
      console.log(`All Process Done here`);
    });
    // Parse the incoming form fields.

    // Invoked when a file has finished uploading.
    form.parse(req, (err, fields, files) => {
      console.log("fields:", fields);
      fieldss.push(fields);
    });
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
});

app.get("/logout", function (req, res) {
  req.session.destroy(function (err) {
    if (err) {
      console.log(err);
    } else {
      // log.info({ "code": 500, "status": 500, "mess": "Logout !", "mess_body": "Logout Successfully.", 'err': err });
      res.redirect("/login");
    }
  });
});
var dbValidation = require("./utils/dbValidation");

app.post("/uplaod_attachments", function (req, res) {
  // used
  try {
    var form = new formidable.IncomingForm();
    var datetime = Date.now();
    (arrayVals = []),
      (files = []),
      (fileSize = []),
      (fieldss = {}),
      (file_name = "");
    form.uploadDir = "./uploads/task_attach";
    form.parse(req);
    form.once("error", () => {
      res.status(500).json({
        code: 500,
        status: 500,
        mess: "Error !",
        mess_body: `Error in Uploading file.`,
      });
    });

    form.on("fileBegin", (filename, file) => {
      var file_new_name = dbValidation.filename_with_symbol(
        datetime + "_" + file.name
      );
      file.path = __dirname + "/uploads/task_attach/" + file_new_name;
      if (file.size > 10000000) {
        dbValidation.delete_file(form.uploadDir, file.name);
        console.log("Size is more then 10 mb.");
        res
          .status(500)
          .json({
            code: 500,
            status: 500,
            mess: "Error !",
            mess_body: `${file.name} = Size is more then 10 mb.`,
          });
        return;
      }
      files.push({
        ogi_name: file.name,
        new_name: file_new_name,
        path: "/task_attach",
        fieldname: filename,
      });
    });

    form.on("file", (filename, file) => {
      form.emit("data", { name: "file", key: filename, value: file });
    });

    form.on("field", (fieldName, fieldValue) => {
      fieldss[fieldName] = fieldValue;
    });

    form.once("end", () => {
      var Obj = { queryString: "", arr: [] };
      Obj.queryString = `call attach_upload(?,?,?,?,?)`;
      for (let i = 0; i < files.length; i++) {
        const element = files[i];
        file_name = element.ogi_name;
        Obj.arr.push(
          fieldss["att_type"],
          element.ogi_name,
          element.new_name,
          "/task_attach",
          fieldss["em_code"]
        );
      }

      con(Obj).then((data) => {
        if (data) {
          setTimeout(() => {
            return res
              .status(200)
              .json({
                mess_body: `'${file_name}' File Uploaded Successfully !`,
              });
          }, 3000);
        }
      });
    });
  } catch (error) {
    res.status("500").send({
      code: 500,
      mess_body: "Field is missing.",
    });
  }
});

// cron job scheduler

var email_file = require("./routes/essController/essEmailService");
var cron = require("node-cron");
cron.schedule("0 09 * * *", () => {
  //  0 09 * * * everyday @ 9 o'clock in the morning
  console.log("running a task every day @9");
  var obj = {};
  obj.queryString = `call get_department_wise_return_tasklist();`;
  obj.arr = [];
  con(obj)
    .then((data) => {
      if (data.length == 0) {
        return;
      } else {
        for (var i = 0; i < data.length; i++) {
          email_file.task_email(data[i]);
        }
      }
    })
    .catch((err) => {
      console.log(err);
      // log.error({ "status": 500, "mess": `${err.code} !`, "mess_body": err });
    });
});
//start server
var server = require("http").createServer(app);

// Start server
var port = process.env.PORT || 9001;
server.listen(port, function () {
  // log.info('Express server listening on port %d in %s mode', port, app.get('env'));
  console.log(
    "Express server listening on port %d in %s mode",
    port,
    app.get("env")
  );
});
