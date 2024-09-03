(function () {
  $("#reportrow").hide();
  reset_form = () => {
    try {
      $("#s_em_code").val("");
      $("#start_date").val("");
      $("#end_date").val("");
      $("#reportrow").hide();
    } catch (e) {
      callAlert("error", error_handling(e));
    }
  };
  getallprojectlist = () => {
    debugger;
    try {
      $.ajax({
        type: "POST",
        url: "/ess/getallprojectlist",
        crossDomain: !0,
        //   data: data,
        beforeSend: function () {
          $("#s_em_code").html("");
        },
        success: function (e) {
          let t = '<option label="Select Project"></option>';
          t += '<option value="all">All Projects</option>';
          e.data.forEach((e, r) => {
            t += `<option value="${e.project_id}">${e.s_title} - ${e.s_desc}</option>`;
          }),
            $("#s_em_code").html(t);
        },
        error: function (e) {
          callAlert("error", error_handling(e));
        },
        complete: function (e) {},
      });
    } catch (e) {
      callAlert("error", error_handling(e));
    }
  };
  getallprojectlist();

  gettimesheetreport = () => {
    $("#reportrow").show();
    debugger;
    // var s_category = "#s_category".val();
    try {
      var data = {
        project_name: $("#s_em_code").val(),
        s_date: $("#start_date").val(),
        e_date: $("#end_date").val(),
      };
      $.ajax({
        type: "POST",
        url: "/ess/gettimesheetreport",
        crossDomain: !0,
        data: data,
        beforeSend: function () {
          //   $("#s_em_code").html("");
        },
        success: function (results) {
          callAlert("success", success_handling(results));

          var t = results.data;
          if ($.fn.dataTable.isDataTable("#tbl-atte-report")) {
            $("#tbl-atte-report").DataTable().destroy();
          }
          var table = $("#tbl-atte-report").DataTable({
            data: t,
            responsive: true,
            dom: "Bfrtip", // Combine the configurations
            buttons: ["csv", "excel"],
            columnDefs: [
              {
                targets: "_all",
                className: "dt-center",
                orderable: false, // Disable sorting for all columns
              },
            ],
            aoColumns: [
              { data: "s_project" },
              { data: "s_title" },
              { data: "s_month" },
              { data: "s_date" },
              { data: "s_em_code" },
              { data: "emp_name" },
              { data: "s_hours" },
              { data: "s_save_status" },
              { data: "s_name" },
            ],
            // initComplete: function () {
            //   var table = this;
            //   table
            //     .api()
            //     .columns([2, 3, 4, 5, 6, 7, 8])
            //     .every(function () {
            //       var column = this;
            //       var columnIndex = column.index();
            //       var select = $(
            //         '<select><option value="Clear">Clear</option></select>'
            //       )
            //         .appendTo($(column.header()).empty())
            //         .on("change", function () {
            //           var val = $(this).val();
            //           if (val === "Clear") {
            //             column.search("").draw();
            //           } else {
            //             var regex =
            //               "^" + $.fn.dataTable.util.escapeRegex(val) + "$";
            //             column.search(regex, true, false).draw();
            //           }
            //         });

            //       column
            //         .data()
            //         .unique()
            //         .sort()
            //         .each(function (d, j) {
            //           select.append(
            //             '<option value="' + d + '">' + d + "</option>"
            //           );
            //         });

            //       if (columnIndex === 2) {
            //         $('<span style="display:block;">Month</span>').appendTo(
            //           $(column.header())
            //         );
            //       } else if (columnIndex === 3) {
            //         $('<span style="display:block;">Date</span>').appendTo(
            //           $(column.header())
            //         );
            //       } else if (columnIndex === 4) {
            //         $(
            //           '<span style="display:block;">Employee Code</span>'
            //         ).appendTo($(column.header()));
            //       } else if (columnIndex === 5) {
            //         $(
            //           '<span style="display:block;">Employee Name</span>'
            //         ).appendTo($(column.header()));
            //       } else if (columnIndex === 6) {
            //         $(
            //           '<span style="display:block;">Work Hours</span>'
            //         ).appendTo($(column.header()));
            //       } else if (columnIndex === 7) {
            //         $('<span style="display:block;">Status</span>').appendTo(
            //           $(column.header())
            //         );
            //       } else if (columnIndex === 8) {
            //         $(
            //           '<span style="display:block;">Activitiy Name</span>'
            //         ).appendTo($(column.header()));
            //       }
            //     });
            // },
          });
        },

        error: function (e) {
          callAlert("error", error_handling(e));
        },
        complete: function (e) {},
      });
    } catch (e) {
      callAlert("error", error_handling(e));
    }
  };
})();
