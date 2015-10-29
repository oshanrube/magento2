angular.module('app.controllers', [])
    .controller('LoginController',function ($http, $timeout, $state, Page, $location, API) {
        //redirect
        if (Page.getToken() !== null) {
            $state.go('app.home');
        }
        //model
        this.user = {
            email: null,
            password: null,
            remember_me: false
        };
        //sample data
        this.user.email = 'oshanrube@gmail.com';
        this.user.password = 'asdasd';
        this.login = function () {
            Page.setLoading(true);
            $http({
                method: 'POST',
                url: API.getAPIUrl() + 'login',
                crossDomain: true,
                data: this.user
            }).success(function (response) {
                // this callback will be called asynchronously
                // when the response is available
                if (response.success) {
                    //save the token and move on
                    $timeout(function () {
                        Page.hideMessage();
                    }, 2000);
                    Page.setSuccessMessage(response.message);
                    Page.setToken(response.data.sessionToken);
                    $state.go('app.home');
                } else {
                    //show the error
                    Page.setErrorMessage(response.message);
                    $timeout(function () {
                        Page.hideMessage();
                    }, 2000);
                }
            }).error(function (status, response) {
                // called asynchronously if an error occurs
                // or server returns response with an error status.
                Page.setErrorMessage("Unable to connect to the server at the moment, please try again later");
                $timeout(function () {
                    Page.hideMessage();
                }, 2000);
            }).finally(function () {
                Page.setLoading(false);
            });
        };
    }).controller('ContainerController',function ($scope, Page) {
        this.getPage = function () {
            return Page;
        };
    }).controller('MainController',function ($scope, $ionicHistory, $localStorage, $state, Page, API) {
        this.getFullName = function () {
            var name = '';
            if ($scope.data.profile === undefined && Page.getToken() !== null) {
                API.getAPIData('profile', 'profile');
            }
            //concat the name
            if ($scope.data.profile !== undefined) {
                if ($scope.data.profile.firstname !== undefined && $scope.data.profile.firstname !== null) {
                    name += $scope.data.profile.firstname + " ";
                }
                if ($scope.data.profile.middlename !== undefined && $scope.data.profile.middlename !== null) {
                    name += $scope.data.profile.middlename + " ";
                }
                if ($scope.data.profile.lastname !== undefined && $scope.data.profile.lastname !== null) {
                    name += $scope.data.profile.lastname + " ";
                }
            }
            return name;
        };

        this.isLoggedIn = function () {
            return (Page.getToken() !== null);
        };

        this.LogOut = function () {
            Page.setToken(null);
            ImgCache.clearCache(function () {
                // continue cleanup...
            }, function () {
                // something went wrong
            });
            //delete localstorage
            $localStorage.$reset();
            $ionicHistory.clearHistory();
            $ionicHistory.clearCache();
            $state.go('app.login');
        }
        this.isActive = function (route) {
            return route === $location.path();
        }
        this.getBackUrl = function () {
            return Page.getBackUrl();
        }
    }).controller('HomeController',function ($location, $ionicActionSheet, $ionicModal, $http, Page, $scope, FBC, API, ionicMaterialMotion) {
        Page.setBackUrl(false);


        //get Coupons
        if ($scope.data.coupons === undefined) {
            API.getAPIData('coupons/list', 'coupons');
        }

        if ($scope.data.hottest_products === undefined) {
            API.getAPIData('hottest_products', 'hottest_products');
        }

        //coupons
        this.getCoupons = function () {
            return $scope.data.coupons;
        }
        this.getImageUrl = function (image_url) {
            return API.getAPIUrl() + image_url + '/70/70';
        }
        this.getCouponUrl = function () {
            return $scope.coupon_url;
        }
        this.getCouponTitle = function () {
            return $scope.coupon_title;
        }
        this.showCoupon = function (coupon) {
            $scope.coupon = coupon;
            $scope.coupon_url = API.getServerUrl() + coupon.qr_code;
            // Create the login modal that we will use later
            $ionicModal.fromTemplateUrl('templates/coupon.html', {
                scope: $scope
            }).then(function (modal) {
                $scope.modal = modal;
                $scope.modal.show();
            });
        }
        //hottest products
        this.getHottestProducts = function () {
            return $scope.data.hottest_products;
        }

//        WebPullToRefresh().init({
//            loadingFunction: function () {
//                return new Promise(function (resolve, reject) {
//                    // Run some async loading code here
//                    API.getAPIData('coupons/list', 'coupons', 'coupons', undefined, resolve);
//                    API.getAPIData('hottest_products', 'hottest_products', 'hottest_products', undefined, resolve);
//                });
//            },
//            contentEl: home
//        })

        this.getFacebookLikesCount = function (product) {
            if (FBC.isReady() && product.facebook_id !== null && product.facebook_update_pending === undefined) {
                product.facebook_update_pending = true;

                FBC.get('/' + product.facebook_id + '?fields=likes,comments,sharedposts').then(
                    function (response) {
                        if (response.likes !== undefined) {
                            product.facebook_likes = response.likes.data;
                        }
                        if (response.comments !== undefined) {
                            product.facebook_comments = response.comments.data;
                        }
                        if (response.sharedposts !== undefined) {
                            product.facebook_shares = response.sharedposts.data;
                        }
                    },
                    function (response) {
                        console.error(response.error.message);
                    }
                );
            }
            return (product.facebook_likes !== undefined && product.facebook_likes !== null ? product.facebook_likes.length : 0);

        }
        this.getFacebookCommentsCount = function (product) {
            return (product.facebook_comments !== undefined && product.facebook_comments !== null ? product.facebook_comments.length : 0);

        }
        this.getFacebookSharesCount = function (product) {
            return (product.facebook_shares !== undefined && product.facebook_shares !== null ? product.facebook_shares.length : 0);

        }
        this.hasUserLiked = function (product) {
            if ($scope.user !== undefined) {
                //
                $(product.facebook_likes).each(function (key, value) {
                    if (value.id == $scope.user.id) {
                        product.facebook_user_liked = true;
                    }
                });
            }
            return product.facebook_user_liked;
        }
// Triggered on a button click, or some other target
        this.openFacebook = function ($event, product) {
            $event.preventDefault();
            // Show the action sheet
            var hideSheet = $ionicActionSheet.show({
                buttons: [
                    {
                        text: 'Like'
                    },
                    {
                        text: 'Comment'
                    },
                    {
                        text: 'Share'
                    }
                ],
                titleText: 'Facebook functions',
                cancelText: 'Cancel',
                cancel: function () {
                    // add cancel code..
                },
                buttonClicked: function (index) {
                    switch (index) {
                        case 1:
                            if (FBC.isReady() && product.facebook_id !== null) {
                                //like
                                FBC.post('/' + product.facebook_id + '/likes').then(function (result) {
                                    console.log(result);
                                }, function (data) {
                                    console.log(result);
                                });
                            }
                            break;
                        case 2:
                            console.log('add comment');
                            break;
                        case 3:
                            console.log('share');
                            break;
                    }
                    return true;
                }
            });
        };

    }).controller('HottestProductsController',function ($http, $scope, Page, API) {
        Page.setBackUrl(false);
        //hottest products
        this.getHottestProducts = function () {
            if ($scope.data.hottest_products === undefined) {
                API.getAPIData('hottest_products', 'hottest_products');
            }
            return $scope.data.hottest_products;
        }
        this.getImageUrl = function (image_url) {
            if (image_url !== undefined) {
                return API.getAPIUrl() + image_url + '/80/80';
            }
        }
    }
).controller('ProductsController',function ($http, $scope, Page, API) {
        Page.setBackUrl(false);
        //products
        this.getProducts = function () {
            if ($scope.data.products === undefined) {
                API.getAPIData('products', 'products');
            }
            return $scope.data.products;
        }
        this.getImageUrl = function (image_url) {
            return API.getAPIUrl() + image_url + '/80/80';
        }

    }).controller('ProductController',function ($http, $scope, Page, $stateParams, API) {
        if ($stateParams.type == "hottest_products") {
            Page.setBackUrl('#/hottest_products');
        } else if ($stateParams.type == "products") {
            Page.setBackUrl('#/products');
        } else {
            Page.setBackUrl('#/home');
        }
        this.getProduct = function () {
            var product_id = $stateParams.id;
            var name = "product_" + product_id;
            if ($scope.data[name] === undefined) {
                API.getAPIData('product/' + product_id, name, 'product');
            }
            return $scope.data[name];
        }
        this.getImageUrl = function (image_url, id) {
            if (image_url !== undefined) {
                if (id !== undefined) {
                    return API.getAPIUrl() + image_url + '/' + $('#' + id).width() + '/0';
                } else {
                    return API.getAPIUrl() + image_url + '/80/80';
                }
            }
        }
        this.UpdateImage = function (collection_product, size, color) {
            collection_product.selected_size = (size === undefined ? collection_product.sizes[0].id : size);
            collection_product.selected_color = (color === undefined ? collection_product.colors[0].id : color);
            if (collection_product.attribute_images[collection_product.selected_color] !== undefined && collection_product.attribute_images[collection_product.selected_color][collection_product.selected_size] !== undefined) {
                collection_product.image = collection_product.attribute_images[collection_product.selected_color][collection_product.selected_size];
            }

        }
    }
).controller('PromotionsController',function ($http, $ionicModal, $scope, Page, API) {
        //products
        this.getPromotions = function () {
            if ($scope.data.promotions === undefined) {
                API.getAPIData('promotions/list', 'promotions');
            }
            return $scope.data.promotions;
        }
        this.getImageUrl = function (image_url) {
            return API.getAPIUrl() + image_url + '/80/80';
        }
        this.getPromotionUrl = function () {
            return $scope.promotion_url;
        }
        this.getPromotionTitle = function () {
            return $scope.promotion_title;
        }
        this.showPromotion = function (promotion) {
            $scope.promotion = promotion;
            $scope.promotion_url = API.getServerUrl() + promotion.image_url;
            // Create the login modal that we will use later
            $ionicModal.fromTemplateUrl('templates/promotion.html', {
                scope: $scope
            }).then(function (modal) {
                $scope.modal = modal;
                $scope.modal.show();
            });
        }

    }).controller('CouponsController',function ($http, $ionicModal, $scope, Page, API) {
        this.getCoupons = function () {
            if ($scope.data.coupons === undefined) {
                API.getAPIData('coupons/list', 'coupons');
            }
            return $scope.data.coupons;
        }
        this.getImageUrl = function (image_url) {
            return API.getAPIUrl() + image_url + '/80/80';
        }
        this.getCouponUrl = function () {
            return $scope.coupon_url;
        }
        this.getCouponTitle = function () {
            return $scope.coupon_title;
        }
        this.showCoupon = function (coupon) {
            $scope.coupon = coupon;
            $scope.coupon_url = API.getServerUrl() + coupon.qr_code;
            // Create the login modal that we will use later
            $ionicModal.fromTemplateUrl('templates/coupon.html', {
                scope: $scope
            }).then(function (modal) {
                $scope.modal = modal;
                $scope.modal.show();
            });
        }

    }).controller('WishlistController', function ($http, $scope, Page, API) {
        //wishlist
        this.getWishlistItems = function () {
            if ($scope.data.wishlist === undefined) {
                API.getAPIData('wishlist/list', 'wishlist');
            }
            return $scope.data.wishlist;
        }
        this.getImageUrl = function (image_url) {
            return API.getAPIUrl() + image_url + '/80/80';
        }

    })
    .controller('MapsController',function ($http, $scope, Page, API) {

        $scope.map = {
            center: {
                latitude: 6.91,
                longitude: 79.86
            },
            zoom: 8,
            bounds: {}
        };
        $scope.options = {
            scrollwheel: true
        };

        $scope.randomMarkers = [];
        // Get the bounds from the map once it's loaded
        $scope.$watch(function () {
            return $scope.map.bounds;
        }, function (nv, ov) {
            // Only need to regenerate once
            if (!ov.southwest && nv.southwest) {
                var maps = $scope.getMaps();
                $scope.getRandomMarkers(maps);
            }
        }, true);

        $scope.getRandomMarkers = function (maps) {
            var markers = [];
            if (maps !== undefined) {
                for (var i = 0; i < maps.length; i++) {
                    var ret = {
                        latitude: maps[i].latitude,
                        longitude: maps[i].longitude,
                        title: maps[i].title + "<br />" + maps[i].description,
                        id: i,
                        show: false
                    };
                    ret.onClick = function () {
                        ret.show = !ret.show;
                    };
                    markers.push(ret);
                }
            }
            $scope.randomMarkers = markers;
        }

        $scope.getMaps = function () {
            if ($scope.data.maps === undefined) {
                API.getAPIData('maps/list', 'maps', 'maps', function () {
                    $scope.getRandomMarkers($scope.data.maps)
                });
            }
            return $scope.data.maps;
        }
        this.getImageUrl = function (image_url) {
            return API.getAPIUrl() + image_url + '/80/80';
        }

    }).controller('BlocksController',function ($http, $scope, API) {
        this.getSlides = function () {
            if ($scope.data.slides === undefined) {
                var myObject = {
                    searchCriteria: {
                        filterGroups: [
                            {filters: [
                                {
                                    field: 'identifier',
                                    value: 'home-page-block%',
                                    condition_type: 'like'
                                }
                            ]}
                        ]
                    }
                };
                var recursiveEncoded = $.param(myObject);
                var query = '/cmsBlock/search?' + recursiveEncoded;

                API.getAPIData(query, 'slides');
            }

            return $scope.data.slides.items;
        }
        this.getSlide = function (identifier) {
            var slides = this.getSlides();
            for (var x = 0; x < slides.length; x++) {
                if (identifier == slides[x].identifier) {
                    return slides[x];
                }
            }
        }
    }).controller('NavbarController', function ($http, $scope, API) {
        this.getPhone = function () {
            if ($scope.data.store_config === undefined) {
                var query = '/store/storeConfigs';
                API.getAPIData(query, 'store_config');
            }

            return $scope.data.store_config[0].store_phone;
        }
    })
;