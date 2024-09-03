(function () {
  $("#tablerow").hide();
  $("#dda_auth2").hide();

  $("#toggleTable").on("click", function () {
    $("#reportCard").toggle();
    $("#enterform").toggle();
    $("#form-plan").toggle();
    $("#s_date").val("");
    $("#e_date").val("");
    $("#dda_auth tbody").empty();
    $("#tablerow").hide();
  });

  $("#cancelBudget").on("click", function () {
    $("#reportCard").toggle();
    $("#enterform").toggle();
    $("#form-plan").toggle();
  });

  gettimesheetdetails = () => {
    var sdate = $("#start_date").val();
    var edate = $("#end_date").val();
    if (edate < sdate) {
      alert("End date must be after Start date!!!!");
      $("#start_date").val("");
      $("#end_date").val("");
    } else {
      $("#dda_auth2").show();
      debugger;
      var username = localStorage.getItem("em_code");

      var data = {
        s_created_by: username,
        sdate: sdate,
        edate: edate,
      };
      // alert(data);
      try {
        $.ajax({
          type: "POST",
          url: "/ess/gettimesheetdetails",
          data: data,
          beforeSend: function () {
            // add_loader("loader");
          },
          success: function (results) {
            callAlert("success", success_handling(results));

            var t = results.data;
            $.fn.dataTable.isDataTable("#dda_auth2") &&
              $("#dda_auth2").DataTable().destroy(),
              (table = $("#dda_auth2").DataTable({
                data: t,
                responsive: true,
                dom: "Bfrtip", // Combine the configurations
                buttons: ["csv", "excel"],
                aoColumns: [
                  {
                    render: function (e, t, a, r) {
                      if (
                        a.s_save_status === "Draft" ||
                        a.s_save_status === "Rejected"
                      ) {
                        return `
                          <a onclick="submitdraftdata(${a.id});" class="btn btn-sm btn-warning" style="padding: 2px 6px; margin-right: 3px; font-size: 12px;" title="Submit">
                            <i class="fas fa-save"></i>
                          </a> 
                          | 
                          <a onclick="getDeptById(${a.n_dep_id});" class="btn btn-sm btn-info" style="padding: 2px 6px; margin-right: 3px; font-size: 12px;" title="Edit">
                            <i class="fas fa-pen"></i>
                          </a> 
                          | 
                          <a onclick="deleteDeptById(${a.n_dep_id});" class="btn btn-sm btn-danger" title="Delete" style="padding: 2px 6px; font-size: 12px;">
                            <i class="fas fa-trash"></i>
                          </a>`;
                      } else if (a.s_save_status === "Approved") {
                        return '<text style="color: green;"><b>Got Approve</b></text>';
                      } else if (a.s_save_status === "Pending") {
                        return '<text style="color: #ce630c;"><b>Under Review</b></text>';
                      }
                    },
                  },
                  { data: "id" },
                  { data: "s_save_status" },
                  { data: "s_title" },
                  { data: "p_desc" },
                  { data: "s_name" },
                  { data: "s_task_name" },
                  { data: "s_hours" },

                  { data: "s_desc" },
                  { data: "s_date" },
                ],
              }));
            $("#dda_auth2").css({
              "table-layout": "fixed",
              width: "98% !important",
            });
          },
          error: function (results) {
            callAlert("error", error_handling(results));
          },
          complete: function () {
            remove_loader("loader");
          },
        });
      } catch (results) {
        remove_loader("loader");
      }
    }
  };

  // gettimesheetdetails();
  submitdraftdata = (timeid) => {
    debugger;
    if (confirm("Do you really want to submit data")) {
      try {
        var data = {
          id: timeid,
        };
        $.ajax({
          type: "POST",
          url: "/ess/submitdraftdata",
          contentType: "application/json",
          data: JSON.stringify(data),
          crossDomain: true,
          beforeSend: function () {
            // add_loader("loader");
          },
          success: function (results) {
            callAlert("success", success_handling(results));
            const table = $("#dda_auth2").DataTable();
            const rowIndex = table
              .rows((idx, data, node) => data.id === timeid)
              .indexes();

            if (rowIndex.length > 0) {
              // Update the status in the DataTable
              table.cell(rowIndex, 2).data("Pending").draw(false);

              // Optionally, update the action buttons for the row if needed
              const actionButtons = `
                <text style="color: #ce630c;"><b>Under Review</b></text>
              `;
              table.cell(rowIndex, 0).data(actionButtons).draw(false);
            }
          },
          complete: function () {
            // remove_loader('loader');
          },
        });
      } catch (err) {
        // remove_loader('loader');
      }
    } else {
      gettimesheetdetails();
    }
  };

  let allRows = []; // Array to store all rows
  let currentPage = 1;
  const rowsPerPage = 5;

  generateTableRows = () => {
    const startDate = new Date(document.querySelector("#s_date").value);
    const endDate = new Date(document.querySelector("#e_date").value);

    if (endDate < startDate) {
      alert("End date must be after Start date!!!!");
      return;
    }

    document.querySelector("#tablerow").style.display = "table-row";
    allRows = [];
    let currentDate = new Date(startDate);

    const tableBody = document.querySelector("#dda_auth tbody");
    tableBody.innerHTML = ""; // Clear existing rows

    while (currentDate <= endDate) {
      const row = document.createElement("tr");

      // Date cell
      const dateCell = document.createElement("td");
      dateCell.innerText = currentDate.toISOString().split("T")[0];
      row.appendChild(dateCell);

      // Project cell
      const projectCell = document.createElement("td");
      const projectSelect = document.createElement("select");
      projectSelect.className = "form-control project_dd";
      projectSelect.onchange = function () {
        getprojectactivity(this, row); // Pass the row to getprojectactivity
      };
      projectSelect.innerHTML = '<option value="">Select Project</option>';
      projectCell.appendChild(projectSelect);
      row.appendChild(projectCell);

      // Activity cell
      const activityCell = document.createElement("td");
      activityCell.className = "activity_cell";
      row.appendChild(activityCell);

      // Hours cell
      const hoursCell = document.createElement("td");
      hoursCell.className = "hours_cell";
      row.appendChild(hoursCell);

      // Description cell
      const descriptionCell = document.createElement("td");
      descriptionCell.className = "description_cell";
      row.appendChild(descriptionCell);

      // "+" button for non-Sundays
      if (currentDate.getDay() !== 0) {
        const actionCell = document.createElement("td");
        const addButton = document.createElement("button");
        addButton.innerText = "+";
        addButton.className = "btn btn-primary btn-sm";
        addButton.onclick = function () {
          addRowForDate(dateCell.innerText);
        };
        actionCell.appendChild(addButton);
        row.appendChild(actionCell);
      }

      // Highlight Sundays
      if (currentDate.getDay() === 0) {
        dateCell.style.color = "red";
        dateCell.innerHTML += "<br><b>(Sunday)</b>";
        projectSelect.disabled = true;
        activityCell.disabled = true;
        projectCell.style.backgroundColor = "#ffe6e6";
        activityCell.style.backgroundColor = "#ffe6e6";
        hoursCell.style.backgroundColor = "#ffe6e6";
        descriptionCell.style.backgroundColor = "#ffe6e6";
      }

      allRows.push(row);
      tableBody.appendChild(row);

      currentDate.setDate(currentDate.getDate() + 1);
    }

    displayRows(); // Display rows and update pagination controls after generation
  };

  addRowForDate = (date) => {
    debugger;
    const tableBody = document.querySelector("#dda_auth tbody");
    const existingRow = Array.from(tableBody.querySelectorAll("tr")).find(
      (row) => row.querySelector("td").innerText === date
    );

    if (existingRow) {
      const newRow = existingRow.cloneNode(true);
      const cells = newRow.querySelectorAll("td");
      cells.forEach((cell) => {
        const input = cell.querySelector("input, textarea, select");
        if (input) {
          input.value = ""; // Clear the input values in the new row
          input.disabled = false; // Enable the inputs in the new row
        }
      });

      // Remove the "+" button from the new row
      const actionCell = newRow.querySelector("td:last-child");
      actionCell.innerHTML = ""; // Remove existing content
      const removeButton = document.createElement("button");
      removeButton.innerText = "X";
      removeButton.className = "btn btn-danger btn-sm";
      removeButton.onclick = function () {
        removeRow(newRow);
      };
      actionCell.appendChild(removeButton);

      // Add the new row to the table
      existingRow.parentNode.insertBefore(newRow, existingRow.nextSibling);
    }
  };

  const removeRow = (row) => {
    const tableBody = document.querySelector("#dda_auth tbody");
    tableBody.removeChild(row);
  };

  // Function to update pagination controls
  updatePagination = () => {
    const totalPages = Math.ceil(allRows.length / rowsPerPage);
    const paginationContainer = document.getElementById("pagination");

    paginationContainer.innerHTML = ""; // Clear previous controls

    // Previous button
    const prevButton = document.createElement("button");
    prevButton.innerText = "Previous";
    prevButton.disabled = currentPage === 1;
    prevButton.onclick = () => {
      currentPage--;
      displayRows();
    };
    paginationContainer.appendChild(prevButton);

    // Page numbers
    for (let i = 1; i <= totalPages; i++) {
      const pageButton = document.createElement("button");
      pageButton.innerText = i;
      pageButton.className = currentPage === i ? "active" : "";
      pageButton.onclick = () => {
        currentPage = i;
        displayRows();
      };
      paginationContainer.appendChild(pageButton);
    }

    // Next button
    const nextButton = document.createElement("button");
    nextButton.innerText = "Next";
    nextButton.disabled = currentPage === totalPages;
    nextButton.onclick = () => {
      currentPage++;
      displayRows();
    };
    paginationContainer.appendChild(nextButton);
  };

  displayRows = () => {
    const tableBody = document.querySelector("#dda_auth tbody");
    tableBody.innerHTML = "";

    // Calculate the starting and ending index
    const start = (currentPage - 1) * rowsPerPage;
    const end = start + rowsPerPage;

    // Append the rows for the current page
    allRows.slice(start, end).forEach((row) => tableBody.appendChild(row));

    // Update pagination controls
    getallprojectlist();
    updatePagination();
  };

  getallprojectlist = () => {
    debugger;
    try {
      $.ajax({
        type: "POST",
        url: "/ess/getallprojectlist",
        contentType: "application/json",
        crossDomain: true,
        beforeSend: function () {
          // add_loader("loader");
        },
        success: function (results) {
          console.log(results);
          if (results.data) {
            var html = "";
            var data = results.data;
            var option = `<option value="">Select Project</option>`;
            data.forEach((element) => {
              option += `<option value="${element.project_id}">${element.s_title} - ${element.s_desc}</option>`;
            });
            $(".project_dd").html(option);
          } else {
          }
        },
        complete: function () {
          // remove_loader('loader');
        },
      });
    } catch (err) {
      // remove_loader('loader');
    }
  };

  getprojectactivity = (selectedproject, row) => {
    const proj_id = selectedproject.value;
    const data = { proj_id: proj_id };

    try {
      $.ajax({
        type: "POST",
        url: "/ess/getprojectactivity",
        data: JSON.stringify(data),
        contentType: "application/json",
        crossDomain: true,
        success: function (results) {
          if (results.data) {
            const activities = results.data;

            // Clear existing inputs in the row
            const activityCell = row.querySelector(".activity_cell");
            const hoursCell = row.querySelector(".hours_cell");
            const descriptionCell = row.querySelector(".description_cell");

            activityCell.innerHTML = "";
            hoursCell.innerHTML = "";
            descriptionCell.innerHTML = "";

            // Create inputs for each activity
            activities.forEach((activity, index) => {
              // Activity input
              const activityInput = document.createElement("input");
              activityInput.type = "text";
              activityInput.className = "form-control";
              activityInput.placeholder = `Activity ${index + 1}`;
              activityInput.value = activity.s_name; // Pre-fill with activity name
              activityInput.disabled = true;
              activityCell.appendChild(activityInput);

              // Hours input
              const hoursInput = document.createElement("input");
              hoursInput.type = "number";
              hoursInput.className = "form-control";
              hoursInput.placeholder = "Hours";
              hoursCell.appendChild(hoursInput);

              // Description input
              const descriptionInput = document.createElement("textarea");
              descriptionInput.className = "form-control";
              descriptionInput.placeholder = "Description";
              descriptionCell.appendChild(descriptionInput);
            });
          }
        },
      });
    } catch (err) {
      console.error("Error fetching project activities", err);
    }
  };

  gettaskactivity = (selectedact, row) => {
    debugger;
    var act_id = selectedact.options[selectedact.selectedIndex].value;
    var data = {
      act_id: act_id,
    };
    debugger;
    try {
      $.ajax({
        type: "POST",
        url: "/ess/gettaskactivity",
        data: JSON.stringify(data),
        contentType: "application/json",
        crossDomain: true,
        beforeSend: function () {
          // add_loader("loader");
        },
        success: function (results) {
          console.log(results);
          // const taskCell = row.querySelector(".task_cell");
          const hoursCell = row.querySelector(".hours_cell");
          const descriptionCell = row.querySelector(".description_cell");

          if (results.data) {
            taskCell.innerHTML = "";
            hoursCell.innerHTML = "";
            descriptionCell.innerHTML = "";

            results.data.forEach((element, index) => {
              // Create and append Task input
              // const taskInput = document.createElement("textarea");
              // // taskInput.type = "text";
              // taskInput.className = "form-control";
              // taskInput.placeholder = "Task";
              // taskInput.value = element.s_task;
              // taskInput.disabled = true;
              // taskCell.appendChild(taskInput);

              // Create and append Hours input
              const hoursInput = document.createElement("input");
              hoursInput.type = "number";
              hoursInput.className = "form-control";
              hoursInput.placeholder = "Hours";
              hoursCell.appendChild(hoursInput);
              hoursInput.onchange = function () {
                checkworkhours(this);
              };

              // Create and append Description textarea
              const descriptionTextarea = document.createElement("textarea");
              descriptionTextarea.className = "form-control";
              descriptionTextarea.placeholder = "Description";
              descriptionCell.appendChild(descriptionTextarea);
            });
          }
        },
        complete: function () {
          // remove_loader('loader');
        },
      });
    } catch (err) {
      // remove_loader('loader');
    }
  };
  // Function to check work hours
  checkworkhours = (inputElement) => {
    debugger;
    const hours = parseInt(inputElement.value, 10); // Parse the input value as an integer
    const hoursCell = inputElement.parentElement; // Get the parent element of the input (the td element)

    // Clear any existing messages
    const existingMessage = hoursCell.querySelector(".hours-message");
    if (existingMessage) {
      existingMessage.remove();
    }

    // Add the message if hours >= 9
    if (hours >= 9) {
      hoursCell.style.color = "red";
      const messageElement = document.createElement("div");
      messageElement.className = "hours-message";
      messageElement.innerHTML = "<h6>Work Time Exceeded</h6>";
      hoursCell.appendChild(messageElement);
    } else {
      hoursCell.style.color = ""; // Reset the color if less than 9
    }
  };

  savetimesheetdetails = (status, no) => {
    debugger;
    const allRows = document.querySelectorAll("#dda_auth tbody tr"); // Replace with your table's ID
    const dataToSave = [];
    allRows.forEach((row) => {
      const date = row.querySelector("td:nth-child(1)").innerText;
      const project = row.querySelector(".project_dd").value;
      const activitys = row.querySelector(".activity_cell").value;
      // const savestatus = $("#saveBudget").val();

      // const taskInputs = row.querySelectorAll(".task_cell textarea");
      const hoursInputs = row.querySelectorAll(".hours_cell input");
      const descriptionInputs = row.querySelectorAll(
        ".description_cell textarea"
      );

      const s_created_by = localStorage.getItem("em_code");
      // const s_start_date = new Date($("#s_date").val());
      // const s_end_date = new Date($("#e_date").val());

      const tasks = [];

      // Iterate over each task, hours, and description input
      activitys.forEach((activityinput, index) => {
        tasks.push({
          activity: activityinput.value,
          hours: hoursInputs[index].value,
          description: descriptionInputs[index].value,
          s_created_by: s_created_by,
        });
      });

      dataToSave.push({
        date: date,
        project: project,
        activity: activitys,
        savestatus: status,
        status: no,
        // s_start_date: s_start_date,
        // s_end_date: s_end_date,
        // tasks: tasks,
      });
    });

    console.log(dataToSave);

    try {
      $.ajax({
        type: "POST",
        url: "/ess/savetimedetails",
        data: JSON.stringify(dataToSave),
        contentType: "application/json",
        crossDomain: true,
        beforeSend: function () {
          // add_loader("loader");
        },
        success: function (results) {
          callAlert("success", success_handling(results));
          $("#reportCard").toggle();
          $("#enterform").toggle();
          $("#form-plan").toggle();
        },
        complete: function () {
          // remove_loader('loader');
        },
      });
    } catch (err) {
      // remove_loader('loader');
    }
  };
})();
