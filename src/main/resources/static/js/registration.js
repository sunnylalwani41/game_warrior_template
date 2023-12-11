var sub, user, pass, mainContent, loggedIn;
// var loggedIn = document.querySelector('.logged-in')

const formRegistration = document.querySelector(".registration");
let firstName= document.querySelector(".firstName");
let lastName= document.querySelector(".lastName");
let email = document.querySelector(".email");
let password = document.querySelector(".password");

const redirect=(data, url, message)=>{
  $.ajax({
     url:url,
     data:data,
     contentType:"application/json",
     type:"post",
     dataType:"json",
     success:function(response){
       console.log(response);
       Swal.fire({ title: "Good job!", text: message+email, icon: "success"});
       window.location.href="./otp.html"
     },
     error:function(error){
       console.log(error);
       Swal.fire({ title: "Bad job!", text: "Something went wrong", icon: "error"});
     }
   });
}

formRegistration.addEventListener("submit", (event)=>{
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
  const url = "/sendAuthentication";
  const message = "OTP has been sent to email ";
  
  redirect(jsonData, url, message);
});