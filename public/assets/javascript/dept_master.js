!(function (e) {
  var t = {};
  function a(r) {
    if (t[r]) return t[r].exports;
    var n = (t[r] = { i: r, l: !1, exports: {} });
    return e[r].call(n.exports, n, n.exports, a), (n.l = !0), n.exports;
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
        for (var n in e)
          a.d(
            r,
            n,
            function (t) {
              return e[t];
            }.bind(null, n)
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
    a((a.s = 1));
})([
  ,
  function (e, t) {
    !(function () {
      var e = "",
        t = "";
      (emptyfield = () => {
        $("#n_dep_id").val(""),
          $("#s_dep_name").val(""),
          $("#s_dep_head").val("").change();
      }),
        (
          getDeptList = () => {
          try {
            $.ajax({
              type: "POST",
              url: "./ess/getDeptList",
              crossDomain: !0,
              beforeSend: function () {
                add_loader("loader");
              },
              success: function (e) {
                callAlert("success", success_handling(e));
                var t = e.data;
                $.fn.dataTable.isDataTable("#depttbl") &&
                  $("#depttbl").DataTable().destroy(),
                  (table = $("#depttbl").DataTable({
                    data: t,
                    scrollX: !0,
                    aoColumns: [
                      {
                        render: function (e, t, a, r) {
                          return `<a onclick="getDeptById(${a.n_dep_id});" class="btn btn-sm btn-success"><i class="fas fa-edit"></i></a> | <a onclick="deleteDeptById(${a.n_dep_id});" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>`;
                        },
                      },
                      { data: "s_dep_name" },
                      { data: "s_dep_head" },
                    ],
                  }));
              },
              error: function (e) {
                callAlert("error", error_handling(e));
              },
              complete: function () {
                remove_loader("loader");
              },
            });
          } catch (e) {
            remove_loader("loader");
          }
        }),
        (showDeptById = (e) => {
          $("#n_dep_id").val(e.n_dep_id),
            $("#s_dep_name").val(e.s_dep_name),
            $("#s_dep_head").val(e.s_dep_head),
            $(".select2_emp").select2().val(e.s_dep_head).trigger("change");
        }),
        (getDeptById = (e) => {
          try {
            $.ajax({
              type: "POST",
              url: "./ess/getDeptById",
              crossDomain: !0,
              data: { n_dep_id: e },
              beforeSend: function () {
                add_loader("loader");
              },
              success: function (e) {
                callAlert("success", success_handling(e)),
                  $("#updateDept").show(),
                  $("#saveDept").hide(),
                  showDeptById(e.data[0]);
              },
              error: function (e) {
                callAlert("error", error_handling(e));
              },
              complete: function () {
                remove_loader("loader");
              },
            });
          } catch (e) {
            remove_loader("loader");
          }
        }),
        (deleteDeptById = (e) => {
          try {
            confirm("Do you Really want to delete this record") &&
              $.ajax({
                type: "POST",
                url: "./ess/deleteDeptById",
                crossDomain: !0,
                data: { n_dep_id: e },
                beforeSend: function () {
                  add_loader("loader");
                },
                success: function (e) {
                  callAlert("success", success_handling(e)), getDeptList();
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function () {
                  remove_loader("loader");
                },
              });
          } catch (e) {
            remove_loader("loader");
          }
        }),
        $("#cancelDept").click(function (e) {
          emptyfield(), $("#updateDept").hide(), $("#saveDept").show();
        }),
        $("#saveDept").click(function (a) {
          a.preventDefault(),
            (t = "SAVE"),
            (e = "./ess/saveDept"),
            $("#form-dept").submit();
        }),
        $("#updateDept").click(function (a) {
          a.preventDefault(),
            (t = "UPDATE"),
            (e = "./ess/updateDept"),
            $("#form-dept").submit();
        });
      var a = $("#form-dept")
        .bind("invalid-form.validate", function () {
          alert(
            "Your missed " +
              a.numberOfInvalids() +
              " input, see the details below red in color."
          );
        })
        .validate({
          submitHandler: function () {
            if (
              ("SAVE" == t
                ? btn_disable("#saveDept")
                : btn_disable("#updateDept"),
              confirm("Do you want to save and proceed ? "))
            ) {
              var a = {
                n_dep_id: $("#n_dep_id").val(),
                s_dep_name: $("#s_dep_name").val(),
                s_dep_head: $("#s_dep_head").val(),
                s_created_by: getlocalItem("em_code"),
              };
              $.ajax({
                type: "POST",
                contentType: "application/json",
                url: e,
                data: JSON.stringify(a),
                dataType: "json",
                beforeSend: function () {
                  add_loader("loader");
                },
                success: function (e) {
                  callAlert("success", success_handling(e)),
                    emptyfield(),
                    getDeptList(),
                    $("#updateDept").hide(),
                    $("#saveDept").show();
                },
                error: function (e) {
                  callAlert("error", error_handling(e));
                },
                complete: function (e) {
                  remove_loader("loader"),
                    setTimeout(() => {
                      "SAVE" == t
                        ? btn_enable("#saveDept")
                        : btn_enable("#updateDept");
                    }, 1e3);
                },
              });
            }
          },
          rules: {
            s_dep_name: { required: !0, maxlength: 100 },
            s_dep_head: { required: !0, maxlength: 50 },
          },
          messages: { s_dep_name: "Required", s_dep_head: "Required" },
        });
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
                $("#s_dep_head").html("");
              },
              success: function (e) {
                let t = '<option label="Select Employee"></option>';
                e.data.forEach((e, a) => {
                  t += `<option value="${e.s_em_code}">${e.name}</option>`;
                }),
                  $("#s_dep_head").html(t);
              },
              error: function (e) {
                callAlert("error", error_handling(e));
              },
              complete: function (e) {
                setTimeout(() => {
                  $(".select2_emp").select2();
                }, 2e3);
              },
            });
        } catch (e) {
          callAlert("error", error_handling(e));
        }
      }),
        get_emp_rec(),
        getDeptList();
    })();
  },
]);
