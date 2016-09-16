//    $.ajax({
//        url: "http://localhost:2675/api/pokedex",
//        method: "GET",
//        dataType: "jsonp",
//        xhrFields: {
//            withCredentials: true
//        }
//    }).done(function (data) {
//        console.log(data);
//    });

var ewikiBD = angular.module('ewikibd', [
        'ui.router',                    // Routing
        'ui.bootstrap'                 // Bootstrap
]);

var apiBaseUrl = 'http://localhost:2675/api/';