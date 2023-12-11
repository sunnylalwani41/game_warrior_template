var sub, user, pass, mainContent, loggedIn;
// var loggedIn = document.querySelector('.logged-in')

const formLogin = document.getElementsByClassName("login")[0];
const email = document.querySelector(".email");
const password = document.querySelector(".password");

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
       window.location.href="../index.html"
     },
     error:function(error){
       console.log(error);
       Swal.fire({ title: "Bad job!", text: "Something went wrong", icon: "error"});
     }
   });
}

formLogin.addEventListener("submit", (event)=>{
  event.preventDefault();
  const loginEmail = email.value;
  const loginPassword = password.value;
  const loginData = {
    email: loginEmail,
    password: loginPassword
  }
  const jsonData = JSON.stringify(loginData);
  const url = "/verifyUser";
  const message = "Login successfully!! ";

  redirect(jsonData, url, message);
});