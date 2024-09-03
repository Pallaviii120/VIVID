(function () {
  current_date = function (d) {
    if (d) {
      var date = new Date();
    } else {
      var date = new Date();
    }

    // var date = new Date();
    var dd = String(date.getDate());
    var mm = String(date.getMonth() + 1);
    var yr = String(date.getFullYear());
    if (dd.length == 1) dd = "0" + dd;
    if (mm.length == 1) mm = "0" + mm;
    // console.log(yr + '-' + mm + '-' + dd)
    return yr + "-" + mm + "-" + dd;
  };

  current_time = function () {
    var d = new Date(),
      h = (d.getHours() < 10 ? "0" : "") + d.getHours(),
      m = (d.getMinutes() < 10 ? "0" : "") + d.getMinutes();
    return h + ":" + m;
  };

  get_indian_rupee_format = function (rupee) {
    let x = roundToTwoDescimal(rupee); //12345678997897;
    x = x.toString();
    var afterPoint = "";
    if (x.indexOf(".") > 0) afterPoint = x.substring(x.indexOf("."), x.length);
    x = Math.floor(x);
    x = x.toString();
    var lastThree = x.substring(x.length - 3);
    var otherNumbers = x.substring(0, x.length - 3);
    if (otherNumbers != "") lastThree = "," + lastThree;
    let indian_repes =
      otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") +
      lastThree +
      afterPoint;
    return indian_repes;
  };

  multiselect = function (id) {
    try {
      $list_ = $("#" + id);
      $list_.multiselect({
        listWidth: 0,
      });
    } catch (error) {
      alert(error);
    }
  };

  get_multiselect_checked_values = function (id) {
    let dataset = $("input[type='checkbox']:checked").serializeArray();
    let values = [];
    for (let j = 0; j < dataset.length; j++) {
      if (dataset[j].name == id + "[]") {
        values.push(dataset[j].value);
      }
    }
    return values;
  };

  roundToTwoDescimal = function (num) {
    if (isNaN(num)) {
      return 0;
    }
    return +(Math.round(num + "e+2") + "e-2");
  };

  error_handling = function (err_obj) {
    console.log(err_obj);
    if (err_obj && err_obj.responseJSON) {
      return err_obj.responseJSON.mess_body || err_obj.responseJSON.errMess;
    } else if (
      err_obj.statusText == "Not Found" ||
      err_obj.statusText == "Internal Server Error"
    ) {
      return " Request Not Found !";
    } else if (err_obj.err_mess) {
      return err_obj.err_mess;
    } else {
      return err_obj;
    }
  };

  check_string_val = function (str, defultVal) {
    str = str == null || str == undefined || str == "" ? defultVal : str;
    return str;
  };

  getAllUrlParams = function (urllocation) {
    var url = "";
    if (urllocation.hash) {
      url = new URL(urllocation.origin + urllocation.hash.split("#")[1]).href;
    } else {
      url = new URL(urllocation).href;
    }
    // get query string from url (optional) or window
    var queryString = url ? url.split("?")[1] : window.location.search.slice(1);

    // we'll store the parameters here
    var obj = {};

    // if query string exists
    if (queryString) {
      // stuff after # is not part of query string, so get rid of it
      queryString = queryString.split("#")[0];

      // split our query string into its component parts
      var arr = queryString.split("&");

      for (var i = 0; i < arr.length; i++) {
        // separate the keys and the values
        var a = arr[i].split("=");

        // set parameter name and value (use 'true' if empty)
        var paramName = a[0];
        var paramValue = typeof a[1] === "undefined" ? true : a[1];

        // (optional) keep case consistent
        paramName = paramName.toLowerCase();
        if (typeof paramValue === "string")
          paramValue = paramValue.toLowerCase();

        // if the paramName ends with square brackets, e.g. colors[] or colors[2]
        if (paramName.match(/\[(\d+)?\]$/)) {
          // create key if it doesn't exist
          var key = paramName.replace(/\[(\d+)?\]/, "");
          if (!obj[key]) obj[key] = [];

          // if it's an indexed array e.g. colors[2]
          if (paramName.match(/\[\d+\]$/)) {
            // get the index value and add the entry at the appropriate position
            var index = /\[(\d+)\]/.exec(paramName)[1];
            obj[key][index] = paramValue;
          } else {
            // otherwise add the value to the end of the array
            obj[key].push(paramValue);
          }
        } else {
          // we're dealing with a string
          if (!obj[paramName]) {
            // if it doesn't exist, create property
            obj[paramName] = paramValue;
          } else if (obj[paramName] && typeof obj[paramName] === "string") {
            // if property does exist and it's a string, convert it to an array
            obj[paramName] = [obj[paramName]];
            obj[paramName].push(paramValue);
          } else {
            // otherwise add the property
            obj[paramName].push(paramValue);
          }
        }
      }
    }
    return obj;
  };

  getlocalItem = function (itemName) {
    return localStorage.getItem(itemName);
  };

  /* gettingWrongUrl = function () {
        localStorage.clear();
        window.location = '/logout';
    } */
  add_spinner = function (id) {
    return $(`${id}`).html(
      `<i class="fa fa-spinner fa-spin spiner_class"></i>`
    );
  };
  remove_spinner = function (id) {
    return $(`${id}`).html(``);
  };
  add_loader = function (id) {
    $("#" + id).addClass("is-active");
    document.getElementById(id).setAttribute("data-text", "Loading...");
  };
  remove_loader = function (id) {
    $("#" + id).removeClass("is-active");
  };
  btn_disable = function (id) {
    return $(`${id}`).prop("disabled", true);
  };
  btn_enable = function (id) {
    return $(`${id}`).prop("disabled", false);
  };
  get_year_dropdown = function (id, startyr) {
    let dateDropdown = document.getElementById(id);
    let currentYear = new Date().getFullYear();
    let earliestYear = startyr;
    let today = new Date();
    while (currentYear >= earliestYear) {
      if (today.getMonth() + 1 <= 3) {
        fiscalyear =
          currentYear - 1 + "-" + currentYear.toString().substr(2, 2);
      } else {
        fiscalyear =
          currentYear + "-" + (currentYear + 1).toString().substr(2, 2);
      }
      let dateOption = document.createElement("option");
      dateOption.text = fiscalyear;
      dateOption.value = fiscalyear;
      dateDropdown.add(dateOption);
      currentYear -= 1;
    }
  };

  add_datatable = function (id) {
    if ($.fn.dataTable.isDataTable(`#${id}`)) {
      $(`#${id}`).DataTable().destroy();
    }
    $(`#${id}`)
      .DataTable({
        responsive: true,
        lengthChange: false,
        autoWidth: false,
        buttons: ["copy", "csv", "excel", "pdf"],
      })
      .buttons()
      .container()
      .appendTo(`#${id}_wrapper .col-md-6:eq(0)`);
  };

  disableField = function (id, flag) {
    $(`#${id}`).prop("disabled", flag);
  };

  get_radio_input_value = (name) => {
    var radioValue = $("input[name='" + name + "']:checked").val();
    return radioValue;
  };
  bind_redio_input_value = (radion_name, value) => {
    $("input[name='" + radion_name + "'][value='" + value + "']").prop(
      "checked",
      true
    );
  };

  success_handling = function (obj) {
    if (obj && obj.mess_body) {
      return obj.mess_body || obj;
    } else if (obj && obj.responseJSON) {
      return obj.responseJSON.mess_body || obj;
    } else {
      return obj;
    }
  };

  date_diff_in_days = function (date_val1, date_val2) {
    if (
      check_string_val(date_val1, "") == "" ||
      check_string_val(date_val2, "") == ""
    ) {
      return 0;
    }
    const date1 = new Date(date_val1); //new Date('7/13/2010');
    const date2 = new Date(date_val2); //new Date('12/15/2010');
    const diffTime = Math.abs(date2 - date1);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    // console.log(diffTime + " milliseconds");
    // console.log(diffDays + " days");
    return diffDays;
  };
  // callAlert('success', result.mess_body);
  // callAlert('error', err);
  callAlert = function (type, msg) {
    var Toast = Swal.mixin({
      toast: true,
      position: "top-end",
      showConfirmButton: false,
      timer: 3000,
    });
    Toast.fire({
      icon: type,
      title: msg,
    });
  };
  download_file = function (url, filename) {
    var element = document.createElement("a");
    element.setAttribute("href", url);
    element.setAttribute("download", filename);
    document.body.appendChild(element);
    element.click();
    document.body.removeChild(element);
  };

  timeSince = function (date) {
    var seconds = Math.floor((new Date() - date) / 1000);

    var interval = seconds / 31536000;

    if (interval > 1) {
      return Math.floor(interval) + " years";
    }
    interval = seconds / 2592000;
    if (interval > 1) {
      return Math.floor(interval) + " months";
    }
    interval = seconds / 86400;
    if (interval > 1) {
      return Math.floor(interval) + " days";
    }
    interval = seconds / 3600;
    if (interval > 1) {
      return Math.floor(interval) + " hours";
    }
    interval = seconds / 60;
    if (interval > 1) {
      return Math.floor(interval) + " minutes";
    }
    return Math.floor(seconds) + " seconds";
  };

  /* -----------------------------digital clock---------------------- */
  currentTime = function (id, hid) {
    var date = new Date(); /* creating object of Date class */
    var hour = date.getHours();
    var min = date.getMinutes();
    var sec = date.getSeconds();
    hour = updateTime(hour);
    min = updateTime(min);
    sec = updateTime(sec);
    document.getElementById(id).innerText =
      hour + " : " + min + " : " + sec; /* adding time to the div */
    if (hid != undefined) {
      $("#" + hid).val(hour + " : " + min);
    }

    var t = setTimeout(function () {
      currentTime(id);
    }, 1000); /* setting timer */
  };

  updateTime = function (k) {
    if (k < 10) {
      return "0" + k;
    } else {
      return k;
    }
  };

  GetFormattedDate = function () {
    var todayTime = new Date();
    var month = todayTime.toLocaleString("default", { month: "long" });
    var day = String(todayTime.getDate());
    var year = String(todayTime.getFullYear());
    return month + "," + day + " " + year;
  };

  get_current_fyear = function () {
    var fiscalyear = "";
    let currentYear = new Date().getFullYear();

    let today = new Date();
    if (today.getMonth() + 1 <= 3) {
      fiscalyear = currentYear - 1 + "-" + currentYear.toString().substr(2, 2);
    } else {
      fiscalyear =
        currentYear + "-" + (currentYear + 1).toString().substr(2, 2);
    }
    return fiscalyear;
  };

  /*     ststus_text = (type) => {
            var sts_icon = '';
            switch (type) {
                case 'Important':
                    sts_icon = `<i class="	far fa-arrow-alt-circle-up text-danger"></i>`;
                    break;
                case 'Medium':
                    sts_icon = `<i class="far fa-circle text-success"></i>`;
                    break;
                case 'Low':
                    sts_icon = `<i class="far fa-arrow-alt-circle-down text-info"></i>`;
                    break;
                case 'Completed':
                    sts_icon = `<i class="far fa-check-circle text-success"></i>`;
                    break;
                case 'Assigned':
                    sts_icon = `<i class="far fa-pause-circle text-danger"></i>`;
                    break;
                case 'WIP':
                    sts_icon = `<i class="fas fa-history text-info"></i>`;
                    break;
                case 'Return':
                    sts_icon = `<i class="fas fa-file-signature text-info"></i>`;
                    break;
              
                default:
                    break;
            }
            return sts_icon;
        };
     */
  parse_the_number = function (value, type) {
    value = isNaN(value) || check_string_val(value, 0) == 0 ? 0 : value;
    switch (type) {
      case "int":
        parseInt(value);
        break;

      case "float":
        parseFloat(value);
        break;

      default:
        break;
    }
    return value;
  };

  ststus_text = (type) => {
    var sts_icon = "";
    switch (type) {
      case "Important":
        sts_icon = `<i class="	far fa-arrow-alt-circle-up text-danger"></i>`;
        break;
      case "Medium":
        sts_icon = `<i class="far fa-circle text-success"></i>`;
        break;
      case "Low":
        sts_icon = `<i class="far fa-arrow-alt-circle-down text-info"></i>`;
        break;
      case "Completed":
        sts_icon = `<i class="far fa-check-circle text-success"></i>`;
        break;
      case "Assigned":
        sts_icon = `<i class="far fa-pause-circle text-danger"></i>`;
        break;
      case "WIP":
        sts_icon = `<i class="fas fa-history text-info"></i>`;
        break;
      case "Return":
        sts_icon = `<i class="fas fa-exchange-alt text-warning"></i>`;
        break;
      case "Drop":
        sts_icon = `<i class='far text-danger'>&#xf057;</i>`;
        break;
      default:
        break;
    }
    return sts_icon;
  };
})();
