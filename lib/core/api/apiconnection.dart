// localhost depend on ip address for jatufloor08
// var mainURL = 'http://192.168.1.37:8000/api';

var mainURL = "http://192.168.1.35:8000/api";
var picUrl = "http://192.168.1.35:8000/";

setHeader(String accessToken) => {
      "Accept": "application/json",
      "Authorization": 'Bearer $accessToken',
      "Guard": "XX2!LHL2",
    };

String accessToken = '';
