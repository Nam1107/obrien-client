var token = localStorage.getItem('token');
var statusAuth = '';
var email = '';
$.ajax({
  url: ROOT + "user/getProfile",
  type: 'GET',
  headers: {
    "Authorization": 'Bearer ' + token,
  },
  async: false
}).done(function (data) {
  var obj = JSON.parse(data);
  if (obj.obj == null) {
    localStorage.clear();
    window.open(PATH + "auth/login.html", "_self");
  }
  // if (obj.obj.role == "ROLE_USER") {
  statusAuth = obj.obj.role;
  email = obj.obj.email;
  // }
}).fail(async function (data) {
  var obj = JSON.parse(data['responseText']);
  console.log(obj);
});