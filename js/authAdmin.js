var token = localStorage.getItem('token');
var refreshToken = localStorage.getItem('refreshToken');
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
  if (obj.obj.role == "ROLE_ADMIN") {
    statusAuth = obj.obj.role;
    email = obj.obj.email;
  } else if (obj.obj.role == "ROLE_SHIPPER") {
    window.open(PATH + "cmsShipper/shippers/index.html", "_self");
  } else {
    localStorage.clear();
  }

}).fail(async function (data) {
  var obj = JSON.parse(data['responseText']);
  console.log(obj);
});