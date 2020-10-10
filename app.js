// $("html,body").animate(
//   {
//     scrollTop: 0,
//     screenLeft: 0,
//   },
//   400
// );

var api = "http://localhost/swimschool/api/api.php";

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
  // 1. pure js method
  // var show = document.getElementsByClassName("display");
  // for (let i = 0; i < show.length; i++) {
  //   show[i].style.display = "none";
  // }
  // 2. jquery method
  var show = $(".display");
  show.hide();
  homepage.style.display = "block";

  var logoutshow = $("#logout");
  logoutshow.hide();
  var enrollshow = $("#enroll");
  enrollshow.hide();
  var myclassshow = $("#myclass");
  myclassshow.hide();
  var settingshow = $("#setting");
  settingshow.hide();

  var theme = localStorage.getItem("bg");
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
}

function flogin() {
  var show = $(".display");
  show.hide();
  loginpage.style.display = "block";
}

function fho() {
  var show = $(".display");
  show.hide();
  homepage.style.display = "block";
}

function fpr() {
  var show = $(".display");
  show.hide();
  programpage.style.display = "block";
}

function fcl() {
  var show = $(".display");
  show.hide();
  classpage.style.display = "block";
}

function fen() {
  var show = $(".display");
  show.hide();
  enrollpage.style.display = "block";
}

function fmy() {
  var show = $(".display");
  show.hide();
  myclasspage.style.display = "block";
}

function fco() {
  var show = $(".display");
  show.hide();
  contactpage.style.display = "block";
}

function fse() {
  var show = $(".display");
  show.hide();
  settingpage.style.display = "block";
}

function revealPasswords() {
  var psw1 = document.getElementById("psw1");
  var psw2 = document.getElementById("psw2");
  if (psw1.getAttribute("type") === "text") {
    psw1.setAttribute("type", "password");
    psw2.setAttribute("type", "password");
  } else {
    psw1.setAttribute("type", "text");
    psw2.setAttribute("type", "text");
  }
}

function passEquality() {
  var psw1 = document.getElementById("psw1");
  var psw2 = document.getElementById("psw2");
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
      method: "post",
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
          return;
        }
        if (res.statusCode === 200) {
          showAlert(
            "success",
            `Welcome ${res.data.username}, you have successfully logged in.`
          );
          localStorage.setItem("token", res.data.token);
          localStorage.setItem("userid", res.data.userid);
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
      refreshMenu();
      showAlert("success", "You have logged out");
    })
    .catch((err) => {
      console.log(err.message);
    });
}

// function websocket

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

  // handle form submission
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
      method: "post",
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
    var ln = document.getElementById("fn");
    var errorsn = document.getElementById("errorfn");
    if (!ln.checkValidity()) {
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
    var ad = document.getElementById("ad");
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
    // program
    var pro = document.getElementById("pro");
    var errorpro = document.getElementById("errorpro");
    if (!pro.checkValidity()) {
      errorpro.style.display = "block";
      valid = false;
    } else {
      errorpro.style.display = "none";
    }
    // class
    var cla = document.getElementById("cla");
    var errorcla = document.getElementById("errorcla");
    if (!cla.checkValidity()) {
      errorcla.style.display = "block";
      valid = false;
    } else {
      errorcla.style.display = "none";
    }
    // handle form submission
    if (valid === false) {
      $("#bigerror")
        .show()
        .text("Please fix the errors")
        .delay(2000)
        .fadeOut(2000);
    } else {
      alert("Form submitted successfully");
      // var spinner = document.getElementById("spinner");
      // spinner.style.display = "block";
      // window.setTimeout(() => {
      //   spinner.style.display = "none";
      //   alert("Form submitted successfully");
      // }, 2000);
    }
  }
}

function switchbg(checkIT) {
  if (checkIT.checked == true) {
    document.body.style.backgroundColor = "rgba(50,50,50)";
    document.body.style.color = "grey";
    localStorage.setItem("bg", "dark");
  } else {
    document.body.style.backgroundColor = "lightblue";
    document.body.style.color = "black";
    localStorage.setItem("bg", "bright");
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
    .then((jsonResponse) => {
      var place_holder = document.getElementById("programs");
      place_holder.innerHTML = null;
      jsonResponse.data.map((program) => {
        let row = document.createElement("div");
        row.innerHTML = `
          <div class="row">
            <div class="title">Program: ${program.program_name}</div>
            <div class="price">Price: ${program.price}</div>
            <div class="duration">Duration: ${program.duration}</div>
          </div>
        `;
        place_holder.appendChild(row);
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

getAllPrograms();

function getAllClasses() {
  var day = document.getElementById("days").value;
  var place_holder = document.getElementById("showclasses");
  place_holder.innerHTML = "Loading...";

  if (!day) return alert("Please select a day");

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
    .then((jsonResponse) => {
      place_holder.innerHTML = null; // reset content
      jsonResponse.data.forEach((c) => {
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
                <p>Max Students: ${c.max_number}</p>
                <p>Description: ${c.description}</p>
              </div>
              <div class="card-action">
                <a href="#">Book</a>
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

refreshMenu();
