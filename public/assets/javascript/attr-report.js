!(function (e) {
  var t = {};
  function r(n) {
    if (t[n]) return t[n].exports;
    var o = (t[n] = { i: n, l: !1, exports: {} });
    return e[n].call(o.exports, o, o.exports, r), (o.l = !0), o.exports;
  }
  (r.m = e),
    (r.c = t),
    (r.d = function (e, t, n) {
      r.o(e, t) || Object.defineProperty(e, t, { enumerable: !0, get: n });
    }),
    (r.r = function (e) {
      "undefined" != typeof Symbol &&
        Symbol.toStringTag &&
        Object.defineProperty(e, Symbol.toStringTag, { value: "Module" }),
        Object.defineProperty(e, "__esModule", { value: !0 });
    }),
    (r.t = function (e, t) {
      if ((1 & t && (e = r(e)), 8 & t)) return e;
      if (4 & t && "object" == typeof e && e && e.__esModule) return e;
      var n = Object.create(null);
      if (
        (r.r(n),
        Object.defineProperty(n, "default", { enumerable: !0, value: e }),
        2 & t && "string" != typeof e)
      )
        for (var o in e)
          r.d(
            n,
            o,
            function (t) {
              return e[t];
            }.bind(null, o)
          );
      return n;
    }),
    (r.n = function (e) {
      var t =
        e && e.__esModule
          ? function () {
              return e.default;
            }
          : function () {
              return e;
            };
      return r.d(t, "a", t), t;
    }),
    (r.o = function (e, t) {
      return Object.prototype.hasOwnProperty.call(e, t);
    }),
    (r.p = ""),
    r((r.s = 3));
})({
  3: function (e, t) {
    (getEmpAttend = function () {
      try {
        var e = {
          type: getlocalItem("role"),
          s_em_code: $("#s_em_code").val(),
          date_range: $("#date_range").val(),
        };
        $.ajax({
          type: "POST",
          contentType: "application/json",
          url: "/ess/getEmpAttend_report",
          data: JSON.stringify(e),
          dataType: "json",
          beforeSend: function () {
            add_loader("loader"),
              $("#empattend").html(""),
              $.fn.dataTable.isDataTable("#tbl-atte-report") &&
                $("#tbl-atte-report").DataTable().destroy();
          },
          success: function (e) {
            var t = "",
              r = "",
              n = "",
              o = "";
            e.data.forEach((e) => {
              (r = null == e.t_signin_time ? "-" : e.t_signin_time),
                (n = null == e.t_signout_time ? "-" : e.t_signout_time),
                (o = null == e.s_status ? "-" : e.s_status),
                (t += `<tr>\n                                            <td><div class="d-flex">\n                                                <div class="image">\n                                                    <img src="${e.profile}" class="img-circle" style="width:50px;height:50px;">\n                                                </div>\n                                                    <div class="info">\n                                                        <a href="#/addEmployee/${e.s_em_email}?empcode=${e.s_em_code}" class="d-block sidenm">${e.s_em_code}(${e.name})</a>\n                                                    </div>\n                                                </div>\n                                            </td> \n                                            <td>${e.s_shift_id}</td>\n                                            <td>${e.s_work_type}</td> \n                                            <td>${e.d_atten_date}</td> \n                                            <td>${r}</td>\n                                            <td>${n}</td>\n                                            <td>${o}</td>\n                                        </tr>`);
            }),
              $("#empattend").html(t),
              $("#tbl-atte-report").DataTable({
                dom: "Bfrtip",
                buttons: ["csv", "excel"],
              });
          },
          error: function (e) {
            callAlert("error", error_handling(e));
          },
          complete: function (e) {
            remove_loader("loader");
          },
        });
      } catch (e) {
        callAlert("error", error_handling(e));
      }
    }),
      (get_emp_rec = () => {
        try {
          (data = {
            role: getlocalItem("role"),
            emp_code: getlocalItem("em_code"),
          }),
            $.ajax({
              type: "POST",
              url: "/ess/get_emp_list",
              crossDomain: !0,
              data: data,
              beforeSend: function () {
                $("#s_em_code").html("");
              },
              success: function (e) {
                let t = '<option label="Select Employee"></option>';
                e.data.forEach((e, r) => {
                  t += `<option value="${e.s_em_code}">${e.name}</option>`;
                }),
                  $("#s_em_code").html(t);
              },
              error: function (e) {
                callAlert("error", error_handling(e));
              },
              complete: function (e) {
                setTimeout(() => {
                  $(".select2_emp").select2(),
                    $("#date_range").daterangepicker({
                      timePicker: !1,
                      locale: { format: "YYYY-MM-DD" },
                    });
                }, 2e3);
              },
            });
        } catch (e) {
          callAlert("error", error_handling(e));
        }
      }),
      (reset_form = function () {
        try {
          $("select").val("").change(), $("#date_range").val("");
        } catch (e) {
          callAlert("error", error_handling(e));
        }
      }),
      get_emp_rec(),
      getEmpAttend();
  },
});
