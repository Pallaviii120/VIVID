!(function (n) {
  var a = {};
  function i(e) {
    if (a[e]) return a[e].exports;
    var l = (a[e] = { i: e, l: !1, exports: {} });
    return n[e].call(l.exports, l, l.exports, i), (l.l = !0), l.exports;
  }
  (i.m = n),
    (i.c = a),
    (i.d = function (n, a, e) {
      i.o(n, a) || Object.defineProperty(n, a, { enumerable: !0, get: e });
    }),
    (i.r = function (n) {
      "undefined" != typeof Symbol &&
        Symbol.toStringTag &&
        Object.defineProperty(n, Symbol.toStringTag, { value: "Module" }),
        Object.defineProperty(n, "__esModule", { value: !0 });
    }),
    (i.t = function (n, a) {
      if ((1 & a && (n = i(n)), 8 & a)) return n;
      if (4 & a && "object" == typeof n && n && n.__esModule) return n;
      var e = Object.create(null);
      if (
        (i.r(e),
        Object.defineProperty(e, "default", { enumerable: !0, value: n }),
        2 & a && "string" != typeof n)
      )
        for (var l in n)
          i.d(
            e,
            l,
            function (a) {
              return n[a];
            }.bind(null, l)
          );
      return e;
    }),
    (i.n = function (n) {
      var a =
        n && n.__esModule
          ? function () {
              return n.default;
            }
          : function () {
              return n;
            };
      return i.d(a, "a", a), a;
    }),
    (i.o = function (n, a) {
      return Object.prototype.hasOwnProperty.call(n, a);
    }),
    (i.p = ""),
    i((i.s = 15));
})({
  15: function (n, a) {
    var i, e;
    !(function (n) {
      var a = "",
        i = `
      <div class="image">
          <img class="img-circle elevation-2 proimg" alt="User Image" style="width:50px;height:50px;">
      </div>
      <div class="info">
          <a href="#/profile/view?empcode=${getlocalItem(
            "em_code"
          )}" class="d-block sidenm">
              <span id="usrnm" style="white-space: normal;"></span>
          </a>
      </div>`;

      (e = "/main"),
        (l = n.sammy(function () {
          switch (getlocalItem("role")) {
            case "ADMIN":
              var i = "";
              (i = 1 == getlocalItem("tag") ? "javascript:void(0)" : "#/tasks"),
                n(".username").text(getlocalItem("name")),
                this.get("#/Portfolio", function () {
                  n("#maincontainer").load("../views/dashboard.html");
                }),
                this.get("#/dept", function () {
                  n("#maincontainer").load("../views/dept_master.html");
                }),
                this.get("#/emp", function () {
                  n("#maincontainer").load("../views/emp_master.html");
                }),
                this.get("#/shift", function () {
                  n("#maincontainer").load("../views/shift_master.html");
                }),
                this.get("#/holiday", function () {
                  n("#maincontainer").load("../views/holiday_master.html");
                }),
                this.get("#/addEmployee", function () {
                  n("#maincontainer").load("../views/addEmployee.html");
                }),
                this.get("#/addEmployee/:id", function () {
                  n("#maincontainer").load("../views/addEmployee.html");
                }),
                this.get("#/profile/:id", function () {
                  n("#maincontainer").load("../views/profile.html");
                }),
                this.get("#/mis-report", function () {
                  n("#maincontainer").load("../views/mis-report.html");
                }),
                this.get("#/atte-report", function () {
                  n("#maincontainer").load("../views/atte-report.html");
                }),
                this.get("#/tasks-report", function () {
                  n("#maincontainer").load("../views/tasks.html");
                }),
                this.get("#/time-sheet", function () {
                  n("#maincontainer").load("../views/timesheet.html");
                }),
                this.get("#/report-section", function () {
                  n("#maincontainer").load("../views/timesheet-report.html");
                }),
                this.get("#/leave", function () {
                  n("#maincontainer").load("../views/leave_list.html");
                }),
                (a +=
                  '\n                <li class="nav-item">\n                    <a href="#/Portfolio" class="nav-link activ_menu" >\n                        <i class="nav-icon fas fa-tachometer-alt"></i>\n                        <p>  Portfolio </p>\n                    </a>\n                </li>'),
                "0" != getlocalItem("tag") &&
                  (a +=
                    '<li class="nav-item">\n                    <a href="#" class="nav-link">\n                      <i class="nav-icon far fa-address-card"></i>\n                      <p> Master <i class="fas fa-angle-left right"></i>  </p>\n                    </a>\n                    <ul class="nav nav-treeview">\n                        <li class="nav-item">\n                            <a href="#/dept" class="nav-link">\n                                <i class="far fa-circle nav-icon"></i>\n                                <p>Departments</p>\n                            </a>\n                        </li>\n                        <li class="nav-item">\n                            <a href="#/shift" class="nav-link">\n                                <i class="far fa-circle nav-icon"></i>\n                                <p>Shift</p>\n                            </a>\n                        </li>\n                        <li class="nav-item">\n                            <a href="#/holiday" class="nav-link">\n                                <i class="far fa-circle nav-icon"></i>\n                                <p>Holiday</p>\n                            </a>\n                        </li>\n                        <li class="nav-item">\n                            <a href="#/emp" class="nav-link">\n                                <i class="far fa-circle nav-icon"></i>\n                                <p>Employee</p>\n                            </a>\n                        </li> \n                    </ul>\n                </li> '),
                "0" == getlocalItem("tag") &&
                  ((a += `\n                    <li class="nav-item">\n                        <a href="#" class="nav-link">\n                            <i class="nav-icon fas fa-umbrella-beach"></i>\n                            <p> Leave Management <i class="fas fa-angle-left right"></i> </p>\n                        </a>\n                        <ul class="nav nav-treeview">  \n                            <li class="nav-item">\n                            <a href="#/leave" class="nav-link">\n                                <i class="far fa-circle nav-icon"></i>\n                                <p>Leave</p>\n                            </a>\n                            </li> \n                        </ul>\n                    </li>\n                    <li class="nav-item">\n                        <a href="#" class="nav-link">\n                            <i class="nav-icon fas fa-tasks"></i>\n                            <p> Task Management\n                            <i class="fas fa-angle-left right"></i>\n                            </p>\n                        </a>\n                        <ul class="nav nav-treeview">  \n                            <li class="nav-item">\n                            <a href="${i}" class="nav-link">\n                                <i class="far fa-circle nav-icon"></i>\n                                <p>Task</p>\n                            </a>\n                            </li> \n                        </ul>\n                    </li>\n                    <li class="nav-item" id="" style="display:block">\n                        <a href="#" class="nav-link">\n                        <i class="nav-icon far fa-file"></i>\n                        <p> Reports <i class="fas fa-angle-left right"></i>  </p>\n                        </a>\n                        <ul class="nav nav-treeview"> \n                            <li class="nav-item">\n                                <a href="#/task-report" class="nav-link">\n                                    <i class="far fa-circle nav-icon"></i>\n                                    <p>Task</p>\n                                </a>\n                            </li>  \n                        </ul>\n                    </li>`),
                  this.get(i, function () {
                    n("#maincontainer").load("../views/tasks.html");
                  }),
                  this.get(i + "?", function () {
                    n("#maincontainer").load("../views/tasks.html");
                  }),
                  this.get("#/task-report", function () {
                    n("#maincontainer").load("../views/task-report.html");
                  })),
                "0" != getlocalItem("tag") &&
                  (a +=
                    '<li class="nav-item">\n' +
                    '    <a href="#" class="nav-link">\n' +
                    '        <i class="nav-icon far fa-file"></i>\n' +
                    '        <p> TimeSheet Reports <i class="fas fa-angle-left right"></i></p>\n' +
                    "    </a>\n" +
                    // '    <ul class="nav nav-treeview">\n' +
                    // '        <li class="nav-item">\n' +
                    // '            <a href="#/atte-report" class="nav-link">\n' +
                    // '                <i class="far fa-circle nav-icon"></i>\n' +
                    // "                <p>Attendance</p>\n" +
                    // "            </a>\n" +
                    // "        </li>\n" +
                    // "    </ul>\n" +
                    '    <ul class="nav nav-treeview">\n' +
                    '        <li class="nav-item">\n' +
                    '            <a href="#/report-section" class="nav-link">\n' +
                    '                <i class="far fa-circle nav-icon"></i>\n' +
                    "                <p>Project Wise Report</p>\n" +
                    "            </a>\n" +
                    "        </li>\n" +
                    "    </ul>\n" +
                    '    <ul class="nav nav-treeview">\n' +
                    '        <li class="nav-item">\n' +
                    '            <a href="#/report-section" class="nav-link">\n' +
                    '                <i class="far fa-circle nav-icon"></i>\n' +
                    "                <p>User Wise Report</p>\n" +
                    "            </a>\n" +
                    "        </li>\n" +
                    "    </ul>\n" +
                    "</li>");

              a +=
                '<li class="nav-item">\n' +
                '    <a href="#" class="nav-link">\n' +
                '        <i class="nav-icon far fa-envelope"></i>\n' +
                '        <p> New Project <i class="fas fa-angle-left right"></i></p>\n' +
                "    </a>\n" +
                '    <ul class="nav nav-treeview">\n' +
                '        <li class="nav-item">\n' +
                '            <a href="#/tasks-report" class="nav-link">\n' +
                '                <i class="far fa-circle nav-icon"></i>\n' +
                "                <p>Project</p>\n" +
                "            </a>\n" +
                "        </li>\n" +
                "    </ul>\n" +
                "</li>";

              a +=
                '<li class="nav-item">\n' +
                '    <a href="#" class="nav-link">\n' +
                '        <i class="nav-icon far fa-clock"></i>\n' +
                '        <p> TimeSheet <i class="fas fa-angle-left right"></i></p>\n' +
                "    </a>\n" +
                '    <ul class="nav nav-treeview">\n' +
                '        <li class="nav-item">\n' +
                '            <a href="#/time-sheet" class="nav-link">\n' +
                '                <i class="far fa-circle nav-icon"></i>\n' +
                "                <p>New TimeSheet</p>\n" +
                "            </a>\n" +
                "        </li>\n" +
                "    </ul>\n" +
                "</li>";

              (e = "main#/Portfolio"), n(".url_here").attr("href", e);
              break;
            case "EMPLOYEE":
              n(".username").text(getlocalItem("name")),
                this.get("#/profile/:id", function () {
                  n("#maincontainer").load("../views/profile.html");
                }),
                this.get("#/leave", function () {
                  n("#maincontainer").load("../views/leave_list.html");
                }),
                this.get("#/punch-in", function () {
                  n("#maincontainer").load("../views/punch-in.html");
                }),
                this.get("#/punch-out", function () {
                  n("#maincontainer").load("../views/punch-out.html");
                }),
                this.get("#/tasks-report", function () {
                  n("#maincontainer").load("../views/tasks.html");
                }),
                this.get("#/time-sheet", function () {
                  n("#maincontainer").load("../views/timesheet.html");
                }),
                // this.get("#/tasks?", function () {
                //   n("#maincontainer").load("../views/tasks.html");
                // }),
                this.get("#/main-portfolio", function () {
                  n("#maincontainer").load("../views/mydashboard.html");
                }),
                // this.get("#/task-report", function () {
                //   n("#maincontainer").load("../views/task-report.html");
                // }),
                this.get("#/timesheet", function () {
                  n("#maincontainer").load("../views/timesheet.html");
                }),
                this.get("#/report-section", function () {
                  n("#maincontainer").load("../views/timesheet-report.html");
                }),
                (a +=
                  "  \n" +
                  '    <li class="nav-item">\n' +
                  '        <a href="#/main-portfolio" class="nav-link activ_menu">\n' +
                  '            <i class="nav-icon fas fa-tachometer-alt"></i>\n' +
                  "            <p>Portfolio</p>\n" +
                  "        </a>\n" +
                  "    </li>\n" +
                  '    <li class="nav-item">\n' +
                  '        <a href="#" class="nav-link">\n' +
                  '            <i class="nav-icon far fa-thumbs-up"></i>\n' +
                  '            <p>Attendance <i class="fas fa-angle-left right"></i></p>\n' +
                  "        </a>\n" +
                  '        <ul class="nav nav-treeview">\n' +
                  '            <li class="nav-item">\n' +
                  '                <a href="#/punch-in" class="nav-link">\n' +
                  '                    <i class="far fa-arrow-alt-circle-right nav-icon"></i>\n' +
                  "                    <p>Punch-In</p>\n" +
                  "                </a>\n" +
                  "            </li>\n" +
                  '            <li class="nav-item">\n' +
                  '                <a href="#/punch-out" class="nav-link">\n' +
                  '                    <i class="far fa-arrow-alt-circle-left nav-icon"></i>\n' +
                  "                    <p>Punch-Out</p>\n" +
                  "                </a>\n" +
                  "            </li>\n" +
                  "        </ul>\n" +
                  "    </li>\n" +
                  '    <li class="nav-item">\n' +
                  '        <a href="#" class="nav-link">\n' +
                  '            <i class="nav-icon fas fa-umbrella-beach"></i>\n' +
                  '            <p>Leave Management <i class="fas fa-angle-left right"></i></p>\n' +
                  "        </a>\n" +
                  '        <ul class="nav nav-treeview">\n' +
                  '            <li class="nav-item">\n' +
                  '                <a href="#/leave" class="nav-link">\n' +
                  '                    <i class="far fa-circle nav-icon"></i>\n' +
                  "                    <p>Leave</p>\n" +
                  "                </a>\n" +
                  "            </li>\n" +
                  "        </ul>\n" +
                  "    </li>\n" +
                  '    <li class="nav-item">\n' +
                  '        <a href="#" class="nav-link">\n' +
                  '            <i class="nav-icon fas fa-tasks"></i>\n' +
                  '            <p>Task Management <i class="fas fa-angle-left right"></i></p>\n' +
                  "        </a>\n" +
                  '        <ul class="nav nav-treeview">\n' +
                  '            <li class="nav-item">\n' +
                  '                <a href="#/tasks" class="nav-link">\n' +
                  '                    <i class="far fa-circle nav-icon"></i>\n' +
                  "                    <p>Task</p>\n" +
                  "                </a>\n" +
                  "            </li>\n" +
                  "        </ul>\n" +
                  "    </li>\n" +
                  '    <li class="nav-item" id="dep_head_view" style="display:none">\n' +
                  '        <a href="#" class="nav-link">\n' +
                  '            <i class="nav-icon far fa-file"></i>\n' +
                  '            <p>Reports <i class="fas fa-angle-left right"></i></p>\n' +
                  "        </a>\n" +
                  '        <ul class="nav nav-treeview">\n' +
                  '            <li class="nav-item">\n' +
                  '                <a href="#/task-report" class="nav-link">\n' +
                  '                    <i class="far fa-circle nav-icon"></i>\n' +
                  "                    <p>Task</p>\n" +
                  "                </a>\n" +
                  "            </li>\n" +
                  "        </ul>\n" +
                  "    </li>");
              (e = "main#/main-portfolio"), n(".url_here").attr("href", e);
          }
        }));
      a +=
        '  \n              <li class="nav-item">\n                  <a href="/logout" class="nav-link">\n                      <i class="nav-icon fas fa-sign-out-alt"></i>\n                      <p> Logout </p>\n                  </a>\n              </li> ';
      var t = "";
      n("#sidebar").html(i),
        (t =
          "" != getlocalItem("profile") && "null" != getlocalItem("profile")
            ? getlocalItem("profile")
            : "/assets/img/user.png"),
        n(".proimg").attr("src", t),
        n("#usrnm").text(getlocalItem("name")),
        n("#mainmenu").append(a),
        "DH" == getlocalItem("dep_head")
          ? n("#dep_head_view").show()
          : n("#dep_head_view").remove(),
        l.run(e);
    })(jQuery),
      (i = window.history),
      (e = i.pushState),
      (i.pushState = function (n) {
        return (
          "/main#/main-portfolio" == arguments[2] ||
          "/main#/Portfolio" == arguments[2]
            ? $(".activ_menu").addClass("active")
            : $(".activ_menu").removeClass("active"),
          e.apply(i, arguments)
        );
      });
  },
});
