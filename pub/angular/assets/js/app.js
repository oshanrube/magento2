(function () {

    var app = angular.module('store', ['app.controllers', 'app.services', 'app.directives', 'app.filters', 'ngAnimate', 'ngResource', 'ngRoute', 'ngStorage', "ui.router", 'ngMaterial', 'ngAria', 'ngMessages', 'ImgCache']).config(function ($httpProvider) {
        $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
        /**
         * The workhorse; converts an object to x-www-form-urlencoded serialization.
         * @param {Object} obj
         * @return {String}
         */
        var param = function (obj) {
            var query = '', name, value, fullSubName, subName, subValue, innerObj, i;

            for (name in obj) {
                value = obj[name];

                if (value instanceof Array) {
                    for (i = 0; i < value.length; ++i) {
                        subValue = value[i];
                        fullSubName = name + '[' + i + ']';
                        innerObj = {};
                        innerObj[fullSubName] = subValue;
                        query += param(innerObj) + '&';
                    }
                }
                else if (value instanceof Object) {
                    for (subName in value) {
                        subValue = value[subName];
                        fullSubName = name + '[' + subName + ']';
                        innerObj = {};
                        innerObj[fullSubName] = subValue;
                        query += param(innerObj) + '&';
                    }
                }
                else if (value !== undefined && value !== null)
                    query += encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&';
            }

            return query.length ? query.substr(0, query.length - 1) : query;
        };

        // Override $http service's default transformRequest
        $httpProvider.defaults.transformRequest = [function (data) {
            return angular.isObject(data) && String(data) !== '[object File]' ? param(data) : data;
        }];

    })
        .config(function ($stateProvider, $urlRouterProvider) {

            $stateProvider
                .state('app', {
                    url: '/app',
                    abstract: true,
                    templateUrl: 'templates/menu.html',
                    controller: 'MainController as main'
                })
                .state('app.login', {
                    url: '/login',
                    views: {
                        'menuContent': {
                            templateUrl: 'templates/login.html',
                            controller: 'LoginController as login'
                        }
                    }
                })
                .state('app.home', {
                    url: '/home',
                    views: {'menuContent': {templateUrl: 'templates/home.html', controller: 'HomeController as home'}}
                })
                .state("app.hottest_products", {
                    url: '/hottest_products',
                    views: {
                        'menuContent': {
                            templateUrl: "templates/hottest_products.html",
                            controller: "HottestProductsController as hottest_products"
                        }
                    }
                })
                .state("app.product", {
                    url: '/:type/product/:id',
                    views: {
                        'menuContent': {
                            templateUrl: "templates/product.html",
                            controller: "ProductController as controller"
                        }
                    }
                })
                .state("app.products", {
                    url: '/products',
                    views: {
                        'menuContent': {
                            templateUrl: "templates/products.html",
                            controller: "ProductsController as products"
                        }
                    }
                })
                .state("app.promotions", {
                    url: '/promotions',
                    views: {
                        'menuContent': {
                            templateUrl: "templates/promotions.html",
                            controller: "PromotionsController as promotions"
                        }
                    }
                })
                .state("app.coupons", {
                    url: '/coupons',
                    views: {
                        'menuContent': {
                            templateUrl: "templates/coupons.html",
                            controller: "CouponsController as coupons"
                        }
                    }
                })
                .state("app.wishlist", {
                    url: '/wishlist',
                    views: {
                        'menuContent': {
                            templateUrl: "templates/wishlist.html",
                            controller: "WishlistController as wishlist"
                        }
                    }
                })
                .state("app.maps", {
                    url: '/maps',
                    views: {'menuContent': {templateUrl: "templates/maps.html", controller: "MapsController as maps"}}
                });
//
            // if none of the above states are matched, use this as the fallback
            $urlRouterProvider.otherwise('/app/login');
        })
//        .config(['$routeProvider', function ($routeProvider) {
//            $routeProvider
//                // Home
//                .when("/", {templateUrl: "templates/login.html", controller: "LoginController"})
//                .when("/home", {templateUrl: "templates/home.html", controller: "HomeController as home"})
//                .when("/hottest_products", {templateUrl: "templates/hottest_products.html", controller: "HottestProductsController as hottest_products"})
//                .when("/:type/product/:id", {templateUrl: "templates/product.html", controller: "ProductController as controller"})
//                .when("/products", {templateUrl: "templates/products.html", controller: "ProductsController as products"})
//                .when("/promotions", {templateUrl: "templates/promotions.html", controller: "PromotionsController as promotions"})
//                .when("/promotion/:id", {templateUrl: "templates/promotion.html", controller: "PromotionController as controller"})
//                .when("/coupons", {templateUrl: "templates/coupons.html", controller: "CouponsController as coupons"})
//                .when("/wishlist", {templateUrl: "templates/wishlist.html", controller: "WishlistController as wishlist"})
//                .when("/maps", {templateUrl: "templates/maps.html", controller: "MapsController as maps"})
//
//                // else 404
//                .otherwise("/404", {templateUrl: "templates/404.html", controller: "PageCtrl"});
//        }])
        .config(function (ImgCacheProvider) {

            // or more options at once
            ImgCacheProvider.setOptions({
                debug: false,
                usePersistentCache: true
            });

            // ImgCache library is initialized automatically,
            // but set this option if you are using platform like Ionic -a
            // in this case we need init imgcache.js manually after device is ready
            //ImgCacheProvider.manualInit = true;
        })
//        .config(['uiGmapGoogleMapApiProvider', function (GoogleMapApiProviders) {
//            GoogleMapApiProviders.configure({
//                china: false
//            });
//        }]).config(function (uiGmapGoogleMapApiProvider) {
//            uiGmapGoogleMapApiProvider.configure({
//                key: 'AIzaSyCQkyQC_g-6bP5GajfeftsmQlt5Q55ZrO4',
//                v: '3.17',
//                libraries: 'geometry,visualization'
//            });
//        })
        .run(function ($rootScope, $localStorage, $state, Page) {
            console.log('preloading');
            //preloads
            $rootScope.data = $localStorage;
//            if (Page.getToken() === null) {
//                $state.go('app.login');
//                return;
//            }
//            FBC.init('734938539870830');
//            FBC.login();
            initialize();
            initializeHome();
        })
})();