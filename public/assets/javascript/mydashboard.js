!(function (t) {
  var e = {};
  function n(a) {
    if (e[a]) return e[a].exports;
    var r = (e[a] = { i: a, l: !1, exports: {} });
    return t[a].call(r.exports, r, r.exports, n), (r.l = !0), r.exports;
  }
  (n.m = t),
    (n.c = e),
    (n.d = function (t, e, a) {
      n.o(t, e) || Object.defineProperty(t, e, { enumerable: !0, get: a });
    }),
    (n.r = function (t) {
      "undefined" != typeof Symbol &&
        Symbol.toStringTag &&
        Object.defineProperty(t, Symbol.toStringTag, { value: "Module" }),
        Object.defineProperty(t, "__esModule", { value: !0 });
    }),
    (n.t = function (t, e) {
      if ((1 & e && (t = n(t)), 8 & e)) return t;
      if (4 & e && "object" == typeof t && t && t.__esModule) return t;
      var a = Object.create(null);
      if (
        (n.r(a),
        Object.defineProperty(a, "default", { enumerable: !0, value: t }),
        2 & e && "string" != typeof t)
      )
        for (var r in t)
          n.d(
            a,
            r,
            function (e) {
              return t[e];
            }.bind(null, r)
          );
      return a;
    }),
    (n.n = function (t) {
      var e =
        t && t.__esModule
          ? function () {
              return t.default;
            }
          : function () {
              return t;
            };
      return n.d(e, "a", e), e;
    }),
    (n.o = function (t, e) {
      return Object.prototype.hasOwnProperty.call(t, e);
    }),
    (n.p = ""),
    n((n.s = 7));
})({
  7: function (t, e) {
    !(function () {
      var t = "" + GetFormattedDate(),
        e = "PUNCH_IN";
      $("#pdate").html(t),
        currentTime("ptime", "t_signin_time"),
        $("#d_atten_date").val(current_date()),
        $("#timediv").hide(),
        (get_today_pucnch_in = function () {
          try {
            var n = {
              s_work_type: $("#s_work_type").val(),
              d_atten_date: $("#d_atten_date").val(),
              s_created_by: getlocalItem("em_code"),
              tag: e,
            };
            debugger;
            $.ajax({
              type: "POST",
              contentType: "application/json",
              url: "/ess/get_today_pucnch",
              data: JSON.stringify(n),
              dataType: "json",
              beforeSend: function () {
                add_loader("loader");
              },
              success: function (e) {
                1 == e.data.length &&
                  ($("#punch_in").remove(),
                  null == e.data[0].t_signout_time ||
                  "" == e.data[0].t_signout_time
                    ? ((t =
                        ' <button type="submit" class="btn btn-primary btn-sm btn-block" id="punch_out" onclick="punchout();">\n                            <i class="fas fa-hand-point-up"></i> Punch-Out</button>'),
                      $("#divbtn").html(t),
                      $("#potime").hide())
                    : ($("#potime").show(),
                      $("#punch_out").remove(),
                      $("#poutdtime").text(
                        e.data[0].d_atten_date + " " + e.data[0].t_signout_time
                      )),
                  $("#timediv").show(),
                  $("#pdtime").text(
                    e.data[0].d_atten_date + " " + e.data[0].t_signin_time
                  ),
                  $("#d_atten_date").val(e.data[0].d_atten_date),
                  $("#t_signin_time").val(e.data[0].t_signin_time),
                  $("#s_work_type").val(e.data[0].s_work_type),
                  $("#s_work_type").prop("disabled", !0));
              },
              error: function (t) {
                callAlert("error", error_handling(t));
              },
              complete: function (t) {
                remove_loader("loader");
              },
            });
          } catch (t) {
            callAlert("error", error_handling(t));
          }
        }),
        (getEmpAssignLeave = function () {
        
          try {
            var t = {
              f_dateyear: get_current_fyear(),
              s_em_code: getlocalItem("em_code"),
            };
            debugger;
            $.ajax({
              type: "POST",
              contentType: "application/json",
              url: "/ess/getEmpAssignLeave",
              data: JSON.stringify(t),
              dataType: "json",
              beforeSend: function () {
                add_loader("loader");
              },
              success: function (t) {
                var e = "";
                t.data.forEach((t) => {
                  e += `<tr>\n                    <th class="text-center">${t.leavenm}</th><td style="color: blue;" class="text-right">${t.n_assiged_days}</td><td style="color: #af0000;" class="text-right">${t.n_consumed_days}</td><td style="color: #037f03;" class="text-right">${t.pending}</td>\n                    </tr>`;
                }),
                  $("#leavelist").html(e);
              },
              error: function (t) {
                callAlert("error", error_handling(t));
              },
              complete: function (t) {
                remove_loader("loader");
              },
            });
          } catch (t) {
            callAlert("error", error_handling(t));
          }
        }),
        (getEmpAssignTask = function () {
          try {
            var t = {
              s_status: "Assigned",
              s_em_code: getlocalItem("em_code"),
              type: "EMPLOYEE",
            };
            $.ajax({
              type: "POST",
              contentType: "application/json",
              url: "/ess/getEmpAssignTask",
              data: JSON.stringify(t),
              dataType: "json",
              beforeSend: function () {
                add_loader("loader");
              },
              success: function (t) {
                var e = "";
                t.data.forEach((t) => {
                  e += `<tr>\n                        <td style="max-width:400px;"><h5 class="p-0 m-0"><a href="#/tasks?task_key=${
                    t.n_task_id
                  }">${
                    t.s_task_name
                  }</a></h5><small class="truncate">Due on <b>${
                    t.d_due_date
                  }</b></small></td><td>${ststus_text(t.s_priority)} ${
                    t.s_priority
                  }</td>\n                        </tr>`;
                }),
                  $("#assignTask").html(e);
              },
              error: function (t) {
                callAlert("error", error_handling(t));
              },
              complete: function (t) {
                remove_loader("loader");
              },
            });
          } catch (t) {
            callAlert("error", error_handling(t));
          }
        }),
        $("#punch_in").click(function (t) {
          t.preventDefault(), (e = "PUNCH_IN"), $("#punch-in-form").submit();
        }),
        (punchout = function () {
          event.preventDefault(),
            (e = "PUNCH_OUT"),
            $("#punch-in-form").submit();
        });
      var n = $("#punch-in-form")
        .bind("invalid-form.validate", function () {
          alert(
            "Your missed " +
              n.numberOfInvalids() +
              " input, see the details below red in color."
          );
        })
        .validate({
          submitHandler: function () {
            if (
              confirm(
                `Please confirm Your Work Place : ${$(
                  "#s_work_type"
                ).val()},\n            Do you want to ${e} ? `
              )
            ) {
              var t = {
                s_work_type: $("#s_work_type").val(),
                d_atten_date: $("#d_atten_date").val(),
                t_signin_time: $("#t_signin_time").val(),
                s_created_by: getlocalItem("em_code"),
                tag: e,
              };
              $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/ess/punch_in_out",
                data: JSON.stringify(t),
                dataType: "json",
                beforeSend: function () {
                  add_loader("loader");
                },
                success: function (t) {
                  callAlert("success", success_handling(t));
                },
                error: function (t) {
                  callAlert("error", error_handling(t));
                },
                complete: function (t) {
                  remove_loader("loader"), get_today_pucnch_in();
                },
              });
            }
          },
          rules: {
            s_work_type: { required: !0 },
            d_atten_date: { required: !0 },
            t_signin_time: { required: !0 },
          },
          messages: {},
        });
      get_today_pucnch_in(),
        getEmpAssignLeave(),
        "NDH" == getlocalItem("dep_head")
          ? (getEmpAssignTask(), $("#tasklist").show())
          : $("#tasklist").hide();
    })();
  },
});
