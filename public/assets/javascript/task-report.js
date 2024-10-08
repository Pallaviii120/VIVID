!(function (e) {
  var t = {};
  function r(a) {
    if (t[a]) return t[a].exports;
    var o = (t[a] = { i: a, l: !1, exports: {} });
    return e[a].call(o.exports, o, o.exports, r), (o.l = !0), o.exports;
  }
  (r.m = e),
    (r.c = t),
    (r.d = function (e, t, a) {
      r.o(e, t) || Object.defineProperty(e, t, { enumerable: !0, get: a });
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
      var a = Object.create(null);
      if (
        (r.r(a),
        Object.defineProperty(a, "default", { enumerable: !0, value: e }),
        2 & t && "string" != typeof e)
      )
        for (var o in e)
          r.d(
            a,
            o,
            function (t) {
              return e[t];
            }.bind(null, o)
          );
      return a;
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
    r((r.s = 12));
})({
  12: function (e, t) {
    (get_task_report_for_DH = function () {
      try {
        var e = {
          type: getlocalItem("role"),
          s_em_code: $("#s_em_code").val(),
          date_range: $("#date_range").val(),
          dep_head: getlocalItem("dep_head"),
          login_id: getlocalItem("em_code"),
          tag: getlocalItem("tag"),
        };
        $.ajax({
          type: "POST",
          contentType: "application/json",
          url: "/ess/get_task_report_for_DH",
          data: JSON.stringify(e),
          dataType: "json",
          beforeSend: function () {
            add_loader("loader"),
              $("#task_report_list").html(""),
              $.fn.dataTable.isDataTable("#task_report_tbl") &&
                $("#task_report_tbl").DataTable().destroy();
          },
          success: function (e) {
            var t = "";
            e.data.forEach((e, r) => {
              t += `<tr>\n                                                <td>${
                r + 1
              }</td>\n                                                <td>${
                e.s_task_name
              } <br>\n                                                    <span class="font-weight-normal small"> ${ststus_text(
                e.s_priority
              )} ${
                e.s_priority
              }</span>\n                                                </td>\n                                                <td>\n                                                ${ststus_text(
                e.s_status
              )} ${
                e.s_status
              } </td>\n                                                <td>${
                e.created_date
              }</td>\n                                                <td>${
                e.d_due_date
              }</td> \n                                                <td>${
                e.revised_date
              }</td> \n                                                <td>${
                e.task_created_by
              }</td>\n                                                <td>${
                e.assign_to
              }</td> \n                                            </tr>`;
            }),
              $("#task_report_list").html(t),
              $("#task_report_tbl").DataTable({
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
      (get_emp_list_by_dept_by_em_code = () => {
        try {
          (data = {
            role: getlocalItem("role"),
            emp_code: getlocalItem("em_code"),
            dep_head: getlocalItem("dep_head"),
            tag: getlocalItem("tag"),
          }),
            $.ajax({
              type: "POST",
              url: "/ess/get_emp_list_by_dept_by_em_code",
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
                }, 1e3);
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
      get_emp_list_by_dept_by_em_code(),
      get_task_report_for_DH();
  },
});
