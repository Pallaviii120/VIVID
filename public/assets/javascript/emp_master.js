!(function (e) {
  var t = {};
  function a(n) {
    if (t[n]) return t[n].exports;
    var r = (t[n] = { i: n, l: !1, exports: {} });
    return e[n].call(r.exports, r, r.exports, a), (r.l = !0), r.exports;
  }
  (a.m = e),
    (a.c = t),
    (a.d = function (e, t, n) {
      a.o(e, t) || Object.defineProperty(e, t, { enumerable: !0, get: n });
    }),
    (a.r = function (e) {
      "undefined" != typeof Symbol &&
        Symbol.toStringTag &&
        Object.defineProperty(e, Symbol.toStringTag, { value: "Module" }),
        Object.defineProperty(e, "__esModule", { value: !0 });
    }),
    (a.t = function (e, t) {
      if ((1 & t && (e = a(e)), 8 & t)) return e;
      if (4 & t && "object" == typeof e && e && e.__esModule) return e;
      var n = Object.create(null);
      if (
        (a.r(n),
        Object.defineProperty(n, "default", { enumerable: !0, value: e }),
        2 & t && "string" != typeof e)
      )
        for (var r in e)
          a.d(
            n,
            r,
            function (t) {
              return e[t];
            }.bind(null, r)
          );
      return n;
    }),
    (a.n = function (e) {
      var t =
        e && e.__esModule
          ? function () {
              return e.default;
            }
          : function () {
              return e;
            };
      return a.d(t, "a", t), t;
    }),
    (a.o = function (e, t) {
      return Object.prototype.hasOwnProperty.call(e, t);
    }),
    (a.p = ""),
    a((a.s = 16));
})({
  16: function (e, t) {
    (deleteEmpById = (e) => {
      try {
        confirm("Do you Really want to delete this record ?") &&
          $.ajax({
            type: "POST",
            url: "./ess/deleteEmpById",
            crossDomain: !0,
            data: { s_em_code: e },
            beforeSend: function () {
              add_loader("loader");
            },
            success: function (e) {
              callAlert("success", e.mess_body),
                setTimeout(() => {
                  getEmpList();
                }, 2e3);
            },
            error: function (e) {
              callAlert("error", e), console.log(e);
            },
            complete: function () {
              remove_loader("loader");
            },
          });
      } catch (e) {
        remove_loader("loader"), console.log(e);
      }
    }),
      (deactivateEmpById = (e, t) => {
        try {
          var a = "";
          (a =
            "btn_deac" == t
              ? "Do you want to deactivate User ?"
              : "Do you want to activate User ?"),
            confirm(a) &&
              $.ajax({
                type: "POST",
                url: "./ess/deactivateEmpById",
                crossDomain: !0,
                data: { s_em_code: e, btn: t },
                beforeSend: function () {
                  add_loader("loader");
                },
                success: function (e) {
                  callAlert("success", e.mess_body),
                    setTimeout(() => {
                      "btn_deac" == t ? getEmpList() : get_inactive_emp();
                    }, 1e3);
                },
                error: function (e) {
                  callAlert("error", e);
                },
                complete: function () {
                  remove_loader("loader");
                },
              });
        } catch (e) {
          remove_loader("loader"), console.log(e);
        }
      }),
      (getEmpList = () => {
        try {
          $.ajax({
            type: "POST",
            url: "./ess/getEmpList",
            crossDomain: !0,
            beforeSend: function () {
              add_loader("loader"),
                $(".active_emp").hide(),
                $(".inactive_emp").show();
            },
            success: function (e) {
              var t = e.data;
              $.fn.dataTable.isDataTable("#emptbl") &&
                $("#emptbl").DataTable().destroy(),
                (table = $("#emptbl").DataTable({
                  data: t,
                  scrollX: !0,
                  fixedColumns: { left: 1, right: 1 },
                  aoColumns: [
                    {
                      render: function (e, t, a, n) {
                        return `<a href="#/addEmployee/${localStorage.getItem(
                          "email"
                        )}?empcode=${
                          a.s_em_code
                        }" class="btn btn-sm btn-success"><i class="fas fa-edit"></i></a> | <a onclick="deleteEmpById('${
                          a.s_em_code
                        }');" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a> | <a onclick="deactivateEmpById('${
                          a.s_em_code
                        }','btn_deac');" class="btn btn-sm btn-warning" id="btn_deac"><i class="fas fa-eye-slash"></i></a>`;
                      },
                    },
                    { data: "fullnm" },
                    { data: "s_em_code" },
                    { data: "s_em_email" },
                    { data: "s_em_phone" },
                    { data: "dept" },
                    { data: "s_em_gender" },
                    {
                      render: function (e, t, a, n) {
                        return `<ul>\n                                    <li>Rep 1. : ${check_string_val(
                          a.reporting1,
                          "NA"
                        )}</li>\n                                    <li>Rep 2. : ${check_string_val(
                          a.reporting2,
                          "NA"
                        )}</li>\n                                          </ul>`;
                      },
                    },
                    {
                      render: function (e, t, a, n) {
                        let r = "";
                        return (r = 1 == a.n_id ? "System ADMIN" : a.role), r;
                      },
                    },
                  ],
                }));
            },
            error: function (e) {
              callAlert("error", e);
            },
            complete: function () {
              remove_loader("loader");
            },
          });
        } catch (e) {
          console.log(e), remove_loader("loader");
        }
      }),
      (get_inactive_emp = () => {
        try {
          $.ajax({
            type: "POST",
            url: "/ess/get_inactive_emp",
            crossDomain: !0,
            beforeSend: function () {
              $(".active_emp").show(), $(".inactive_emp").hide();
            },
            success: function (e) {
              var t = e.data;
              $.fn.dataTable.isDataTable("#emptbl") &&
                $("#emptbl").DataTable().destroy(),
                (table = $("#emptbl").DataTable({
                  data: t,
                  scrollX: !0,
                  fixedColumns: { left: 1, right: 1 },
                  aoColumns: [
                    {
                      render: function (e, t, a, n) {
                        return `<a href="#/addEmployee/${localStorage.getItem(
                          "email"
                        )}?empcode=${
                          a.s_em_code
                        }" class="btn btn-sm btn-success"><i class="fas fa-edit"></i></a> | <a onclick="deleteEmpById('${
                          a.s_em_code
                        }');" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a> | <a onclick="deactivateEmpById('${
                          a.s_em_code
                        }','btn_act');" class="btn btn-sm btn-warning" id="btn_act"><i class="fas fa-eye"></i></a>`;
                      },
                    },
                    { data: "fullnm" },
                    { data: "s_em_code" },
                    { data: "s_em_email" },
                    { data: "s_em_phone" },
                    { data: "dept" },
                    { data: "s_em_gender" },
                    {
                      render: function (e, t, a, n) {
                        return `<ul>\n                                <li>Rep 1. : ${check_string_val(
                          a.reporting1,
                          "NA"
                        )}</li>\n                                <li>Rep 2. : ${check_string_val(
                          a.reporting2,
                          "NA"
                        )}</li>\n                                      </ul>`;
                      },
                    },
                    {
                      render: function (e, t, a, n) {
                        return 1 == a.n_id ? "System ADMIN" : a.role;
                      },
                    },
                  ],
                })),
                callAlert("success", success_handling(e));
            },
            error: function (e) {
              callAlert("error", error_handling(e));
            },
            complete: function () {},
          });
        } catch (e) {
          callAlert("error", error_handling(e));
        }
      }),
      getEmpList();
  },
});
