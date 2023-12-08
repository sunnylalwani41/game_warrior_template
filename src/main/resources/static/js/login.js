var sub, user, pass, mainContent, loggedIn;
var loggedIn = document.querySelector('.logged-in')

let form = document.querySelector(".registration");
let firstName= document.querySelector(".firstName");
let lastName= document.querySelector(".lastName");
let email = document.querySelector(".email");
let password = document.querySelector(".password");
let redirect=(data)=>{
  $.ajax({
     url:"/sendAuthentication",
     data:data,
     contentType:"application/json",
     type:"post",
     dataType:"json",
     success:function(response){
       console.log(response);
       Swal.fire({ title: "Good job!", text: "OTP has been sent to email "+email, icon: "success"});
       window.location.href="./otp.html"
     },
     error:function(error){
       console.log(error);
       Swal.fire({ title: "Bad job!", text: "Something went wrong", icon: "error"});
     }
   });
}

form.addEventListener("submit", (event)=>{
  event.preventDefault();
  firstName= firstName.value;
  lastName= lastName.value;
  email=email.value;
  password= password.value;

  const data = {
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password
  };
  const jsonData = JSON.stringify(data);
  console.log(jsonData);
   redirect(jsonData);
});



function _(x) {
  return document.getElementById(x);
}

// sub = _('submit');
user = _('user-name');
pass = _('user-pass');
mainContent = _('main');
loggedIn = _('logged-in');

sub.addEventListener('click', login);

function login(event) {
  event.preventDefault();
  var userValue = user.value;
  var passValue = pass.value;
  
  if (userValue.length >= 3 && passValue.length >= 3) {_
      mainContent.classList.add('login-true');
      loggedIn.style.display = 'block';
      loggedIn.innerHTML = '<h2>Welcome, ' + userValue + '</h2>';
   } else {
     alert('Username and Password must contain at least 3 characters.')
   }
}

