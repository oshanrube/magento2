angular.module('app.directives', [])
    .directive('onLastRepeat', function () {
        return function (scope, element, attrs) {
            if (scope.$last) {
                setTimeout(function () {
                    scope.$emit('onRepeatLast', element, attrs);
                }, 1)
            }
        };
    }).directive('appNavbar', function () {
    return {
        restrict: 'E',
        templateUrl: 'templates/navbar.html',
        link: function () {
            loadSearchBox();
            loadDropDownMenu();
        }
    };
}).directive('product', function () {
    return {
        restrict: 'E',
        templateUrl: 'templates/product.html'
    };
}).directive('appBlocks', function () {
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
}).directive('appNewArrivals', function () {
    return {
        restrict: 'E',
        templateUrl: 'templates/homepage/new_arrivals.html'
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
        templateUrl: 'templates/homepage/featured_products.html',
        link: function ($scope, element, attrs) {
            // Wait for templates to render
            $scope.$evalAsync(function () {
                loadBrandCarosel();
            });
        }
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
        templateUrl: 'templates/navbar_cart.html',
        link: function ($scope) {
            $scope.$evalAsync(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        }
    };
}).directive('youMayAlsoLike', function () {
    return {
        restrict: 'E',
        templateUrl: 'templates/product/you_may_also_like.html'
    };
}).directive('alsoBrought', function () {
    return {
        restrict: 'E',
        templateUrl: 'templates/product/also_brought.html'
    };
}).directive('recomendedWith', function () {
    return {
        restrict: 'E',
        templateUrl: 'templates/product/recomended_with.html'
    };
}).directive('catalogFilters', function () {
    return {
        restrict: 'E',
        templateUrl: 'templates/catalog/filters.html'
    };
}).directive('loading', function () {
    return {
        restrict: 'E',
        template: '<div class="sk-wandering-cubes"><div class="sk-cube sk-cube1"></div><div class="sk-cube sk-cube2"></div></div>'
    };
}).directive('catalogFilter', function () {
    return {
        restrict: 'E',
        templateUrl: 'templates/catalog/filter.html'
    };
});

