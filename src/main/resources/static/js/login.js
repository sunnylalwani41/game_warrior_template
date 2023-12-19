var sub, user, pass, mainContent, loggedIn;


formLogin.addEventListener("submit", (event)=>{
  event.preventDefault();
  const loginEmail = email.value;
  const loginPassword = password.value;
  const loginData = {
    email: loginEmail,
    password: loginPassword
  }
  const jsonData = JSON.stringify(loginData);
  const url = "/";
  const message = "Login successfully!! ";

  redirect(jsonData, url, message);
});