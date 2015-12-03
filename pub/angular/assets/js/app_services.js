angular.module('app.services', [])
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