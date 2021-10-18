window.pushHideButton = function(){
  let txtPass = document.getElementById("textPassword");
  let btnEye = document.getElementById("buttonEye");
  if (txtPass.type === "text") {
    txtPass.type = "password";
  } else {
    txtPass.type = "text";
  }
}
