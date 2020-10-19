// service worker
if ("serviceWorker" in navigator) {
  window.addEventListener("load", function () {
    navigator.serviceWorker.register("service-worker.js");
  });
}

var api = "http://localhost:8888/swimschool/api/api.php";

// address finder api start
(function () {
  var widget,
    initAddressFinder = function () {
      widget = new AddressFinder.Widget(
        document.getElementById("addrs_1"),
        "QD98EA7GCN4P6RLYVUJH",
        "AU",
        {
          address_params: {
            gnaf: "1",
          },
        }
      );
      widget.on("result:select", function (fullAddress, metaData) {
        var combinedAddressLine1And2 = !metaData.address_line_2
          ? metaData.address_line_1
          : metaData.address_line_1 + ", " + metaData.address_line_2;

        // You will need to update these ids to match those in your form
        document.getElementById("addrs_1").value = combinedAddressLine1And2;
        document.getElementById("suburb").value = metaData.locality_name;
        document.getElementById("state").value = metaData.state_territory;
        document.getElementById("postcode").value = metaData.postcode;
      });
    };

  function downloadAddressFinder() {
    var script = document.createElement("script");
    script.src = "https://api.addressfinder.io/assets/v3/widget.js";
    script.async = true;
    script.onload = initAddressFinder;
    document.body.appendChild(script);
  }

  document.addEventListener("DOMContentLoaded", downloadAddressFinder);
})();
// address finder api end

window.onload = function () {
  // clear service - worker cache
  caches.keys().then(function (names) {
    for (let name of names) caches.delete(name);
  });

  // get last viewed page
  var lastViewedPage = localStorage.getItem("lastViewedPage");
  if (lastViewedPage) {
    $(".display").hide();
    var page = document.getElementById(lastViewedPage);
    page.style.display = "block";
  } else {
    // show home page
    fho();
  }

  var logoutshow = $("#logout");
  logoutshow.hide();
  var enrollshow = $("#enroll");
  enrollshow.hide();
  var myclassshow = $("#myclass");
  myclassshow.hide();
  var settingshow = $("#setting");
  settingshow.hide();

  var theme = localStorage.getItem("background colour");
  if (theme === "dark") {
    document.body.style.backgroundColor = "rgba(50,50,50)";
    document.body.style.color = "grey";
  } else {
    document.body.style.backgroundColor = "lightblue";
    document.body.style.color = "black";
  }
};

function fre() {
  var show = $(".display");
  show.hide();
  registerpage.style.display = "block";
  localStorage.setItem("lastViewedPage", "registerpage");
}

function flogin() {
  var show = $(".display");
  show.hide();
  loginpage.style.display = "block";
  localStorage.setItem("lastViewedPage", "loginpage");
}

function fho() {
  var show = $(".display");
  show.hide();
  homepage.style.display = "block";
  localStorage.setItem("lastViewedPage", "homepage");
}

function fpr() {
  var show = $(".display");
  show.hide();
  programpage.style.display = "block";
  getAllPrograms();
  localStorage.setItem("lastViewedPage", "programpage");
}

function fcl() {
  var show = $(".display");
  show.hide();
  classpage.style.display = "block";
  localStorage.setItem("lastViewedPage", "classpage");
}

function fen() {
  var show = $(".display");
  show.hide();
  enrollpage.style.display = "block";
  localStorage.setItem("lastViewedPage", "enrollpage");
}

function fmy() {
  var show = $(".display");
  show.hide();
  myclasspage.style.display = "block";
  getMyClass();
  localStorage.setItem("lastViewedPage", "myclasspage");
}

function fse() {
  var show = $(".display");
  show.hide();
  settingpage.style.display = "block";
  localStorage.setItem("lastViewedPage", "settingpage");
}

function revealPasswords() {
  var psw1 = document.getElementById("psw1a");
  var psw2 = document.getElementById("psw2a");
  if (psw1.getAttribute("type") === "text") {
    psw1.setAttribute("type", "password");
    psw2.setAttribute("type", "password");
  } else {
    psw1.setAttribute("type", "text");
    psw2.setAttribute("type", "text");
  }
}

