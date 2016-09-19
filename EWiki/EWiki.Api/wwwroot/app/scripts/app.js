'use strict';
var ewikiBD = angular.module('ewikibd', [
        'ui.router',                    // Routing
        'ui.bootstrap'                 // Bootstrap
]);

var apiBaseUrl = 'http://localhost:2675/api/';
var baseUrl = $('base').attr('href');
var appBaseUrl = baseUrl + '/';