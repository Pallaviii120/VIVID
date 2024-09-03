(function () {
  // $("#add_task").click(function () {
  //   $("#addModal").modal("show");
  // });

  $("#newact").click(function () {
    $("#addModal").modal("show");
    $("#addModal3").modal("hide");
  });

  $("#get_edit").click(function () {
    $("#s_task_name").val("");
    $("#s_task_desc").val("");
    $("#basic-datatables tbody").empty();
    $("#project_sch").val("");
    $("#d_start_date").val("");
    $("#d_end_date").val("");
  });

  $(document).ready(function () {
    let rowCount = 0;

    $("#addRowBtn").click(function () {
      // Get the number of rows to be added from the user input
      let rowsToAdd = parseInt($("#no_task").val());
      for (let i = 0; i < rowsToAdd; i++) {
        rowCount++;
        let newRow = `
                <tr>
                    <td>${rowCount}</td>
                    <td><input type="text" class="form-control form-control-sm" name="task_name[]" id="task_${rowCount}" placeholder="Task"></td>
                   
                    <td>
                        <button type="button" class="btn btn-sm btn-danger removeRowBtn"> x </button>
                    </td>
                </tr>`;
        $("#basic-datatables2 tbody").append(newRow);
      }
    });

    // Remove row on click of "-" button
    $(document).on("click", ".removeRowBtn", function () {
      $(this).closest("tr").remove();
      rowCount--;
      updateRowNumbers();
    });

    // Update row numbers after removing a row
    function updateRowNumbers() {
      $("#basic-datatables2 tbody tr").each(function (index) {
        $(this)
          .find("td:first")
          .text(index + 1);
      });
    }
  });

  $("#add_task").click(function () {
    $("#s_act_name").val("");
    $("#no_task").val("");
    // $("#s_act_desc").val("");
    $("#basic-datatables2 tbody").empty();
  });

  // getactivitytask();

  gettaskbyactid = (id) => {
    var data = {
      actid: id,
    };
    try {
      $.ajax({
        type: "POST",
        url: "/ess/gettaskbyactid",
        data: data,
        beforeSend: function () {
          add_loader("loader");
        },
        success: function (results) {
          debugger;
          showdata = results.data;
          $("#addModal2").modal("show");
          $("#s_act_name2").val(showdata[0].s_name);
          $("#s_act_desc2").val(showdata[0].s_desc);

          const tableBody = document.querySelector("#basic-datatables3 tbody");
          tableBody.innerHTML = ""; // Clear existing rows

          showdata.forEach((record, index) => {
            const row = document.createElement("tr");
            row.innerHTML = `
                  <td>${index + 1}</td>
                  <td>${record.s_task}</td>
                  <td>
                      <a onclick="getDeptById();" class="btn btn-sm btn-success"><i class="fas fa-edit"></i></a> |
                       <a onclick="deleteDeptById();" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>

                  </td>
              `;
            tableBody.appendChild(row);
          });

          // showdatabyid(results.data[0])
          // console.log(results.data);
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
  };
  $("#add_task").click(function () {
    debugger;
    var data = {
      s_proj_title: $("#s_task_name").val(),
      s_proj_desc: $("#s_task_desc").val(),
      s_rule: $("#project_sch").val(),
      s_startdate: $("#d_start_date").val(),
      s_enddate: $("#d_end_date").val(),
    };

    // Check if the project fields are filled
    if (
      data.s_proj_title !== "" &&
      data.s_proj_desc !== "" &&
      data.s_rule !== "" &&
      data.s_startdate !== "" &&
      data.s_enddate !== ""
    ) {
      $("#addModal").modal("show");
    } else {
      alert("Enter and Save Project Details First!!!!!");
      window.location.reload();
    }
  });
  var globalprojectid;
  saveprojectdetails = () => {
    debugger;

    var data = {
      s_proj_title: $("#s_task_name").val(),
      s_proj_desc: $("#s_task_desc").val(),
      s_rule: $("#project_sch").val(),
      s_startdate: $("#d_start_date").val(),
      s_enddate: $("#d_end_date").val(),
      s_created_by: localStorage.getItem("em_code"),
    };

    try {
      $.ajax({
        type: "POST",
        url: "/ess/saveprojectdetails",
        data: data,
        beforeSend: function () {},
        success: function (results) {
          globalprojectid = results.data.insertId;

          callAlert("success", success_handling(results));
        },
      });
    } catch (err) {
      $("#loader").removeClass("is-active");
      console.log(err);
      alert("Data not Saved!! something is wrong");
    }
  };

  getactivitytask = () => {
    debugger;
    var data = {
      s_created_by: localStorage.getItem("em_code"),
      projectid: globalprojectid,
    };
    try {
      $.ajax({
        type: "POST",
        url: "/ess/getactivitytask",
        data: data,
        beforeSend: function () {
          add_loader("loader");
        },
        success: function (results) {
          $.fn.dataTable.isDataTable("#basic-datatables") &&
            $("#basic-datatables").DataTable().destroy(),
            (table = $("#basic-datatables").DataTable({
              data: results.data,
              responsive: true,
              scrollX: true,
              autoWidth: false,
              aoColumns: [
                { data: "activity_id" },
                { data: "s_name" },
                // { data: "s_desc" },
                { data: "task_count" },
                {
                  render: function (e, t, a, r) {
                    return `<a onclick="gettaskbyactid(${a.activity_id});" class="btn btn-sm btn-warning"><i class="fas fa-eye"></i></a>`;
                  },
                },
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
  };

  $("#saveactivity").click(function () {
    saveactivityandtask();
  });
  saveactivityandtask = () => {
    debugger;
    let tasks = [];
    let activityid = "";
    $("#basic-datatables2 tbody tr").each(function (index) {
      let task = {
        task_name: $(this).find('input[name="task_name[]"]').val(),
        // task_desc: $(this).find('input[name="task_desc[]"]').val(),
        // start_date: $(this).find('input[name="start_date[]"]').val(),
        // end_date: $(this).find('input[name="end_date[]"]').val(),
      };
      tasks.push(task);
    });

    var data = {
      s_act_name: $("#s_act_name").val(),
      s_project_id: globalprojectid,
      s_created_by: localStorage.getItem("em_code"),
    };

    try {
      $.ajax({
        type: "POST",
        url: "/ess/saveactivitytask",
        data: data,
        beforeSend: function () {},
        success: function (results) {
          if (results) {
            activityid = results.data.insertId;
            globalactivityid = activityid;

            // second ajax
            var data2 = {
              tasks: tasks,
              activityid: activityid,
              s_created_by: localStorage.getItem("em_code"),
            };
            try {
              $.ajax({
                type: "POST",
                url: "/ess/savetasks",
                data: data2,
                beforeSend: function () {},
                success: function (results) {
                  if (results) {
                    alert("Activity & Task Saved Successfully");
                    $("#addModal").modal("hide");
                    getactivitytask();
                  }
                },
              });
            } catch (err) {
              $("#loader").removeClass("is-active");
              console.log(err);
              alert("Data not Saved!! something is wrong");
            }
          }
        },
      });
    } catch (err) {
      $("#loader").removeClass("is-active");
      console.log(err);
      alert("Data not Saved!! something is wrong");
    }
  };

  getprojectdetails = () => {
    var data = {
      s_created_by: localStorage.getItem("em_code"),
    };
    try {
      $.ajax({
        type: "POST",
        url: "/ess/getprojectdetails",
        data: data,
        beforeSend: function () {
          add_loader("loader");
        },
        success: function (results) {
          $.fn.dataTable.isDataTable("#projectdetailstable") &&
            $("#projectdetailstable").DataTable().destroy(),
            (table = $("#projectdetailstable").DataTable({
              data: results.data,
              scrollX: !0,
              aoColumns: [
                { data: "s_title" },
                { data: "s_desc" },
                { data: "s_start_date" },
                { data: "s_end_date" },
                { data: "s_rule" },
                { data: "task_count" },
                {
                  render: function (e, t, a, r) {
                    return `<a onclick="getactivitylist(${a.project_id});" class="btn btn-sm btn-warning"><i class="fas fa-eye"></i></a>`;
                  },
                },
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
  };
  // getactivitytask();
  getprojectdetails();

  getactivitylist = (id) => {
    $("#addModal3").modal("show");
    var data = {
      activityid: id,
    };
    try {
      $.ajax({
        type: "POST",
        url: "/ess/getactivitylist",
        data: data,
        beforeSend: function () {
          add_loader("loader");
        },
        success: function (results) {
          $.fn.dataTable.isDataTable("#basic-datatables4") &&
            $("#basic-datatables4").DataTable().destroy(),
            (table = $("#basic-datatables4").DataTable({
              data: results.data,
              responsive: true,
              scrollX: true,
              autoWidth: false,
              aoColumns: [
                { data: "activity_id" },
                { data: "s_name" },
                { data: "task_count" },
                {
                  render: function (e, t, a, r) {
                    return `<a onclick="gettaskbyactid(${a.activity_id});" class="btn btn-sm btn-warning"><i class="fas fa-eye"></i></a> | 
                             <a onclick="deleteDeptById(${a.n_dep_id});" class="btn btn-sm btn-danger" title="Delete" style="padding: 2px 6px; font-size: 12px;">
                            <i class="fas fa-trash"></i></a>`;
                  },
                },
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
  };
})();
