ewikiBD
    .config([
        '$stateProvider',
        '$urlRouterProvider',
        '$ocLazyLoadProvider',
        'IdleProvider',
        'KeepaliveProvider',
        function ($stateProvider, $urlRouterProvider, $ocLazyLoadProvider, IdleProvider, KeepaliveProvider) {

            // Configure Idle settings
            IdleProvider.idle(5); // in seconds
            IdleProvider.timeout(120); // in seconds

            $urlRouterProvider.otherwise("/index/main");

            $ocLazyLoadProvider.config({
                // Set to true if you want to see what and when is dynamically loaded
                debug: true
            });

            $stateProvider
                .state('index', {
                    abstract: true,
                    url: "/index",
                    templateUrl: appBaseUrl + "views/common/content.html"
                })
                .state('index.article', {
                    url: "/article",
                    templateUrl: appBaseUrl + "views/article.html",
                    data: { pageTitle: 'Article page' },
                    resolve: {
                        loadPlugin: function ($ocLazyLoad) {
                            return $ocLazyLoad.load([
                                {
                                    serie: true,
                                    files: ['bower_components/dataTables/datatables.min.js',
                                        'styles/plugins/dataTables/datatables.min.css'
                                    ]
                                },
                                {
                                    serie: true,
                                    name: 'datatables',
                                    files: ['bower_components/angular-datatables/dist/angular-datatables.min.js'
                                    ]
                                },
                                {
                                    serie: true,
                                    name: 'datatables.buttons',
                                    files: ['bower_components/dataTables/angular-datatables.buttons.min.js']
                                }
                            ]);
                        }
                    }
                })
                .state('index.article-details', {
                    url: "/article-details",
                    templateUrl: appBaseUrl + "views/article-details.html",
                    data: { pageTitle: 'Add new Article' }
                })
                .state('index.wiki-image', {
                    url: "/wiki-image",
                    templateUrl: appBaseUrl + "views/wiki-image.html",
                    data: { pageTitle: 'Wiki Images' }
                })
                .state('index.wiki-image-details', {
                    url: "/wiki-image-details",
                    templateUrl: appBaseUrl + "views/wiki-image-details.html",
                    data: { pageTitle: 'Wiki Images details' }
                })
                .state('index.main', {
                    url: "/main",
                    templateUrl: appBaseUrl + "views/main.html",
                    data: { pageTitle: 'Example view' }
                });
        }]);