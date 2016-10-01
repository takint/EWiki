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
                                    files: ['app/bower_components/dataTables/datatables.min.js',
                                        'app/styles/plugins/dataTables/datatables.min.css'
                                    ]
                                },
                                {
                                    serie: true,
                                    name: 'datatables',
                                    files: ['app/bower_components/angular-datatables/dist/angular-datatables.min.js'
                                    ]
                                },
                                {
                                    serie: true,
                                    name: 'datatables.buttons',
                                    files: ['app/bower_components/dataTables/angular-datatables.buttons.min.js']
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
                .state('index.category', {
                    url: "/category",
                    templateUrl: appBaseUrl + "views/category.html",
                    data: { pageTitle: 'Category page' },
                    resolve: {
                        loadPlugin: function ($ocLazyLoad) {
                            return $ocLazyLoad.load([
                                {
                                    serie: true,
                                    files: ['app/bower_components/dataTables/datatables.min.js',
                                        'app/styles/plugins/dataTables/datatables.min.css'
                                    ]
                                },
                                {
                                    serie: true,
                                    name: 'datatables',
                                    files: ['app/bower_components/angular-datatables/dist/angular-datatables.min.js'
                                    ]
                                },
                                {
                                    serie: true,
                                    name: 'datatables.buttons',
                                    files: ['app/bower_components/dataTables/angular-datatables.buttons.min.js']
                                }
                            ]);
                        }
                    }
                })
                .state('index.category-details', {
                    url: "/category-details",
                    templateUrl: appBaseUrl + "views/category-details.html",
                    data: { pageTitle: 'Add new Category' }
                })
                .state('index.wiki-image', {
                    url: "/wiki-image",
                    templateUrl: appBaseUrl + "views/wiki-image.html",
                    controller: WikiImageCtrl,
                    data: { pageTitle: 'Wiki Gallery' },
                    resolve: {
                        loadPlugin: function ($ocLazyLoad) {
                            return $ocLazyLoad.load([
                                {
                                    files: ['app/bower_components/ng-file-upload/ng-file-upload-all.min.js',
                                    'app/bower_components/ngInfiniteScroll/build/ng-infinite-scroll.min.js']
                                }
                            ]);
                        }
                    }
                })
                .state('index.main', {
                    url: "/main",
                    templateUrl: appBaseUrl + "views/main.html",
                    data: { pageTitle: 'Example view' }
                });
        }]);

ewikiBD
    .config([
        'cloudinaryProvider',
        function (cloudinaryProvider) {
            cloudinaryProvider
                .set("cloud_name", "ewiki-io")
                .set("upload_preset", "geesqi2u")
                .set("api_key", "742665545865257")
                .set("api_secret", "S1PQu71FWZ8l8b-PjsLRzTtoeLg");
        }]);