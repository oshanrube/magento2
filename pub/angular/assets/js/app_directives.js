angular.module('app.directives', [])
    .directive('onLastRepeat',function () {
        return function (scope, element, attrs) {
            if (scope.$last) {
                setTimeout(function () {
                    scope.$emit('onRepeatLast', element, attrs);
                }, 1)
            }
        };
    }).directive('appNavbar',function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/navbar.html'
        };
    }).directive('product', function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/product.html'
        };
    }).directive('appBlocks',function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/blocks.html',
            link: function ($scope, element, attrs) {
                // Wait for templates to render
                $scope.$evalAsync(function () {
                    // Finally, directives are evaluated
                    // and templates are renderer here
                    var mySwiper = new Swiper('.swiper-container', {
                        pagination: '.box-pagination',
                        keyboardControl: true,
                        paginationClickable: true,
                        slidesPerView: 'auto',
                        autoResize: true,
                        resizeReInit: true
                    })

                    $('.prevControl').on('click', function (e) {
                        e.preventDefault()
                        mySwiper.swipePrev()
                    });
                    $('.nextControl').on('click', function (e) {
                        e.preventDefault()
                        mySwiper.swipeNext()
                    });
                });
            }
        };
    }).directive('appNewArrivals',function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/new_arrivals.html'
        };
    }).directive('appFreeShipping', function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/free_shipping.html'
        };
    }).directive('appTrustedSeller', function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/trusted_seller.html'
        };
    }).directive('appFeaturedProducts', function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/featured_products.html'
        };
    }).directive('footer', function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/footer.html'
        };
    }).directive('toast', function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/toast.html'
        };
    }).directive('navbarCart', function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/navbar_cart.html'
        };
    });