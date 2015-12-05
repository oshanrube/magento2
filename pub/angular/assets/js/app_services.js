angular.module('app.services', [])
    .factory("Page", function ($localStorage, $timeout, $rootScope) {
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
                if ($rootScope.data['token'] === undefined) {
                    $rootScope.data['token'] = null;
                }
                return $rootScope.data['token'];
            },
            setToken: function (newSessionToken) {
                $rootScope.data['token'] = newSessionToken;
            },
            getCustomer: function () {
                if ($rootScope.data['me'] === undefined) {
                    $rootScope.data['me'] = null;
                }
                return $rootScope.data['me'];
            },
            isUserLoggedIn: function () {
                return (this.getToken() !== null);
            },
            getCartId: function () {
                if ($rootScope.data['cart_id'] === undefined) {
                    $rootScope.data['cart_id'] = null;
                }
                return $rootScope.data['cart_id'];
            },
            setCartId: function (cartId) {
                $rootScope.data['cart_id'] = cartId;
            },
            getGuestCartId: function () {
                if ($rootScope.data['guest_cart_id'] === undefined) {
                    $rootScope.data['guest_cart_id'] = null;
                }
                return $rootScope.data['guest_cart_id'];
            },
            setGuestCartId: function (cartId) {
                $rootScope.data['guest_cart_id'] = cartId;
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