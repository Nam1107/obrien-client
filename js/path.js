const ROOT = 'http://localhost/PHP/obrien/';
// const ROOT = 'http://localhost/PHP/furniture/';
// const ROOT = 'https://furniture2022.herokuapp.com/';
// const ROOT = 'https://obrien2022.000webhostapp.com/';
const PATH = 'http://localhost/cocomic/';




function currentTime(date) {
    var yyyy = date.getFullYear().toString();
    var mm = (date.getMonth() + 1).toString();
    var dd = date.getDate().toString();

    var mmChars = mm.split('');
    var ddChars = dd.split('');

    return yyyy + '-' + (mmChars[1] ? mm : "0" + mmChars[0]) + '-' + (ddChars[1] ? dd : "0" + ddChars[0]);
}
