angular.module('app.controllers', [])
    .controller('ContainerController', function ($scope, Page, Modal) {
        this.getPage = function () {
            return Page;
        };

        this.getModal = function () {
            return Modal;
        }
    })
    .controller('LoginController', function ($http, $scope, $timeout, $state, Page, $location, API, Modal) {
        //redirect
        if (Page.getToken() !== null) {
            $state.go('home');
        }
        //model
        this.user = {
            email: null,
            password: null,
            remember_me: false
        };
        //sample data
        this.user.email = 'oshanrube@gmail.com';
        this.user.password = 'lomino';

        this.login = function () {
            API.getAPIRequest()
                .setPostmethod()
                .setData({username: this.user.email, password: this.user.password})
                .setOnSuccess(function () {
                    Page.setSuccessMessage('You have successfully sign in!');
                    $scope.hide();
                    //
                    API.getAPIRequest()
                        .execute('/customers/me', 'me');
                })
                .execute('/integration/customer/token', 'token');
        };

        this.isLoading = function () {
            return API.isLoading('token');
        };

        this.showSignUpModal = function () {
            Modal.loadTemplate('signup');
        };
        this.showPasswordResetModal = function () {
            Modal.loadTemplate('password_reset');
        };
        this.showSignInModal = function () {
            Modal.loadTemplate('login');
        };

    }).controller('PasswordResetController', function ($http, $scope, $timeout, $state, Page, $location, API, Modal) {
    //model
    this.user = {
        email: null
    };
    //sample data
    this.user.email = 'oshanrube@gmail.com';

    this.reset = function () {
        API.getAPIRequest()
            .setPutmethod()
            .setData({email: this.user.email})
            .setOnSuccess(function () {
                Page.setSuccessMessage('Link for the password reset process has been sent to your email!');
                $scope.hide();
            })
            .execute('/customers/password', 'reset');
    };

    this.isLoading = function () {
        return API.isLoading('reset');
    };

    this.showSignUpModal = function () {
        Modal.loadTemplate('signup');
    };
    this.showSignInModal = function () {
        Modal.loadTemplate('login');
    };

}).controller('SignUpController', function ($http, $scope, $timeout, $state, Page, $location, API, Modal) {
    //model
    this.user = {
        email: null,
        firstname: null,
        middlename: null,
        lastname: null,
        dob: null,
        gender: null,
        password: null
    };
    this.user.email = 'oshanrube@gmail.com';
    this.user.password = 'oshan1991';
    this.signup = function () {
        API.getAPIRequest()
            .setPostmethod()
            .setData({
                customer: {
                    email: this.user.email,
                    firstname: this.user.firstname,
                    lastname: this.user.lastname,
                    middlename: this.user.middlename,
                    dob: this.user.dob,
                    gender: this.user.gender
                }, password: this.user.password
            })
            .setOnSuccess(function () {
                Page.setSuccessMessage('You have successfully signed up!');
                $scope.hide();
            })
            .execute('/customers', 'signup');
    };
    this.isLoading = function () {
        return API.isLoading('signup');
    };
    this.showSignInModal = function () {
        Modal.loadTemplate('login');
    };
    this.showPasswordResetModal = function () {
        Modal.loadTemplate('password_reset');
    };
}).controller('BlocksController', function ($http, $scope, API) {
    this.getSlides = function () {
        if ($scope.getData('slides') === undefined) {
            var myObject = {
                searchCriteria: {
                    filterGroups: [
                        {
                            filters: [
                                {
                                    field: 'identifier',
                                    value: 'home-page-block%',
                                    condition_type: 'like'
                                }
                            ]
                        }
                    ]
                }
            };
            API.getAPIRequest()
                .execute('/cmsBlock/search?' + $.param(myObject), 'slides');
        }
        return $scope.getData("slides", "items")
    };
    this.getSlide = function (identifier) {
        var slides = this.getSlides();
        if (slides !== undefined) {
            for (var x = 0; x < slides.length; x++) {
                if (identifier == slides[x].identifier) {
                    return slides[x];
                }
            }
        }
        return {};
    };
    this.getBlock = function (identifier) {
        if ($scope.getData('blocks') === undefined) {
            API.getAPIRequest()
                .execute('/cmsBlock/search?searchCriteria', 'blocks');
        } else {
            for (var x = 0; x < $scope.getData("blocks", "items").length; x++) {
                if (identifier == $scope.getData("blocks", "items")[x].identifier) {
                    return $scope.getData("blocks", "items")[x];
                }
            }
        }
    };
}).controller('NavbarController', function ($http, $scope, API, Page, Modal) {
    this.getPhone = function () {
        if ($scope.getData('store_config') === undefined) {
            API.getAPIRequest()
                .execute('/store/storeConfigs', 'store_config');
        } else {
            return $scope.getData('store_config')[0].store_phone
        }
    };
    this.getEmail = function () {
        if ($scope.getData('store_config') === undefined) {
            API.getAPIRequest()
                .execute('/store/storeConfigs', 'store_config');
        } else {
            return $scope.getData('store_config')[0].support_email
        }
    };
    this.getName = function () {
        if ($scope.getData('store_config') === undefined) {
            API.getAPIRequest()
                .execute('/store/storeConfigs', 'store_config');
        } else {
            return $scope.getData('store_config')[0].store_name
        }
    };
    this.isUserLoggedIn = function () {
        return (Page.getToken() !== null);
    };
    this.getCustomer = function () {
        return Page.getCustomer();
    };
    this.getCategory = function () {
        if ($scope.getData('categories') === undefined) {
            API.getAPIRequest()
                .execute('/categories', 'categories');
        } else {
            return $scope.getData("categories", "children_data").slice(0, 6);
        }
        return [];
    };
    this.showSignInModal = function () {
        Modal.loadTemplate('login');
    };

    this.showSignUpModal = function () {
        Modal.loadTemplate('signup');
    };
    this.logOut = function () {
        Page.setToken(null);
        $scope.resetData('carts-' + Page.getCartId() + '-items');
        $scope.resetData('cart_totals.grand_total');
        Page.setSuccessMessage('You have successfully signed out!');
    };
}).controller('CartController', function ($http, $scope, API, Page) {
    $scope.$on('onRepeatLast', function (scope, element, attrs) {
        if ($scope.scroll_loaded === undefined) {
            loadScrollPanel();
            $scope.scroll_loaded = true;
        }
    });
    this.isUserLoggedIn = function () {
        return (Page.getToken() !== null);
    };
    this.getCartTotal = function () {
        if (this.isUserLoggedIn()) {
            if (Page.getCartId() === null) {
                var customer = Page.getCustomer();
                //create cart
                API.getAPIRequest()
                    .setPostmethod()
                    .setOnSuccess(function () {
                        Page.setCartId($scope.getData('cart_id'));
                    })
                    .execute('/carts/mine', 'cart_id');
            } else if ($scope.getData("cart_totals", "grand_total") === undefined) {
                API.getAPIRequest()
                    .execute('/carts/mine/totals', 'cart_totals');
            }
            return $scope.getData("cart_totals", "grand_total");
        } else {
            if (Page.getGuestCartId() === null) {
                //create guest cart
                API.getAPIRequest()
                    .setPostmethod()
                    .setOnSuccess(function () {
                        Page.setGuestCartId($scope.getData('guest_cart_id'));
                    })
                    .execute('/guest-carts', 'guest_cart_id');
            } else if ($scope.getData("guest_cart_totals", "grand_total") === undefined && Page.getGuestCartId() !== null) {
                API.getAPIRequest()
                    .execute('/guest-carts/' + Page.getGuestCartId() + '/totals', 'guest_cart_totals');
            }

            return $scope.getData("guest_cart_totals", "grand_total");
        }
    };
    this.getCartCurrency = function () {
        if (this.isUserLoggedIn()) {
            return $scope.getData("cart_totals", "base_currency_code")
        } else {
            return $scope.getData("guest_cart_totals", "base_currency_code")
        }
    };

    this.getCartItems = function () {
        if (this.isUserLoggedIn()) {
            if (Page.getCartId() != null && $scope.getData('carts-' + Page.getCartId() + '-items') === undefined) {
                API.getAPIRequest()
                    .execute('/carts/' + Page.getCartId() + '/items', 'carts-' + Page.getCartId() + '-items');
            }
            return $scope.getData('carts-' + Page.getCartId() + '-items');
        } else {
            if ($scope.getData('guest-carts-' + Page.getGuestCartId() + '-items') === undefined && Page.getGuestCartId() !== null) {
                API.getAPIRequest()
                    .execute('/guest-carts/' + Page.getGuestCartId() + '/items', 'guest-carts-' + Page.getGuestCartId() + '-items');
            }
            return $scope.getData('guest-carts-' + Page.getGuestCartId() + '-items');
        }
    };
    this.removeFromCart = function (product) {
        if (this.isUserLoggedIn()) {
            API.getAPIRequest()
                .setDeletemethod()
                .setOnSuccess(function () {
                    Page.setSuccessMessage('this product has been removed from the cart!');
                    $scope.resetData('carts-' + Page.getCartId() + '-items');
                    $scope.resetData('cart_totals.grand_total');
                })
                .execute('/carts/' + Page.getCartId() + '/items/' + product.item_id, 'carts-' + Page.getCartId() + '-items-' + product.item_id);
        } else {
            API.getAPIRequest()
                .setDeletemethod()
                .setOnSuccess(function () {
                    Page.setSuccessMessage('this product has been removed from the cart!');
                    $scope.resetData('guest-carts-' + Page.getGuestCartId() + '-items');
                    $scope.resetData('guest_cart_totals.grand_total');
                })
                .execute('/guest-carts/' + Page.getGuestCartId() + '/items/' + product.item_id, 'guest-carts-' + Page.getGuestCartId() + '-items-' + product.item_id);
        }
    };
    this.isLoading = function (product) {
        if (this.isUserLoggedIn()) {
            return API.isLoading('carts-' + Page.getCartId() + '-items-' + product.item_id);
        } else {
            return API.isLoading('guest-carts-' + Page.getGuestCartId() + '-items-' + product.item_id);
        }
    };
}).controller('NewsLetterController', function (API, $scope, $mdToast, Page) {
    this.email = null;
    this.isLoading = function () {
        return API.isLoading('newsletter');
    };
    this.addSubscription = function () {
        API.getAPIRequest()
            .setPostmethod()
            .setData({email: this.email})
            .setOnSuccess(function () {
                Page.setSuccessMessage('You have successfully subscribed to the newsletter!');
            })
            .execute('/newsletter/new', 'newsletter');
    }
}).controller('ProductsController', function ($http, $scope, API, APIQuery, Page, Modal, $stateParams) {
    this.getNewArrivals = function () {
        $scope.$on('onRepeatLast', function (scope, element, attrs) {
            $("#productslider").owlCarousel({
                navigation: true,
                items: 4,
                itemsTablet: [768, 2]
            });
        });
        if ($scope.getData('new_arrivals') === undefined) {
            var myObject = {
                searchCriteria: {
                    sortOrders: [
                        {
                            field: 'created_at',
                            direction: 'asc'
                        }
                    ],
                    pageSize: 10
                }
            };
            API.getAPIRequest()
                .execute('/products?' + $.param(myObject), 'new_arrivals');
        }
        return $scope.getData("new_arrivals", "items")
    };
    this.isUserLoggedIn = function () {
        return (Page.getToken() !== null);
    };
    this.getFeaturedProducts = function () {
        if ($scope.getData('featured_products') === undefined) {
            var myObject = {
                searchCriteria: {
                    filterGroups: [
                        {
                            filters: [
                                {
                                    field: 'featured',
                                    value: 1
                                }
                            ]
                        }
                    ],
                    pageSize: 10
                }
            };
            API.getAPIRequest()
                .execute('/products?' + $.param(myObject), 'featured_products');
        }
        return $scope.getData("featured_products", "items")
    };
    this.isProductVisible = function (product) {
        if ($scope.visible_products === undefined) {
            $scope.visible_products = 3;
        }
        if ($scope.getData("featured_products", "items") !== undefined) {
            for (var x = 0; x < $scope.getData("featured_products", "items").length; x++) {
                if ($scope.getData("featured_products", "items")[x].id == product.id && $scope.visible_products >= x) {
                    return true;
                }
            }
        }
        return false;
    };
    this.isNew = function (product) {
        function daydiff(created) {
            var now = new Date();
            var date = created.split(' ');
            var mdy = date[0].split('-');
            var second = new Date(mdy[0], mdy[1] - 1, mdy[2]);
            return Math.round((now - second) / (1000 * 60 * 60 * 24));
        }

        var diff = daydiff(product.created_at);
        //show new if the product is created within 15 days
        return (diff < 15);
    };
    this.getOffer = function (product) {
        return this.getProductAttribute(product, 'offer');
    };

    this.loadMoreProducts = function () {
        $scope.visible_products += 4;
    };
    this.hasMoreProducts = function () {
        return ($scope.getData("featured_products", "items") !== undefined && $scope.getData("featured_products", "items").length >= $scope.visible_products)
    };
    this.getProductAttribute = function (product, code) {
        if (product !== undefined) {
            for (var x = 0; x < product.custom_attributes.length; x++) {
                if (product.custom_attributes[x].attribute_code == code) {
                    return product.custom_attributes[x].value;
                }
            }
        }
    };
    this.getProductImage = function (product, size) {
        var images = this.getProductAttribute(product, 'image');

        return this.getImageSize(images, size);
    };
    this.getImages = function (product) {
        var images = [];
        if ((product !== undefined) && product.media_gallery_entries !== undefined) {
            for (var k in product.media_gallery_entries) {
                images.push(product.media_gallery_entries[k].file);
            }
        }
        return images;
    };
    this.getImageSize = function (images, size) {
        var sizes = {'original': 0, 'large': 1, 'medium': 2, 'small': 3, 'thumbnail': 4};
        return images[sizes[size]];
    }

    this.getCartCurrency = function () {
        return $scope.getData("guest_cart_totals", "base_currency_code")
    };
    this.addToWishlist = function (product) {
        if (this.isUserLoggedIn()) {
            API.getAPIRequest()
                .setPostmethod()
                .setData({product_id: product.id})
                .setOnSuccess(function () {
                    Page.setSuccessMessage('this product has been added to the wishlist!');
                })
                .execute('/wishlist/new', 'wishlist-' + product.id);
        } else {
            Page.setErrorMessage("Please login before you add this item to the wishlist!");
        }
    };
    this.addToCart = function (product) {
        if (this.isUserLoggedIn()) {
            API.getAPIRequest()
                .setPostmethod()
                .setData({cartItem: {sku: product.sku, qty: 1, price: product.price, quoteId: Page.getCartId()}})
                .setOnSuccess(function () {
                    Page.setSuccessMessage('this product has been added to the cart!');
                    $scope.resetData('carts-' + Page.getCartId() + '-items');
                    $scope.resetData('cart_totals.grand_total');
                })
                .execute('/carts/items', 'carts-items-' + product.id);

        } else {
            API.getAPIRequest()
                .setPostmethod()
                .setData({cartItem: {sku: product.sku, qty: 1, price: product.price, quoteId: Page.getGuestCartId()}})
                .setOnSuccess(function () {
                    Page.setSuccessMessage('this product has been added to the cart!');
                    $scope.resetData('guest-carts-' + Page.getGuestCartId() + '-items');
                    $scope.resetData('guest_cart_totals', 'grand_total');
                })
                .execute('/guest-carts/' + Page.getGuestCartId() + '/items', 'guest-carts-items-' + product.id);
        }
    };

    this.isLoading = function (product) {
        if (this.isUserLoggedIn()) {
            return (product !== undefined) && API.isLoading('carts-items-' + product.id);
        } else {
            return (product !== undefined) && API.isLoading('guest-carts-items-' + product.id);
        }
    };
    this.isWishlistLoading = function (product) {
        return (product !== undefined) && API.isLoading('wishlist-' + product.id);
    };
    this.openProductModal = function (product) {
        var onLoad = function () {
            loadProductDetails();
        };
        Modal.loadTemplate('product', {product: product}, onLoad);
    };
    this.getProduct = function () {
        if ($scope.getData('product-' + $stateParams.sku) === undefined) {
            API.getAPIRequest()
                .execute('/products/' + $stateParams.sku, 'product-' + $stateParams.sku);
        }
        return $scope.getData('product-' + $stateParams.sku);
    };
    this.getProductLinks = function (product, type) {
        $scope.$on('onRepeatLast', function (scope, element, attrs) {
            if ($scope.product_link_loaded === undefined) {
                console.log('YOU MAY ALSO LIKE');
                // YOU MAY ALSO LIKE  carousel
                $(".ProductSlider").owlCarousel({
                    navigation: true
                });
                $scope.product_link_loaded = true;
            }
        });
        return APIQuery.getProductLinks(product, type);
    }
}).controller('DialogController', function ($scope, $mdDialog, dataToPass, onLoad) {
    $scope.$evalAsync(function () {
        if (typeof onLoad === "function") {
            setTimeout(function () {
                //onload
                onLoad();
            }, 1);
        }
    });
    //parse the values to scope
    for (var key in dataToPass) {
        $scope[key] = dataToPass[key];
    }
    $scope.hide = function () {
        $mdDialog.hide();
    };
    $scope.cancel = function () {
        $mdDialog.cancel();
    };
    $scope.answer = function (answer) {
        $mdDialog.hide(answer);
    };
});