function passEquality() {
  var psw1 = document.getElementById("psw1a");
  var psw2 = document.getElementById("psw2a");
  if (psw1.value.length > 0 && psw2.value.length > 0) {
    if (psw1.value === psw2.value) {
      psw1.setCustomValidity("");
      psw2.setCustomValidity("");
      console.log("2 passwords identical");
      return true;
    } else {
      psw1.setCustomValidity("2 passwords don't match");
      psw2.setCustomValidity("2 passwords don't match");
      console.log("2 passwords different");
      return false;
    }
  } else {
    return true;
  }
}

function submitLogin(event) {
  event.preventDefault();
  var validLogin = true;

  var username = document.getElementById("unb");
  if (!username.checkValidity()) {
    validLogin = false;
  }
  var password = document.getElementById("psw1b");
  if (!password.checkValidity()) {
    validLogin = false;
  }
  if (validLogin === false) {
    $("#welcomearea").show().text("please try again").delay(2000).fadeOut(2000);
  } else {
    // $("#welcomearea").show().text("Welcome Back").delay(2000).fadeOut(2000);
    const data = {
      username: username.value,
      password: password.value,
    };
    fetch(api + "?action=login", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json", //all echo statements are json_encode
      },
      body: JSON.stringify(data),
    })
      .then((res) => res.json())
      .then((res) => {
        if (res.statusCode === 401) {
          showAlert("error", "Incorrect username or password");
          localStorage.removeItem("token");
          localStorage.removeItem("userid");
          localStorage.removeItem("username");
          return;
        }
        if (res.statusCode === 200) {
          showAlert(
            "success",
            `Welcome ${res.data.username}, you have successfully logged in.`
          );
          localStorage.setItem("token", res.data.token);
          localStorage.setItem("userid", res.data.userid);
          localStorage.setItem("username", res.data.username);
          // var rm = document.getElementById("rm");
          // if (rm.checked) {
          //   localStorage.setItem("token", res.data.token);
          //   localStorage.setItem("userid", res.data.userid);
          //   localStorage.setItem("username", res.data.username);
          // }
          refreshMenu();
          fho();
        }
      })
      .catch((err) => console.log(err));
  }
}

function isLoggedin() {
  if (localStorage.getItem("token") && localStorage.getItem("userid"))
    return true;

  return false;
}

function logout() {
  var endPoint = api + "?action=logout";
  fetch(endPoint, {
    method: "GET",
    mode: "cors",
  })
    .then(function (response) {
      if (response.status !== 200) {
        console.log("Logout failed." + response);
        showAlert("error", "Logout failed.");
        return;
      }
      var show = $(".display");
      show.hide();
      homepage.style.display = "block";
      localStorage.removeItem("token");
      localStorage.removeItem("userid");
      localStorage.removeItem("username");
      localStorage.removeItem("password");
      refreshMenu();
      showAlert("success", "You have logged out");
    })
    .catch((err) => {
      console.log(err.message);
    });
}

function handleReg(event) {
  event.preventDefault(); // the default action that belongs to the event will not occur.
  var validForm = true;
  // username
  var username = document.getElementById("un");
  var errorun = document.getElementById("errorun");
  if (!username.checkValidity()) {
    errorun.style.display = "block";
    validForm = false;
  } else {
    errorun.style.display = "none";
  }
  // email
  var email = document.getElementById("em");
  var errorem = document.getElementById("errorem");
  if (!email.checkValidity()) {
    errorem.style.display = "block";
    validForm = false;
  } else {
    errorem.style.display = "none";
  }
  // Password
  var psw1 = document.getElementById("psw1a");
  var errorpsw1 = document.getElementById("errorpsw1");
  if (!psw1.checkValidity()) {
    errorpsw1.style.display = "block";
    validForm = false;
  } else {
    errorpsw1.style.display = "none";
  }
  // Password Again
  var psw2 = document.getElementById("psw2a");
  var errorpsw2 = document.getElementById("errorpsw2");
  if (!psw2.checkValidity()) {
    errorpsw2.style.display = "block";
    validForm = false;
  } else {
    errorpsw2.style.display = "none";
  }
  // check if 2 passwords are identical
  var samepsw = document.getElementById("samepsw");
  if (!passEquality()) {
    samepsw.style.display = "block";
    validForm = false;
  }

  // handle registration form submission
  if (validForm === false) {
    $("#error0").show().text("Please fix the errors").delay(2000).fadeOut(2000);
    return;
  } else {
    const data = {
      username: username.value,
      email: email.value,
      password: psw1.value,
    };

    fetch(api + "?action=signup", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json", //all echo statements are json_encode
      },
      body: JSON.stringify(data),
    })
      .then((res) => res.json())
      .then((res) => {
        showAlert("success", "You have successfully registered.");
        fho();
      });
  }
}

