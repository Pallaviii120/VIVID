const mysql = require("mysql");
// var log4js = require('log4js');
// var log = log4js.getLogger("app");
var pool = mysql.createPool({
  connectionLimit: 100000, //focus it
  host: "localhost",
  user: "root",
  password: "Password@123",
  database: "db_ess_ultratech_",
  multipleStatements: true,
  port: 3306,
});

module.exports = {
  executeSelect: function (obj) {
    return new Promise(function (resolve, reject) {
      pool.getConnection(function (err, connection) {
        if (err) {
          if (err.code === "PROTOCOL_CONNECTION_LOST") {
            console.error("Database connection was closed.");
          }
          if (err.code === "ER_CON_COUNT_ERROR") {
            console.error("Database has too many connections.");
          }
          if (err.code === "ECONNREFUSED") {
            console.error("Database connection was refused.");
          }
          // log.fatal({
          //     "status": 500,
          //     "mess": err.code,
          //     "mess_body": err.message
          // });
          return reject(err);
        }
        connection.query(obj.queryString, obj.arr, function (error, results) {
          if (connection) connection.release();
          try {
            if (error) {
              reject(error);
              connection.log(error);
            } else {
              // log.info({
              //     "status": 200,
              //     "mess": "Query Excuted",
              //     "mess_body": "Query Excuted Sccessfully"
              // });
              resolve(results);
            }
          } catch (err) {
            console.log("Json Error : " + err);
            reject(err);
          }
        });
      });
    });
  },
  executeMultiple: function (obj) {
    return new Promise(function (resolve, reject) {
      pool.getConnection(function (err, connection) {
        if (err) {
          console.error("Database connection error:", err);
          return reject(err);
        }
        connection.query(
          obj.queryString,
          obj.params,
          function (error, results) {
            connection.release();
            if (error) {
              console.log("Query execution error:", error);
              return reject(error);
            }
            resolve(results);
          }
        );
      });
    });
  },
};
