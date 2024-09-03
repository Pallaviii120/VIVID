
const { Pool, Client } = require('mysql');


module.exports = {

    nodeServerBridge: function (obj) {
        const pool = new Pool({
            connectionString: connectionString,
        });
        return new Promise(function (resolve, reject) {
            pool.query(obj.queryString, obj.arr, function (error, results) {
                try {
                    if (error) {
                        reject(error);
                    } else {
                        resolve(results);
                    }
                } catch (err) {
                    reject(err);
                }
            });
            pool.end();
        });
    },
}