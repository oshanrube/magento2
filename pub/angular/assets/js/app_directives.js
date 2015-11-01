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
    }).directive('appNewArrivals', function () {
        return {
            restrict: 'E',
            templateUrl: 'templates/new_arrivals.html',
            link: function ($scope, element, attrs) {
                $scope.$evalAsync(function () {

                });
            }
        };
    });