var password = document.getElementById("password")
  , confirm_password = document.getElementById("password2");

function validatePassword(){
  if(password.value != password2.value) {
    password2.setCustomValidity("Passwords don't match");
  } else {
    password2.setCustomValidity('');
  }
}

password.onchange = validatePassword;
password2.onkeyup = validatePassword;