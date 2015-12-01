angular.module('app.services', [])
    .factory("API", function ($http, $rootScope, $sce, Page, $mdToast) {
        var loadingdata = [];

        return {
            isLoading: function ($key) {
                return (loadingdata[$key] !== undefined);
            },
            getAPIRequest: function () {
                var method = 'GET';
                var data = null;
                var onsuccess = null;
                var onfailure = null;
                return {
                    getServerUrl: function () {
                        //dynamic url
                        var server_url = 'http://fedora-server/grocery_bag/magento2/pub/';
                        return server_url;
                    },
                    getAPIUrl: function () {
                        //server_url = 'https://localhost:8081/';
                        return this.getServerUrl() + 'rest/default/V1';
                    },
                    setPostmethod: function () {
                        method = 'POST';
                        return this;
                    },
                    setDeletemethod: function () {
                        method = 'DELETE';
                        return this;
                    },
                    setPutmethod: function () {
                        method = 'PUT';
                        return this;
                    },
                    setData: function ($data) {
                        data = $data;
                        return this;
                    },
                    setOnSuccess: function ($onsuccess) {
                        onsuccess = $onsuccess;
                        return this;
                    },
                    setOnFailure: function ($onfailure) {
                        onfailure = $onfailure;
                        return this;
                    },
                    setOnComplete: function ($oncomplete) {
                        oncomplete = $oncomplete;
                        return this;
                    },
                    execute: function (url, key) {
                        if (loadingdata[key] === undefined) {
                            loadingdata[key] = true;
                            $http({
                                method: method,
                                data: JSON.stringify(data),
                                url: this.getAPIUrl() + url,
                                crossDomain: true,
                                headers: {
                                    Accept: "application/json",
                                    "Content-Type": "application/json",
                                    "Authorization": (Page.getToken() !== null ? "Bearer " + Page.getToken() : '')
                                }
                            }).success(function (response) {
                                if (response.errors == undefined && response !== "") {
                                    //save the data to the key
                                    $rootScope.data[key] = response;
                                    if (onsuccess !== null) {
                                        onsuccess();
                                    }
                                } else {
                                    //show the error
                                    Page.setErrorMessage(sprintf(response));
                                }
                            }).error(function (response, status) {
                                // called asynchronously if an error occurs
                                // or server returns response with an error status.
                                Page.setErrorMessage(sprintf(response));
                            }).finally(function () {
                                //remove key
                                delete loadingdata[key];
                                //check for the rest
                                var count = 0;
                                for (var k in loadingdata) {
                                    if (loadingdata.hasOwnProperty(k)) {
                                        ++count;
                                    }
                                }
                                if (count === 0) {
                                    Page.setLoading(false);
                                    if (oncomplete !== null) {
                                        oncomplete();
                                    }
                                }
                            });
                        }
                    }
                };
            }
        }
    })
    .factory("Page", function ($localStorage, $timeout) {
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
                    //TODO set loading
                } else {
                }
            },
            hasMessage: function () {
                return (message !== null);
            },
            getMessage: function () {
                return message;
            },
            messageType: function () {
                return messageType;
            },
            hideMessage: function () {
                message = null;
            },
            startTimeout: function () {
                $timeout(function () {
                    message = null;
                }, 5000);
            },
            setSuccessMessage: function (successMessage) {
                message = successMessage;
                messageType = true;
                this.startTimeout();
            },
            setErrorMessage: function (errorMessage) {
                message = errorMessage;
                messageType = false;
                this.startTimeout();
            },
            getToken: function () {
                if ($localStorage.token === undefined) {
                    $localStorage.token = null;
                }
                return $localStorage.token;
            },
            getCustomer: function () {
                if ($localStorage.me === undefined) {
                    $localStorage.me = null;
                }
                return $localStorage.me;
            },
            setToken: function (newSessionToken) {
                $localStorage.token = newSessionToken;
            },
            isUserLoggedIn: function () {
                return (this.getToken() !== null);
            },
            getCartId: function () {
                if ($localStorage.cart_id === undefined) {
                    $localStorage.cart_id = null;
                }
                return $localStorage.cart_id;
            },
            setCartId: function (cartId) {
                $localStorage.cart_id = cartId;
            },
            getGuestCartId: function () {
                if ($localStorage.guest_cart_id === undefined) {
                    $localStorage.guest_cart_id = null;
                }
                return $localStorage.guest_cart_id;
            },
            setGuestCartId: function (cartId) {
                $localStorage.guest_cart_id = cartId;
            },
            getStorage: function () {
                return $localStorage;
            },
            setStorage: function (data) {
                $localStorage.hottest_products = data.hottest_products;
            },
            setBackUrl: function (url) {
                back_url = url;
            },
            getBackUrl: function () {
                return back_url;
            }
        };
    }).factory("Modal", function ($mdDialog, $rootScope) {
    return {
        loadTemplate: function (ev, dataToPass, onLoad) {
            $mdDialog.show({
                    controller: 'DialogController',
                    templateUrl: 'templates/modal/' + ev + '.tmpl.html',
                    parent: angular.element(document.body),
                    targetEvent: ev,
                    clickOutsideToClose: false,
                    locals: {dataToPass: dataToPass, onLoad: onLoad}
                })
                .then(function (answer) {
                    //console.log('You said the information was "' + answer + '".');
                }, function () {
                    //console.log('You cancelled the dialog.');
                });
        }
    };
});