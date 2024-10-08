!(function (e) {
  var t = {};
  function o(r) {
    if (t[r]) return t[r].exports;
    var a = (t[r] = { i: r, l: !1, exports: {} });
    return e[r].call(a.exports, a, a.exports, o), (a.l = !0), a.exports;
  }
  (o.m = e),
    (o.c = t),
    (o.d = function (e, t, r) {
      o.o(e, t) || Object.defineProperty(e, t, { enumerable: !0, get: r });
    }),
    (o.r = function (e) {
      "undefined" != typeof Symbol &&
        Symbol.toStringTag &&
        Object.defineProperty(e, Symbol.toStringTag, { value: "Module" }),
        Object.defineProperty(e, "__esModule", { value: !0 });
    }),
    (o.t = function (e, t) {
      if ((1 & t && (e = o(e)), 8 & t)) return e;
      if (4 & t && "object" == typeof e && e && e.__esModule) return e;
      var r = Object.create(null);
      if (
        (o.r(r),
        Object.defineProperty(r, "default", { enumerable: !0, value: e }),
        2 & t && "string" != typeof e)
      )
        for (var a in e)
          o.d(
            r,
            a,
            function (t) {
              return e[t];
            }.bind(null, a)
          );
      return r;
    }),
    (o.n = function (e) {
      var t =
        e && e.__esModule
          ? function () {
              return e.default;
            }
          : function () {
              return e;
            };
      return o.d(t, "a", t), t;
    }),
    (o.o = function (e, t) {
      return Object.prototype.hasOwnProperty.call(e, t);
    }),
    (o.p = ""),
    o((o.s = 6));
})({
  6: function (e, t) {
    localStorage.clear(),
      sessionStorage.clear(),
      $("#login_btn").click(function (e) {
        e.preventDefault(), $("#form-login").submit();
      }),
      $("#form-login").on("submit", function (e) {
        try {
          var t = { username: $("#emailid").val(), password: $("#pass").val() };
          $.ajax({
            url: "/login",
            type: "POST",
            crossDomain: !0,
            data: t,
            beforeSend: function () {
              btn_disable("#login_btn"), add_loader("loader");
            },
            success: function (e) {
              localStorage.setItem("email", e.data.s_em_email),
                localStorage.setItem("name", e.data.s_first_name),
                localStorage.setItem("em_code", e.data.s_em_code),
                localStorage.setItem("role", e.data.s_em_role),
                localStorage.setItem("dep_head", e.data.dep_head),
                localStorage.setItem("id", e.data.s_em_code),
                localStorage.setItem("profile", e.data.s_em_image),
                localStorage.setItem("tag", e.data.s_system_admin),
                console.log(localStorage),
                setTimeout(() => {
                  (window.location = "/main"),
                    remove_loader("loader"),
                    btn_enable("#login_btn");
                }, 100);
            },
            error: function (e) {
              setTimeout(() => {
                remove_loader("loader"),
                  btn_enable("#login_btn"),
                  alert(error_handling(e));
              }, 1e3);
            },
            complete: function (e) {},
          });
        } catch (e) {
          alert(e);
        }
      }),
      (chk_cps = function (e) {
        try {
          if (
            ($("#inputUid_error").text(""), 0 == e.getModifierState("CapsLock"))
          )
            return $("#inputUid_error").text(""), !0;
          $("#inputUid_error").text("Caps Lock activated: ");
        } catch (e) {
          console.log(e);
        }
      });
  },
});
