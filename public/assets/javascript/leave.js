!(function (e) {
  var t = {};
  function a(n) {
    if (t[n]) return t[n].exports;
    var _ = (t[n] = { i: n, l: !1, exports: {} });
    return e[n].call(_.exports, _, _.exports, a), (_.l = !0), _.exports;
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
        for (var _ in e)
          a.d(
            n,
            _,
            function (t) {
              return e[t];
            }.bind(null, _)
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
    a((a.s = 5));
})({
  5: function (e, t) {
    !(function () {
      var e = {},
        t = [];
      $("select:not(.normal)").each(function () {
        $(".select2_emp").select2({
          dropdownParent: $(".select2_emp").parent(),
        });
      }),
        $("#d_apply_date").val(current_date());
      class a {
        static drow_emplist(e) {
          try {
            let t = '<option label="Select Employee"></option>';
            e.forEach((e, a) => {
              t += `<option value="${e.s_em_code}">${e.s_em_code} (${e.name})</option>`;
            }),
              $("#s_em_code").html(t);
          } catch (e) {
            alert(e);
          }
        }
        static drow_leave_list(e) {
          try {
            let t = '<option label="Select Leave"></option>';
            e.forEach((e, a) => {
              t += `<option value="${e.n_type_id}">${e.leave_type_name}</option>`;
            }),
              $("#n_type_id").html(t);
          } catch (e) {
            alert(e);
          }
        }
        static draw_my_leave(e) {
          try {
            let t = "",
              a = "",
              n = "none",
              _ = "none",
              d = "";
            $("#my_leave_rec").html(""),
              e.forEach((e, r) => {
                "Approved" == e.s_leave_status
                  ? ((a = "success"),
                    (d = "check"),
                    (n = "none"),
                    (_ = "block"))
                  : "Not Approve" == e.s_leave_status
                  ? ((a = "info"), (n = "block"), (_ = "none"))
                  : "Rejected" == e.s_leave_status &&
                    ((a = "danger"),
                    (d = "times"),
                    (n = "none"),
                    (_ = "block")),
                  (t += `<tr>\n                                    <td>\n                                        <button type="button" onclick="delete_rec(${e.n_emp_leave_id});" class="btn btn-sm btn-danger" style="display:${n}">\n                                            <i class="fas fa-trash"></i>\n                                        </button>\n                                         <span style="display:${_}">\n                                            <i class="fas fa-${d}"></i>\n                                        </span>  \n                                       \n                                    </td>\n                                    <td><span class="text-${a}">${e.s_leave_status}</span></td>\n                                    <td>${e.s_leave_type}</td>\n                                    <td>${e.d_apply_date}</td>\n                                    <td>${e.d_start_date}</td>\n                                    <td>${e.d_end_date}</td>\n                                    <td>${e.d_leave_duration}</td>\n                                    <td>${e.approve_name}</td>\n                                </tr>`);
              }),
              $("#my_leave_rec").html(t);
          } catch (e) {
            alert(e);
          }
        }
        static draw_pending_leave(e) {
          try {
            let t = "";
            e.forEach((e, a) => {
              t += `<tr>\n                                    <td>\n                                        <button onclick="update_leave(this,${e.n_emp_leave_id});" class="btn btn-sm btn-success" id="btn_Approved">\n                                            <i class="fas fa-check-circle"></i>\n                                        </button>\n                                        \n                                        |\n                                        <button onclick="update_leave(this,${e.n_emp_leave_id});" class="btn btn-sm btn-danger" id="btn_Rejected">\n                                            <i class="far fa-times-circle"></i>\n                                        </button>\n                                        \n                                        |\n                                        <button onclick="view_leave(${e.n_emp_leave_id});" class="btn btn-sm btn-info" id="btn_View">\n                                            <i class="far fa-eye"></i>\n                                        </button>\n                                    </td>\n                                    <td>(<span class="badge bg-warning">${e.s_leave_status}</span>) ${e.s_leave_type}</td>\n                                    <td>${e.emp_name}</td>\n                                    <td>${e.d_apply_date}</td>\n                                    <td>${e.d_start_date}</td>\n                                    <td>${e.d_end_date}</td>\n                                    <td>${e.d_leave_duration}</td>\n                                </tr>`;
            }),
              $("#approve_leave_rec").html(t),
              $(".pending_cnt").text(e.length);
          } catch (e) {
            alert(e);
          }
        }
      }
      (chenage_duration = (e) => {
        "ABOVE A DAY" == get_radio_input_value(e.name || e)
          ? $(".above_day").show()
          : ($(".above_day").hide(),
            $("#d_end_date").val(""),
            "s_leave_type_2hd" == e.id || "s_leave_type_1hd" == e.id
              ? $(".d_leave_duration").text(
                  date_diff_in_days(
                    $("#d_start_date").val(),
                    $("#d_end_date").val()
                  ) + 0.5
                )
              : $(".d_leave_duration").text(
                  date_diff_in_days(
                    $("#d_start_date").val(),
                    $("#d_end_date").val()
                  ) + 1
                ));
      }),
        (get_emp_rec = (t) => {
          try {
            (e = {
              role: getlocalItem("role"),
              emp_code: getlocalItem("em_code"),
              approver: t,
            }),
              $.ajax({
                type: "POST",
                url: "/ess/get_emp_list",
                crossDomain: !0,
                data: e,
                beforeSend: function () {
                  $("#s_em_code").html("");
                },
                success: function (e) {
                  a.drow_emplist(e.data);
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {},
              });
          } catch (e) {
            alert(error_handling(e));
          }
        }),
        (get_leave_type = (n) => {
          try {
            (e = { emp_code: $("#" + n).val() }),
              $.ajax({
                type: "POST",
                url: "/ess/get_leave_type_by_id",
                crossDomain: !0,
                data: e,
                beforeSend: function () {
                  $("#n_type_id").html("");
                },
                success: function (e) {
                  $(".pending_leaves").text(0),
                    0 != e.data.length
                      ? (a.drow_leave_list(e.data),
                        (t = e.data),
                        callAlert("success", success_handling(e)))
                      : callAlert(
                          "warning",
                          error_handling(
                            "Leave not assigned by HR or System Admin."
                          )
                        );
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {},
              });
          } catch (e) {
            alert(error_handling(e));
          }
        }),
        (get_pending_leave = (e) => {
          let a = t.findIndex((t) => t.n_type_id == (e.value || e)),
            n =
              parseFloat(check_string_val(t[a].n_max_leave_in_month, 0)) -
              parseFloat(check_string_val(t[a].n_consumed_days, 0));
          $(".pending_leaves").text(n);
        }),
        $.validator.addMethod(
          "greaterThan",
          function (e, t, a) {
            return /Invalid|NaN/.test(new Date(e))
              ? (isNaN(e) && isNaN($(a).val())) ||
                  Number(e) > Number($(a).val())
              : new Date(e) > new Date($(a).val());
          },
          "Must be greater than From date."
        ),
        $.validator.addMethod(
          "start_date",
          function (e, t) {
            return new Date() < new Date($("#d_start_date").val());
          },
          "Date should be greater then start date."
        );
      var n = $("#form-leave")
        .bind("invalid-form.validate", function () {
          alert(
            "Your missed " +
              n.numberOfInvalids() +
              " input, see the details below red in color."
          );
        })
        .validate({
          submitHandler: function () {
            if (confirm("Do you want to Apply ? ")) {
              var e = {
                s_em_code: $("#s_em_code").val(),
                n_type_id: $("#n_type_id").val(),
                s_leave_type: get_radio_input_value("s_leave_type"),
                d_start_date: $("#d_start_date").val(),
                d_end_date: $("#d_end_date").val(),
                s_reason: $("#s_reason").val(),
                s_created_by: getlocalItem("em_code"),
                d_leave_duration: $(".d_leave_duration ").text(),
              };
              $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/ess/submit_leave",
                data: JSON.stringify(e),
                dataType: "json",
                beforeSend: function () {
                  add_loader("loader");
                },
                success: function (e) {
                  callAlert("success", success_handling(e));
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {
                  remove_loader("loader"),
                    "DURATION_NOT_ALLOW" === e.responseJSON.mess ||
                    "NOT_ALLOW" === e.responseJSON.mess ||
                    "NOT_REPORTING_PERSON" === e.responseJSON.mess
                      ? callAlert("error", error_handling(e))
                      : (clear_filed(),
                        $(".close_modal").click(),
                        setTimeout(() => {
                          get_emp_myleave();
                        }, 2e3));
                },
              });
            }
          },
          rules: {
            s_em_code: { required: !0 },
            n_type_id: { required: !0 },
            d_start_date: { required: !0 },
            d_end_date: { greaterThan: "#d_start_date" },
            s_reason: { required: !0, minlength: 10, maxlength: 100 },
          },
          messages: {},
        });
      (clear_filed = () => {
        $("#s_leave_type").val(""),
          $("#d_start_date").val(""),
          $("#d_end_date").val(""),
          $("#s_reason").val(""),
          $(".d_leave_duration").text(0),
          $(".pending_leaves").text(0),
          $("#s_em_code").val(""),
          $("#n_type_id").val(""),
          $("#n_type_id").prop("disabled", !1),
          $("#s_leave_type").prop("disabled", !1),
          $("#d_start_date").prop("disabled", !1),
          $("#d_end_date").prop("disabled", !1),
          $("#s_reason").prop("disabled", !1),
          $("#s_em_code").prop("disabled", !1),
          $("input[name='s_leave_type']").attr("disabled", !1),
          $("#submit_leave").show(),
          $(".view_btn").hide();
      }),
        (get_emp_myleave = () => {
          try {
            (e = {
              role: getlocalItem("role"),
              emp_code: getlocalItem("em_code"),
            }),
              $.ajax({
                type: "POST",
                url: "/ess/get_emp_myleave",
                crossDomain: !0,
                data: e,
                beforeSend: function () {
                  $(".my_leave").show(),
                    $(".my_approver").hide(),
                    $("#my_leave_rec").html("");
                },
                success: function (e) {
                  if (0 == e.data.length)
                    return (
                      $("#my_leave_rec").html("No Record Found !"),
                      void callAlert(
                        "warning",
                        error_handling("No Record Found !")
                      )
                    );
                  a.draw_my_leave(e.data),
                    callAlert("success", success_handling(e));
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {
                  get_emp_approver_leave();
                },
              });
          } catch (e) {
            alert(error_handling(e));
          }
        }),
        (get_emp_approver_leave = () => {
          try {
            (e = {
              role: getlocalItem("role"),
              emp_code: getlocalItem("em_code"),
            }),
              $.ajax({
                type: "POST",
                url: "/ess/get_emp_approver_leave",
                crossDomain: !0,
                data: e,
                beforeSend: function () {
                  $("#approve_leave_rec").html(""), $(".pending_cnt").text(0);
                },
                success: function (e) {
                  if (0 == e.data.length)
                    return (
                      $("#approve_leave_rec").html("No Record Found !"),
                      void callAlert(
                        "warning",
                        error_handling("No Record Found !")
                      )
                    );
                  a.draw_pending_leave(e.data),
                    callAlert("success", success_handling(e));
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {},
              });
          } catch (e) {
            alert(error_handling(e));
          }
        }),
        (get_pen_leave = () => {
          $(".my_leave").hide(), $(".my_approver").show();
        }),
        (update_leave = (t, a) => {
          try {
            if (
              ("btn_Approved" === t.id || "btn_Rejected" === t.id) &&
              !confirm("Do you want to Go Ahead ? ")
            )
              return;
            (e = {
              id: a,
              role: getlocalItem("role"),
              emp_code: getlocalItem("em_code"),
              status: t.id,
            }),
              $.ajax({
                type: "POST",
                url: "/ess/update_leave",
                crossDomain: !0,
                data: e,
                beforeSend: function () {},
                success: function (e) {
                  callAlert("success", success_handling(e));
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {
                  setTimeout(() => {
                    get_emp_approver_leave();
                  }, 2e3);
                },
              });
          } catch (e) {
            alert(error_handling(e));
          }
        }),
        (leave_update = (e) => {
          update_leave(e, $("#n_emp_leave_id").val()),
            $(".close_modal").click();
        }),
        $("input[type=date]").on("input", function () {
          "2 HALF" == get_radio_input_value("s_leave_type") ||
          "1 HALF" == get_radio_input_value("s_leave_type")
            ? $(".d_leave_duration").text(
                date_diff_in_days(
                  $("#d_start_date").val(),
                  $("#d_end_date").val()
                ) + 0.5
              )
            : $(".d_leave_duration").text(
                date_diff_in_days(
                  $("#d_start_date").val(),
                  $("#d_end_date").val()
                ) + 1
              );
        }),
        (delete_rec = (t) => {
          try {
            if (!confirm("Do you want to Delete this ? ")) return;
            (e = {
              id: t,
              role: getlocalItem("role"),
              emp_code: getlocalItem("em_code"),
            }),
              $.ajax({
                type: "POST",
                url: "/ess/delete_rec",
                crossDomain: !0,
                data: e,
                beforeSend: function () {},
                success: function (e) {
                  callAlert("success", success_handling(e));
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {
                  get_emp_myleave();
                },
              });
          } catch (e) {
            alert(error_handling(e));
          }
        }),
        (view_leave = (t) => {
          try {
            $(".modal-lg").click(),
              get_emp_rec("APPROVER"),
              (e = { id: t, emp_code: getlocalItem("em_code") }),
              $.ajax({
                type: "POST",
                url: "/ess/view_leave",
                crossDomain: !0,
                data: e,
                beforeSend: function () {
                  $("#submit_leave").hide(), $(".view_btn").show();
                },
                success: function (e) {
                  setTimeout(() => {
                    bind_redio_input_value("s_leave_type", e.data.s_leave_type),
                      chenage_duration("s_leave_type"),
                      $(".select2_emp")
                        .select2()
                        .val(e.data.s_em_code)
                        .trigger("change"),
                      $("#n_emp_leave_id").val(e.data.n_emp_leave_id),
                      $("#d_start_date").val(e.data.d_start_date),
                      $("#d_end_date").val(e.data.d_end_date),
                      $("#s_reason").val(e.data.s_reason),
                      $("#d_apply_date").val(e.data.d_apply_date),
                      $("#s_leave_type").val(e.data.s_leave_type),
                      $(".d_leave_duration").text(e.data.d_leave_duration);
                  }, 1e3),
                    setTimeout(() => {
                      get_leave_type("s_em_code"),
                        setTimeout(() => {
                          $("#n_type_id").val(e.data.n_type_id),
                            get_pending_leave($("#n_type_id").val());
                        }, 2e3);
                    }, 2e3),
                    callAlert("success", success_handling(e));
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {
                  $("#n_type_id").prop("disabled", !0),
                    $("#s_leave_type").prop("disabled", !0),
                    $("#d_start_date").prop("disabled", !0),
                    $("#d_end_date").prop("disabled", !0),
                    $("#s_reason").prop("disabled", !0),
                    $("#s_em_code").prop("disabled", !0),
                    $("input[name='s_leave_type']").attr(
                      "disabled",
                      "disabled"
                    );
                },
              });
          } catch (e) {
            alert(error_handling(e));
          }
        }),
        get_emp_rec(),
        get_emp_myleave();
    })();
  },
});
