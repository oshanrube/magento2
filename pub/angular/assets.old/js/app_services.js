angular.module('app.services', [])
    .factory("API", function ($http, $rootScope, Page) {
        var loadingdata = [];

        return {
            getServerUrl: function () {
                //dynamic url
                var server_url = 'https://192.168.56.101/amante_aws/php/';
                if (isPhonegap()) {
                    server_url = 'https://amante-oshanrube.rhcloud.com/';
                }
                return server_url;
            },
            getAPIUrl: function () {
                //server_url = 'https://localhost:8081/';
                return this.getServerUrl() + 'api/';
            },
            getAPIData: function (action, $key, api_key, onsucces, oncomplete) {

                if (loadingdata[$key] === undefined && Page.getToken() !== null) {
                    loadingdata[$key] = true;
                    Page.setLoading(true);
                    $http({
                        method: 'GET',
                        url: this.getAPIUrl() + action + '/' + Page.getToken(),
                        crossDomain: true
                    }).success(function (response) {
                        if (response.success) {
                            if (api_key === undefined) {
                                api_key = $key;
                            }
                            //save the data to the key
                            $rootScope.data[$key] = response.data[api_key];
                            if (onsucces !== undefined) {
                                onsucces();
                            }
                        } else {
                            //show the error
                            Page.setErrorMessage(response.message);
                        }
                    }).error(function (status, response) {
                        // called asynchronously if an error occurs
                        // or server returns response with an error status.
                        Page.setErrorMessage("Unable to connect to the server at the moment, please try again later");
                    }).finally(function () {
                        //remove key
                        delete loadingdata[$key];
                        //check for the rest
                        var count = 0;
                        for (var k in loadingdata) {
                            if (loadingdata.hasOwnProperty(k)) {
                                ++count;
                            }
                        }

                        if (count === 0) {
                            Page.setLoading(false);
                            if (oncomplete !== undefined) {
                                oncomplete();
                            }
                        }
                    });
                }
            }
        }
    })
    .factory("Page", function ($localStorage, $ionicLoading) {
        var loading = false;
        var message = null;
        var messageType = true;
        var back_url = false;

        return {
            isLoading: function () {
                return loading;
            },
            setLoading: function (isloading) {
                if (isloading) {
                    $ionicLoading.show({template: '<div class="loader"><svg class="circular"><circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/></svg></div>'});
                } else {
                    $ionicLoading.hide();
                }
            },
            hasMessage: function () {
                return (message !== null);
            }
            ,
            getMessage: function () {
                return message;
            }
            ,
            messageType: function () {
                return messageType;
            }
            ,
            hideMessage: function () {
                message = null;
            }
            ,
            setSuccessMessage: function (successMessage) {
                message = successMessage;
                messageType = true;
            }
            ,
            setErrorMessage: function (errorMessage) {
                message = errorMessage;
                messageType = false;
            }
            ,
            getToken: function () {
                if ($localStorage.token === undefined) {
                    $localStorage.token = null;
                }
                return $localStorage.token;
            }
            ,
            setToken: function (newSessionToken) {
                $localStorage.token = newSessionToken;
            }
            ,
            getStorage: function () {
                return $localStorage;
            }
            ,
            setStorage: function (data) {
                $localStorage.hottest_products = data.hottest_products;
            }
            ,
            setBackUrl: function (url) {
                back_url = url;
            }
            ,
            getBackUrl: function () {
                return back_url;
            }
        }
            ;
    })
;