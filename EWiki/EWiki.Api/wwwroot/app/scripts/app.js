'use strict';
var ewikiBD = angular.module('ewikibd', [
        'ui.router',
        'oc.lazyLoad',
        'ui.bootstrap',
        'ngIdle',
        'ngSanitize'
]);

var apiBaseUrl = 'http://localhost:2675/api/';
var baseUrl = $('base').attr('href');
var appBaseUrl = '';//baseUrl + '/';