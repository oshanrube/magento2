(function () {

    var app = angular.module('store', ['app.controllers', 'app.services', 'app.api_query', 'app.directives', 'app.filters', 'ngAnimate', 'ngResource', 'ngRoute', 'ngStorage', "ui.router", 'ngMaterial', 'ngAria', 'ngMessages', 'ImgCache']).config(function ($httpProvider) {
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
                .state('home', {
                    url: '/home',
                    templateUrl: 'pages/home.html'
                }).state('product', {
                url: '/product/:sku',
                views: {
                    '': {
                        templateUrl: 'pages/product.html',
                        controller: 'ProductsController'
                    },
                },
                resolve: {
                    simpleObj: function ($q, $timeout) {
                        $timeout(function () {
                            loadProductPage();
                        }, 1);
                    }
                }
            }).
            state('catalog', {
                url: '/catalog/:id',
                templateUrl: 'pages/home.html'
            }).state('cart', {
                url: '/product/:id',
                templateUrl: 'pages/home.html'
            });
//
            // if none of the above states are matched, use this as the fallback
            $urlRouterProvider.otherwise('/home');
        })
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
        .config(function ($mdThemingProvider) {
            $mdThemingProvider.theme('success')
                .primaryPalette('green')
                .accentPalette('orange')
                .backgroundPalette('green');
        })
        .run(function ($rootScope, $localStorage, $state, Page) {
            //preloads
            $rootScope.data = $localStorage;

            initialize();
            initializeHome();
            $rootScope.getData = function (variable) {
                var variables = variable.split('.');

                var data = $rootScope.data;
                for (var x = 0; x < variables.length; x++) {
                    if (data[variables[x]] === undefined) {
                        return undefined;
                    } else {
                        data = data[variables[x]];
                    }
                }
                return data;
            };
            $rootScope.resetData = function (variable) {
                var variables = variable.split('.');
                delete $rootScope.data[variables[0]];
            }
        })
})();