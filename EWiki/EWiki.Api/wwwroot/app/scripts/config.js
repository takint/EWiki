ewikiBD
    .config([
        '$stateProvider',
        '$urlRouterProvider',
        function ($stateProvider, $urlRouterProvider) {

            $urlRouterProvider.otherwise("/index/main");

            $stateProvider
                .state('index', {
                    abstract: true,
                    url: "/index",
                    templateUrl: "views/common/content.html"
                })
                .state('index.article', {
                    url: "/article",
                    templateUrl: "views/article.html",
                    data: { pageTitle: 'Article page' }
                })
                .state('index.main', {
                    url: "/main",
                    templateUrl: "views/main.html",
                    data: { pageTitle: 'Example view' }
                })
                .state('index.minor', {
                    url: "/minor",
                    templateUrl: "views/minor.html",
                    data: { pageTitle: 'Example view' }
                });
        }]);