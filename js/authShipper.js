var token = localStorage.getItem('token');
var statusAuth = '';
var email = '';
var shipperID = '';
var profile;
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
  profile = obj;
  shipperID = obj.obj.ID;
  if (obj.obj.role == "ROLE_SHIPPER") {
    statusAuth = obj.obj.role;
    email = obj.obj.email;
  } else if (obj.obj.role == "ROLE_ADMIN") {
    window.open(PATH + "cms/orders/index.html", "_self");
  } else {
    localStorage.clear();
    window.open(PATH + "auth/login.html", "_self");
  }
}).fail(async function (data) {
  var obj = JSON.parse(data['responseText']);
  console.log(obj);
});