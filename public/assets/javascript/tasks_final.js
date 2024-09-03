!(function (e) {
  var t = {};
  function a(r) {
    if (t[r]) return t[r].exports;
    var l = (t[r] = { i: r, l: !1, exports: {} });
    return e[r].call(l.exports, l, l.exports, a), (l.l = !0), l.exports;
  }
  (a.m = e),
    (a.c = t),
    (a.d = function (e, t, r) {
      a.o(e, t) || Object.defineProperty(e, t, { enumerable: !0, get: r });
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
      var r = Object.create(null);
      if (
        (a.r(r),
        Object.defineProperty(r, "default", { enumerable: !0, value: e }),
        2 & t && "string" != typeof e)
      )
        for (var l in e)
          a.d(
            r,
            l,
            function (t) {
              return e[t];
            }.bind(null, l)
          );
      return r;
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
    a((a.s = 13));
})({
  13: function (e, t) {
    alert(),
      (function () {
        var e = {};
        let t = [];
        $("#em_code").val(getlocalItem("em_code"));
        class a {
          static drow_dept_list(e) {
            t = e;
            let a = '<option label="Select Dept"></option>';
            e.forEach((e, t) => {
              a += `<option value="${e.n_dep_id}">${e.s_dep_name}</option>`;
            }),
              $("#n_dep_id").html(a);
          }
          static drow_emp_list(e) {
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
          static drow_attach(e) {
            try {
              let t = "";
              e.forEach((e, a) => {
                var r = `${e.s_path}/${e.s_new_name}`;
                t += `\n                    <li href="${e.s_path}/${e.s_new_name}" class="list-group-item d-flex justify-content-between align-items-center">${e.s_ogi_name}\n                    <span>\n                        <button type="button" class="btn btn-sm btn-info"><i class="far fa-arrow-alt-circle-down" onclick="download_file('${r}','${e.s_ogi_name}')"></i></button>\n                        <button type="button" class="btn btn-sm btn-danger"><i class="far fa-trash-alt" onclick="delete_file(${e.n_temp_id})"></i></button>\n                    </span>\n                    \n                    </li>`;
              }),
                $("#file_upload").html(t);
            } catch (e) {
              alert(e);
            }
          }
          static task_list(e) {
            try {
              let t = "";
              e.forEach((e, a) => {
                t += ` \n                                <tr> \n                                    <td>\n                                        <a href="#/tasks?task_key=${
                  e.n_task_id
                }">\n                                            <i class="fas fa-edit"></i> Task-l${
                  e.n_task_id
                } ${
                  e.s_task_name
                }\n                                        </a>\n                                    </td>\n                                    <td>${ststus_text(
                  e.s_priority
                )} ${
                  e.s_priority
                }</td>\n                                    <td>${
                  e.s_status
                }</td>\n                                    <td>${
                  e.created_by
                }</td>\n                                    <td>${
                  e.d_start_date
                }</td>\n                                    <td>${
                  e.d_due_date
                }</td>\n                                </tr>`;
              }),
                $("#task_list").html(t);
            } catch (e) {
              alert(e);
            }
          }
        }
        ststus_text = (e) => {
          var t = "";
          switch (e) {
            case "Important":
              t = '<i class="fas fa-exclamation-circle text-denger"></i>';
              break;
            case "Medium":
              t = '<i class="far fa-circle text-success"></i>';
              break;
            case "Low":
              t = '<i class="far fa-arrow-alt-circle-down text-info"></i>';
          }
          return t;
        };
        (get_attachemnt = (t) => {
          try {
            (e = {
              role: getlocalItem("role"),
              emp_code: getlocalItem("em_code"),
              task_head: t,
            }),
              $.ajax({
                type: "POST",
                url: "/task/get_attachemnt",
                crossDomain: !0,
                data: e,
                beforeSend: function () {
                  $("#file_upload").html("");
                },
                success: function (e) {
                  a.drow_attach(e.data),
                    callAlert("success", success_handling(e));
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {},
              });
          } catch (e) {
            callAlert("error", error_handling(e));
          }
        }),
          (get_emp_list_by_dept = (t) => {
            try {
              (e = {
                role: getlocalItem("role"),
                emp_code: getlocalItem("em_code"),
                dep: t.value || t,
                dep_head: getlocalItem("dep_head"),
              }),
                $.ajax({
                  type: "POST",
                  url: "/task/get_emp_list_by_dept",
                  crossDomain: !0,
                  data: e,
                  beforeSend: function () {
                    $("#s_em_code").html("");
                  },
                  success: function (e) {
                    a.drow_emp_list(e.data),
                      callAlert("success", success_handling(e));
                  },
                  error: function (e) {
                    callAlert("error", error_handling(e));
                  },
                  complete: function (e) {},
                });
            } catch (e) {
              callAlert("error", error_handling(e));
            }
          }),
          $("#submit_leave").click(function () {
            return (
              (btn = this.id),
              setTimeout(() => {
                $("#task-form").submit();
              }, 1e3),
              !0
            );
          }),
          $("#submit_add_more").click(function () {
            return (
              (btn = this.id),
              setTimeout(() => {
                $("#task-form").submit();
              }, 1e3),
              !0
            );
          }),
          $.validator.addMethod(
            "start_date",
            function (e, t) {
              return new Date() < new Date($("#d_start_date").val());
            },
            "Date should be greater then today date."
          ),
          $.validator.addMethod(
            "greaterThan",
            function (e, t, a) {
              return /Invalid|NaN/.test(new Date(e))
                ? (isNaN(e) && isNaN($(a).val())) ||
                    Number(e) >= Number($(a).val())
                : new Date(e) >= new Date($(a).val());
            },
            "Must be greater than or equal to Start date."
          );
        var r = $("#task-form")
          .bind("invalid-form.validate", function () {
            alert(
              "Your missed " +
                r.numberOfInvalids() +
                " input, see the details below red in color."
            );
          })
          .validate({
            submitHandler: function (t) {
              (e = {
                n_dep_id: $("#n_dep_id").val(),
                s_task_name: $("#s_task_name").val(),
                s_em_code: $("#s_em_code").val(),
                d_start_date: $("#d_start_date").val(),
                d_due_date: $("#d_due_date").val(),
                s_task_desc: $("#s_task_desc").val(),
                s_priority: $("#s_priority").val(),
                s_status: $("#s_status").val(),
                s_created_by: getlocalItem("em_code"),
              }),
                $.ajax({
                  type: "POST",
                  url: "/task/submit_task",
                  crossDomain: !0,
                  data: e,
                  beforeSend: function () {
                    add_loader("loader");
                  },
                  success: function (e) {
                    "submit_leave" == btn && $(".close_modal").click(),
                      callAlert("success", success_handling(e)),
                      setTimeout(() => {
                        clear_filed();
                      }, 1e3);
                  },
                  error: function (e) {
                    callAlert("error", error_handling(e));
                  },
                  complete: function (e) {
                    remove_loader("loader");
                  },
                });
            },
            rules: {
              n_dep_id: { required: !0 },
              s_task_name: { required: !0, minlength: 3, maxlength: 400 },
              s_em_code: { required: !0 },
              d_start_date: "start_date",
              d_due_date: { greaterThan: "#d_start_date" },
              s_task_desc: { required: !0, minlength: 10, maxlength: 1800 },
              s_priority: { required: !0 },
              s_status: { required: !0 },
            },
            messages: {},
          });
        let l = "";
        (clear_filed = () => {
          alert(""),
            $("#s_filter_task").val(
              check_string_val(
                sessionStorage.getItem("filter_value"),
                "Assigned"
              )
            ),
            $(".if_edit").show(),
            $(".if_new").hide(),
            $(".title_name").text("New"),
            $("#n_dep_id").val(""),
            $("#s_task_name").val(""),
            $("#s_em_code").val(""),
            $("#d_start_date").val(""),
            $("#d_due_date").val(""),
            $("#s_task_desc").val(""),
            class {
              static get_dept_list() {
                try {
                  (e = {
                    role: getlocalItem("role"),
                    emp_code: getlocalItem("em_code"),
                    dep_head: getlocalItem("dep_head"),
                  }),
                    $.ajax({
                      type: "POST",
                      url: "/task/get_dept_list",
                      crossDomain: !0,
                      data: e,
                      beforeSend: function () {},
                      success: function (e) {
                        a.drow_dept_list(e.data),
                          callAlert("success", success_handling(e));
                      },
                      error: function (e) {
                        callAlert("error", error_handling(e));
                      },
                      complete: function () {},
                    });
                } catch (e) {
                  callAlert("error", error_handling(error));
                }
              }
            }.get_dept_list(),
            setTimeout(() => {
              (l = getAllUrlParams(window.location)),
                l.task_key
                  ? get_task_by_id(l.task_key)
                  : (window.location = "/main#/tasks"),
                get_attachemnt(l.task_key);
            }, 500);
        }),
          (calltemp = (e) => {
            try {
              if (!e)
                return void callAlert(
                  "error",
                  error_handling("No response found !")
                );
              var t = $("#" + e)
                .contents()
                .find("pre")
                .html();
              if (!t)
                return void callAlert(
                  "error",
                  error_handling("No response found !")
                );
              var a = this.JSON.parse(t);
              a.code
                ? callAlert("error", error_handling(a))
                : ($("#fileupload").val(""),
                  callAlert("success", success_handling(a)),
                  setTimeout(() => {
                    get_attachemnt();
                  }, 1e3)),
                btn_enable("#upload-button"),
                remove_spinner("#snip_lod");
            } catch (e) {
              callAlert("error", error_handling(e));
            }
          }),
          (get_upload = (e) => {
            "" != check_string_val($("#fileupload").val(), "") &&
              setTimeout(() => {
                btn_disable("#" + e.id), add_spinner("#snip_lod");
              }, 500);
          }),
          (delete_file = (t) => {
            try {
              if (!confirm("Do you really want to delete the attachment ?"))
                return void callAlert(
                  "success",
                  success_handling("File not deleted.")
                );
              (e = {
                role: getlocalItem("role"),
                emp_code: getlocalItem("em_code"),
                id: t,
              }),
                $.ajax({
                  type: "POST",
                  url: "/task/delete_file",
                  crossDomain: !0,
                  data: e,
                  beforeSend: function () {
                    $("#file_upload").html("");
                  },
                  success: function (e) {
                    callAlert("success", success_handling(e)),
                      setTimeout(() => {
                        get_attachemnt();
                      }, 2e3);
                  },
                  error: function (e) {
                    callAlert("error", error_handling(e));
                  },
                  complete: function (e) {},
                });
            } catch (e) {
              callAlert("error", error_handling(e));
            }
          }),
          (get_task_by_id = (t) => {
            try {
              (e = {
                role: getlocalItem("role"),
                emp_code: getlocalItem("em_code"),
                id: t,
                filter_task: $("#s_filter_task").val(),
              }),
                $.ajax({
                  type: "POST",
                  url: "/task/get_task_by_id",
                  crossDomain: !0,
                  data: e,
                  beforeSend: function () {},
                  success: function (e) {
                    e.data &&
                      (callAlert("success", success_handling(e)),
                      $("#get_edit").click(),
                      $(".if_edit").hide(),
                      $(".if_new").show(),
                      "Completed" == e.data.s_status &&
                        $("#update_task_status").remove(),
                      get_emp_list_by_dept(e.data.n_dep_id),
                      setTimeout(() => {
                        $(".title_name").text("Edit"),
                          $("#n_dep_id").val(e.data.n_dep_id),
                          $("#s_task_name").val(e.data.s_task_name),
                          $("#s_em_code").val(e.data.s_em_code),
                          $("#d_start_date").val(e.data.d_start_date),
                          $("#d_due_date").val(e.data.d_due_date),
                          $("#s_task_desc").val(e.data.s_task_desc),
                          $("#s_status").val(e.data.s_status);
                      }, 200));
                  },
                  error: function (e) {
                    callAlert("error", error_handling(e));
                  },
                  complete: function (e) {},
                });
            } catch (e) {
              callAlert("error", error_handling(e));
            }
          }),
          (close_modal = () => {
            $(".close_modal").click(), (window.location = "#/tasks");
          }),
          (update_task_status = () => {
            try {
              (e = {
                role: getlocalItem("role"),
                emp_code: getlocalItem("em_code"),
                s_status: $("#s_status").val(),
                s_remark: $("#s_remark").val(),
                task_id: l.task_key,
              }),
                $.ajax({
                  type: "POST",
                  url: "/task/update_task",
                  crossDomain: !0,
                  data: e,
                  beforeSend: function () {},
                  success: function (e) {
                    callAlert("success", success_handling(e));
                  },
                  error: function (e) {
                    callAlert("error", error_handling(e));
                  },
                  complete: function (e) {},
                });
            } catch (e) {
              callAlert("error", error_handling(e));
            }
          }),
          $("#update_task_status").click(function (e) {
            update_task_status();
          }),
          clear_filed();
      })();
  },
});
