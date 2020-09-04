
window.onload = function () {
  // pure js method
  // var show = document.getElementsByClassName("display");
  // for (let i = 0; i < show.length; i++) {
  //   show[i].style.display = "none";
  // }
  // jquery method
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
    document.body.style.color = 'grey';
  } else {
    document.body.style.backgroundColor = 'lightblue';
    document.body.style.color = 'black';
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

  var registershow = $("#register");
  registershow.hide();
  var loginshow = $("#login");
  loginshow.hide();
  var logoutshow = $("#logout");
  logoutshow.show();
  var enrollshow = $("#enroll");
  enrollshow.show();
  var myclassshow = $("#myclass");
  myclassshow.show();
  var settingshow = $("#setting");
  settingshow.show();
}

function flogout() {
  var show = $(".display");
  show.hide();
  loginpage.style.display = "block";

  var logoutshow = $("#logout");
  logoutshow.hide();
  var enrollshow = $("#enroll");
  enrollshow.hide();
  var myclassshow = $("#myclass");
  myclassshow.hide();
  var settingshow = $("#setting");
  settingshow.hide();
  var loginshow = $("#login");
  loginshow.show();
  var registershow = $("#register");
  registershow.show();
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

  var unb = document.getElementById("unb");
  if (!unb.checkValidity()) {
    validLogin = false;
  }
  var psw1b = document.getElementById("unb");
  if (!psw1b.checkValidity()) {
    validLogin = false;
  }
  if (validLogin === false) {
    $("#welcomearea").show().text("please try again").delay(2000).fadeOut(2000);
  } else {
    $("#welcomearea").show().text("Welcome Back").delay(2000).fadeOut(2000);
  }
}


function validateReg(event) {
  event.preventDefault();
  var validForm = true;
  // username
  var un = document.getElementById("un");
  var errorun = document.getElementById("errorun");
  if (!un.checkValidity()) {
    errorun.style.display = "block";
    validForm = false;
  } else {
    errorun.style.display = "none";
  }
  // email
  var em = document.getElementById("em");
  var errorem = document.getElementById("errorem");
  if (!em.checkValidity()) {
    errorem.style.display = "block";
    validForm = false;
  } else {
    errorem.style.display = "none";
  }
  // Password
  var psw1 = document.getElementById("psw1");
  var errorpsw1 = document.getElementById("errorpsw1");
  if (!psw1.checkValidity()) {
    errorpsw1.style.display = "block";
    validForm = false;
  } else {
    errorpsw1.style.display = "none";
  }
  // Password Again
  var psw2 = document.getElementById("psw2");
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
  }
  else {
    alert("Form submitted successfully");
    window.location = "index.html";
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
    $("#bigerror").show().text("Please fix the errors").delay(2000).fadeOut(2000);

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

function switchbg(checkIT) {
  if (checkIT.checked == true) {
    document.body.style.backgroundColor = "rgba(50,50,50)";
    document.body.style.color = 'grey';
    localStorage.setItem('bg', 'dark');
  } else {
    document.body.style.backgroundColor = "lightblue";
    document.body.style.color = 'black';
    localStorage.setItem('bg', 'bright');
  }
}


var api = "http://localhost:8888/swimschool/api/api.php"

function getAllPrograms() {
  var endPoint = api + "?action=allprograms";
  fetch(endPoint, {
    method: "GET",
    mode: "cors",
    credentials: "include",
  })
    .then(function (response) {
      if (response.status !== 200) {
        console.log("Looks like there was a problem. Status Code: " + response.status);
      }
      return response.json();
    })
    .then((programs) => {
      console.log(programs);
      const place_holder = document.getElementById("programs");
      programs.map((program) => {
        let row = document.createElement("div");
        row.innerHTML = `<div class="row"><div class="title">Program: ${program.program_name}</div> <div class="price">Price: ${program.price}</div> <div class="duration">Duration: ${program.duration}</div></div>`;
        place_holder.appendChild(row);
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

getAllPrograms();