function validateGender() {
  var genderRadios = document.querySelectorAll('[name="group"]');
  var error = document.querySelector("#errorgender");
  var validGender = false;
  for (var i = 0; i < genderRadios.length; i++) {
    if (genderRadios[i].checked) {
      validGender = true;
    }
  }
  if (!validGender) {
    error.style.display = "block";
    error.innerHTML = "Gender is required";
    console.log("Gender missing");
    return false;
  } else {
    error.innerHTML = "";
    return true;
  }
}

var checker = document.getElementById("checkit");
var submitBtn = document.getElementById("submitme");
checker.addEventListener("change", function () {
  if (this.checked) {
    submitBtn.disabled = false;
  } else {
    submitBtn.disabled = true;
  }
});

function validateEnroll(event) {
  event.preventDefault();
  var valid = true;
  // first name
  var fn = document.getElementById("fn");
  var errorsn = document.getElementById("errorfn");
  if (!fn.checkValidity()) {
    errorsn.style.display = "block";
    valid = false;
  } else {
    errorsn.style.display = "none";
  }
  // last name
  var ln = document.getElementById("ln");
  var errorfn = document.getElementById("errorln");
  if (!ln.checkValidity()) {
    errorfn.style.display = "block";
    valid = false;
  } else {
    errorfn.style.display = "none";
  }
  // gender
  if (!validateGender()) {
    valid = false;
  }
  // Date of Birth
  var dob = document.getElementById("dob");
  var errordob = document.getElementById("errordob");
  if (!dob.checkValidity()) {
    errordob.style.display = "block";
    valid = false;
  } else {
    errordob.style.display = "none";
  }
  // Address
  var ad = document.getElementById("addrs_1");
  var errorad = document.getElementById("errorad");
  if (!ad.checkValidity()) {
    errorad.style.display = "block";
    valid = false;
  } else {
    errorad.style.display = "none";
  }
  // Phone
  var p2 = document.getElementById("p2");
  var errorp2 = document.getElementById("errorp2");
  if (!p2.checkValidity()) {
    errorp2.style.display = "block";
    valid = false;
  } else {
    errorp2.style.display = "none";
  }
  // Email
  var email2 = document.getElementById("email2");
  var erroremail2 = document.getElementById("erroremail2");
  if (!email2.checkValidity()) {
    erroremail2.style.display = "block";
    valid = false;
  } else {
    erroremail2.style.display = "none";
  }
  // Health
  var health = document.getElementById("health");
  var errorhealth = document.getElementById("errorhealth");
  if (!health.checkValidity()) {
    errorhealth.style.display = "block";
    valid = false;
  } else {
    errorhealth.style.display = "none";
  }
  // handle enroll form submission
  if (valid === false) {
    $("#bigerror")
      .show()
      .text("Please fix the errors")
      .delay(2000)
      .fadeOut(2000);
  } else {
    const data = {
      login_id: localStorage.getItem("userid"),
      class_id: document.getElementById("classId").value,
      givenname: fn.value,
      surname: ln.value,
      gender: document.querySelector('input[name="group"]:checked').value,
      address: ad.value,
      email: email2.value,
      phone: p2.value,
      dob: dob.value,
      health: health.value,
    };
    fetch(api + "?action=enroll", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${localStorage.getItem("token")}`, // only logged in users can enroll
      },
      body: JSON.stringify(data),
    })
      .then((res) => res.json())
      .then((jsonRes) => {
        if (jsonRes.success) {
          showAlert("success", `${jsonRes.messages[0]}`);
          refreshMenu();
          fho();
        } else {
          showAlert("error", `${jsonRes.messages[0]}`);
        }
      })
      .catch((err) => console.log(err));
  }
}

function switchbg(checkIT) {
  if (checkIT.checked == true) {
    document.body.style.backgroundColor = "rgba(50,50,50)";
    document.body.style.color = "grey";
    localStorage.setItem("background colour", "dark");
  } else {
    document.body.style.backgroundColor = "lightblue";
    document.body.style.color = "black";
    localStorage.setItem("background colour", "bright");
  }
}

function getAllPrograms() {
  var endPoint = api + "?action=allprograms";
  fetch(endPoint, {
    method: "GET",
    mode: "cors",
    credentials: "include",
  })
    .then(function (response) {
      if (response.status !== 200) {
        console.log("Looks like there was a problem. Status Code: " + response);
      }
      return response.json();
    })
    .then((jsonRes) => {
      var place_holder = document.getElementById("programs");
      place_holder.innerHTML = null; // reset content
      jsonRes.data.forEach((program) => {
        let card = document.createElement("div");
        card.innerHTML = `
          <div class="col s12">
            <div class="card">
              <div class="card-image">
                <img src="${program.pics}">
                <span class="card-title indigo-text text-darken-3">${program.program_name}</span>
              </div>
              <div class="card-content">
                <h6>Program Level:${program.program_level}</h6>
                <h6>Program Summary:</h6>
                <h6>${program.description}</h6>
                <h6>Time: ${program.duration}</h6>
                <h6>Price: ${program.price}</h6>
                <h6>Prerequisites:</h5>
                <h6>${program.prerequisites}</h6>
              </div>
            </div>
          </div>
        `;
        place_holder.appendChild(card);
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

function getClassesByProgram() {
  var program = document.getElementById("program_id").value;
  if (!program) return alert("Please select a program");
  var place_holder = document.getElementById("showclasses");
  place_holder.innerHTML =
    '<div class="progress"><div class="indeterminate"></div></div>';

  var endPoint = api + "?action=classesbyprogram&program_id=" + program;

  fetch(endPoint, {
    method: "GET",
    mode: "cors",
    credentials: "include",
  })
    .then(function (response) {
      if (response.status !== 200) {
        console.log(
          "Looks like there was a problem. Status Code: " + response.status
        );
        place_holder.innerHTML =
          "Failed to get classes, please try again later";
      }
      return response.json();
    })
    .then((jsonRes) => {
      if (jsonRes.Error)
        return showAlert(
          "error",
          "Rate limit exceeded, please try again later"
        );
      place_holder.innerHTML = null; // reset content
      jsonRes.data.forEach((c) => {
        let card = document.createElement("div");
        card.innerHTML = `
          <div class="col s12 m6">
            <div class="card blue-grey darken-1">
              <div class="card-content white-text">
                <span class="card-title">Class ${c.class_id}</span>
                <p>Program: ${c.program_name}</p>
                <p>Starts: ${c.start_date}</p>
                <p>Ends: ${c.end_date}</p>
                <p>Time: ${c.time}</p>
                <p>Trainer: ${c.trainer_name}</p>
                <p>Max Student Number: ${c.max_number}</p>
                <p>Current Student Number: ${c.cur_number}</p>
                <p>Description: ${c.description}</p>
              </div>
              <div class="card-action">
                <a href="#" onclick=openEnrolForm(${c.class_id})>Enroll Now</a>
              </div>
            </div>
          </div>
        `;
        place_holder.appendChild(card);
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

function getClassesByDay() {
  var day = document.getElementById("days").value;
  if (!day) return alert("Please select a day");

  var place_holder = document.getElementById("showclasses");
  place_holder.innerHTML =
    '<div class="progress"><div class="indeterminate"></div></div>';

  var endPoint = api + "?action=classesbyday&day=" + day;

  fetch(endPoint, {
    method: "GET",
    mode: "cors",
    credentials: "include",
  })
    .then(function (response) {
      if (response.status !== 200) {
        console.log(
          "Looks like there was a problem. Status Code: " + response.status
        );
        place_holder.innerHTML =
          "Failed to get classes, please try again later";
      }
      return response.json();
    })
    .then((jsonRes) => {
      if (jsonRes.Error)
        return showAlert(
          "error",
          "Rate limit exceeded, please try again later"
        );
      place_holder.innerHTML = null; // reset content
      jsonRes.data.forEach((c) => {
        let card = document.createElement("div");
        card.innerHTML = `
          <div class="col s12 m6">
            <div class="card blue-grey darken-1">
              <div class="card-content white-text">
                <span class="card-title">${c.program_name}</span>
                <p>Starts: ${c.start_date}</p>
                <p>Ends: ${c.end_date}</p>
                <p>Time: ${c.time}</p>
                <p>Trainer: ${c.trainer_name}</p>
                <p>Max Student Number: ${c.max_number}</p>
                <p>Current Student Number: ${c.cur_number}</p>
                <p>Description: ${c.description}</p>
              </div>
              <div class="card-action">
                <a href="#" onclick=openEnrolForm(${c.class_id})>Enroll Now</a>
              </div>
            </div>
          </div>
        `;
        place_holder.appendChild(card);
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

function getMyClass() {
  if (!isLoggedin()) return showAlert("error", "You are not logged in!");

  var userId = localStorage.getItem("userid");

  var place_holder = document.getElementById("showmyclass");
  place_holder.innerHTML =
    '<div class="progress"><div class="indeterminate"></div></div>';

  var endPoint = api + "?action=myenrolledclass&userid=" + userId;

  fetch(endPoint, {
    method: "GET",
    mode: "cors",
    credentials: "include",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      Authorization: `Bearer ${localStorage.getItem("token")}`, // only logged in users can see enrolled class
    },
  })
    .then(function (res) {
      if (res.status == 401) {
        return showAlert("error", "You are not logged in.");
      }
      if (res.status == 404) {
        showAlert("error", "You don't have any enrolled class");
        place_holder.innerHTML = "No class found";
        return;
      }
      if (res.status == 400) {
        return showAlert("error", "Invalid User ID");
      }
      return res.json();
    })
    .then((jsonRes) => {
      if (jsonRes.Error) return showAlert("error", "Ratelimit exceeded");
      const c = jsonRes.data;
      place_holder.innerHTML = null; // reset content
      place_holder.innerHTML = `
      <div class="col s12 m6">
        <div class="card blue-grey darken-1">
          <div class="card-content white-text">
            <span class="card-title">${c.program_name}</span>
            <p>Starts: ${c.start_date}</p>
            <p>Ends: ${c.end_date}</p>
            <p>Time: ${c.time}</p>
            <p>Trainer: ${c.trainer_name}</p>
            <p>Max Student Number: ${c.max_number}</p>
            <p>Current Student Number: ${c.cur_number}</p>
          </div>
          <div class="card-action">
            <a href="#">View</a>
          </div>
        </div>
      </div>
    `;
    })
    .catch((err) => {
      console.log(err);
    });
}

function openEnrolForm(class_id) {
  const endPoint = `${api}?action=classbyid&class_id=${class_id}`;
  fetch(endPoint, {
    method: "GET",
    mode: "cors",
    credentials: "include",
  })
    .then((res) => res.json())
    .then((jsonRes) => {
      if (jsonRes.Error)
        return showAlert(
          "error",
          "Rate limit exceeded, please try again later"
        );
      $(".display").hide();
      $("#enrollpage").show();
      // populate enrolment form
      document.querySelector("#price1").value = jsonRes.data.price;
      document.querySelector("#program1").value = jsonRes.data.program_name;
      document.querySelector("#day1").value = jsonRes.data.time;
      document.querySelector("#trainer1").value = jsonRes.data.trainer_name;
      // hidden field: class ID
      document.querySelector("#classId").value = jsonRes.data.class_id;
    })
    .catch((err) => {
      console.log(err);
    });
}

const sideBarBtn = document.querySelector(".sidenav-trigger");

if (sideBarBtn) {
  sideBarBtn.addEventListener("click", () => {
    refreshMenu();
  });
}

function hideAlert() {
  const el = document.querySelector(".alert");
  if (el) el.parentElement.removeChild(el);
}

function showAlert(type, msg) {
  hideAlert();
  const markup = `<div class="alert alert--${type}">${msg}</div>`;
  document.querySelector("body").insertAdjacentHTML("afterbegin", markup);
  window.setTimeout(function () {
    $(".alert").fadeOut(2000, function () {
      $(this).remove();
    });
  }, 3000);
}

function refreshMenu() {
  if (isLoggedin()) {
    $("#register").hide();
    $("#login").hide();
    $("#logout").show();
    $("#enroll").show();
    $("#myclass").show();
    $("#setting").show();
  } else {
    $("#logout").hide();
    $("#enroll").hide();
    $("#myclass").hide();
    $("#setting").hide();
    $("#login").show();
    $("#register").show();
  }
}

refreshMenu();
