var fs = require("fs")
module.exports = {
    replace: function(userText) {
        try {
            var userTexts = userText;
            if (typeof userText === "number") {
                return userText = userText === null ? 0 : userText;
            } else {
                var regExpr = /'/g; // replace the " ' " (ampersand symbol)
                //var regExpr = /[^a-zA-Z0-9-. ]/g;   // Replace all the symbol except the charcter
                // var userTexts = userText;
                if (userText == '' || userText == undefined) {
                    return userText;
                } else {
                    return userTexts.replace(regExpr, "''");
                }
            }
        } catch (err) {
            // console.log("Json Error : " + err)
        }
    },
    dateFormate: function(UserDate) {
        try {
            var str = UserDate;
            var res = str.split("T");
            return res[0];
        } catch (err) {
            // console.log("Json Error : " + err)
        }
    },

    formatdateYYMMDD: function(UserDate) {
        var date = new Date(UserDate);
        var dd = String(date.getDate());
        var mm = String(date.getMonth() + 1);
        var yr = String(date.getFullYear());
        if (dd.length == 1)
            dd = "0" + dd;
        if (mm.length == 1)
            mm = "0" + mm;
        // console.log(yr + '-' + mm + '-' + dd)
        return yr + '-' + mm + '-' + dd;
    },

    delete_file: function(main_Dir, file_name) {
        try {
            var filePath = main_Dir + "/" + file_name;
            fs.unlink(filePath, function(err) {
                if (err) {
                    // console.log(err)
                };
                // console.log('File deleted!');
                return;
            });
        } catch (error) {
            // console.log(error);
            return;
        }
    },

    newDatetimeInInteger: function(dateVal) {
        try {
            var datee = dateVal == '' ? new Date() : dateVal;
            return datee.getTime();
        } catch (err) {
            // console.log(err)
        }
    },

    role: function(roleVal) {
        try {
            roleName = roleVal === "ADMIN" ? 1 : 0;
            return roleName;
        } catch (error) {
            // console.log(error);
        }
    },

    date_diff_in_days: function(date_val1, date_val2) {
        const date1 = new Date(date_val1); //new Date('7/13/2010');
        const date2 = new Date(date_val2); //new Date('12/15/2010');
        const diffTime = Math.abs(date2 - date1);
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        // console.log(diffTime + " milliseconds");
        // console.log(diffDays + " days");
        return diffDays;
    },
    current_date: function() {
        var date = new Date();
        var dd = String(date.getDate());
        var mm = String(date.getMonth() + 1);
        var yr = String(date.getFullYear());
        if (dd.length == 1)
            dd = "0" + dd;
        if (mm.length == 1)
            mm = "0" + mm;
        // console.log(yr + '-' + mm + '-' + dd)
        return yr + '-' + mm + '-' + dd;
    },

    current_time: function() {
        var d = new Date(),
            h = (d.getHours() < 10 ? '0' : '') + d.getHours(),
            m = (d.getMinutes() < 10 ? '0' : '') + d.getMinutes();
        return h + ':' + m;
    },

    filename_with_symbol: function(filename) {
        return filename.replace(/[&\/\\#,+( )$~%'":*?<>{}]/g, '_');
    },
    check_string_val: function(str, defultVal) {
        str = str == null || str == undefined || str == "" ? defultVal : str;
        return str;
    },
};