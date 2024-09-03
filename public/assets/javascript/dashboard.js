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
    a((a.s = 0));
})([
  function (e, t) {
    (getEmpAttend = function () {
      try {
        var e = {
          type: getlocalItem("role"),
          em_code: getlocalItem("em_code"),
        };
        $.ajax({
          type: "POST",
          contentType: "application/json",
          url: "/ess/getEmpAttend",
          data: JSON.stringify(e),
          dataType: "json",
          beforeSend: function () {
            add_loader("loader");
          },
          success: function (e) {
            var t = "",
              a = "",
              n = "",
              r = "";
            e.data.forEach((e) => {
              (a = null == e.t_signin_time ? "-" : e.t_signin_time),
                (n = null == e.t_signout_time ? "-" : e.t_signout_time),
                (r = null == e.s_status ? "-" : e.s_status),
                (t += `<tr>\n                    <td>\n                        <div class="d-flex" style="white-space: normal;">\n                            <div class="image">\n                                <img src="${e.profile}" class="img-circle" style="width:50px;height:50px;">\n                            </div>\n                            <div class="info">\n                                <a href="#/addEmployee/${e.s_em_email}?empcode=${e.s_em_code}" class="d-block sidenm">${e.s_em_code}(${e.name})</a>\n                            </div>\n                        </div>\n                    </td> \n                    <td>${e.s_shift_id}</td>\n                    <td>${e.s_work_type}</td> \n                    <td>${a}</td>\n                    <td>${n}</td>\n                    <td>${r}</td>\n                    </tr>`);
            }),
              $("#empattend").html(t);
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
      (get_dash_data_a = function () {
        try {
          var e = {
            role: getlocalItem("role"),
            em_code: getlocalItem("em_code"),
          };
          $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/ess/get_dash_data_a",
            data: JSON.stringify(e),
            dataType: "json",
            beforeSend: function () {
              add_loader("loader");
            },
            success: function (e) {
              let t = e.data.length > 0 || e.data[0] ? e.data[0] : 0,
                a = e.data.length > 0 || e.data[1] ? e.data[1] : 0,
                n = e.data.length > 0 || e.data[2] ? e.data[2] : 0,
                r = e.data.length > 0 || e.data[3] ? e.data[3][0] : 0;
              0 != t &&
                ($(".ttl_active_emp").text(t[0].CNT_ACTIVE),
                $(".ttl_inactive_emp").text(t[0].CNT_INACTIVE)),
                0 != a &&
                  ((total_leave = [
                    ...new Set(a.map((e) => e.ttl_leave_cnt)),
                  ].reduce((e, t) => e + t, 0)),
                  a.forEach((e, t) => {
                    current_date() == e.d_start_date &&
                      $(".today_ttl_leave").text(e.ttl_leave_cnt);
                  }),
                  $(".ttl_leave_apply").text(total_leave)),
                0 != n &&
                  ((n = n[0]),
                  $(".ttl_pending_task").text(n.Pending_task),
                  $(".Drop_percentage_ttl").text(n.Drop_percentage),
                  $(".Drop_percentage").text(n.Drop_percentage),
                  $(".Drop_percentage").css("width", n.Drop_percentage),
                  $(".Drop").text(n.Drop),
                  $(".Completed_percentage").css(
                    "width",
                    n.Completed_percentage
                  ),
                  $(".Completed_percentage").text(n.Completed_percentage),
                  $(".Completed").text(n.Completed),
                  $(".WIP_percentage").css("width", n.WIP_percentage),
                  $(".WIP_percentage").text(n.WIP_percentage),
                  $(".WIP").text(n.WIP),
                  $(".Assigned_percentage").css("width", n.Assigned_percentage),
                  $(".Assigned_percentage").text(n.Assigned_percentage),
                  $(".Assigned").text(n.Assigned),
                  $(".Return_percentage").css("width", n.Return_percentage),
                  $(".Return_percentage").text(n.Return_percentage),
                  $(".Return").text(n.Return),
                  $(".ttl_task").text(
                    n.Completed + n.WIP + n.Assigned + n.Return
                  )),
                check_string_val(r.today_availaility, "") &&
                  ($(".today_p").text(
                    r.today_availaility.split(":")[0].split("=")[1]
                  ),
                  $(".today_a").text(
                    r.today_availaility.split(":")[1].split("=")[1]
                  ),
                  $(".today_li").text(
                    r.today_availaility.split(":")[2].split("=")[1]
                  ));
            },
            error: function (e) {
              callAlert("error", error_handling(e));
            },
            complete: function (e) {
              remove_loader("loader"), getEmpAttend();
            },
          });
        } catch (e) {
          callAlert("error", error_handling(e));
        }
      }),
      get_dash_data_a();
  },
]);
