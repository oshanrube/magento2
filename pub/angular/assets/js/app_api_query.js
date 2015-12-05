angular.module('app.api_query', [])
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
                    execute: function (url, key, exclude) {
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
                                    if (!exclude) {
                                        $rootScope.data[key] = response;
                                    }
                                    if (onsuccess !== null) {
                                        onsuccess(response);
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
    .factory("APIQuery", function ($http, $rootScope, API) {
        return {
            getProductLinks: function (product, type) {
                var product_links = [];
                if (product && product.product_links) {
                    var skus = [];
                    for (var k in product.product_links) {
                        if (product.product_links[k].link_type == type) {
                            skus.push(product.product_links[k].linked_product_sku);
                        }
                    }

                    product_links = this.getProducts(skus);
                }
                return product_links;
            }, getProducts: function (skus) {
                var products = [];
                var sku_search = [];
                for (var k = 0; k < skus.length; k++) {
                    if ($('#products #' + skus[k]).length) {
                        products.push($('#products #' + skus[k]).data());
                    } else {
                        sku_search.push(skus[k]);
                    }
                }

                if (sku_search.length > 0) {
                    var searchObject = {
                        searchCriteria: {
                            filterGroups: [
                                {
                                    filters: [
                                        {
                                            field: 'sku',
                                            value: sku_search,
                                            conditionType: 'in'
                                        }
                                    ]
                                }
                            ]
                        }
                    };
                    API.getAPIRequest()
                        .setOnSuccess(function (response) {
                            //want to append but theres no data
                            for (var k in response.items) {
                                if (!$('#products #' + response.items[k].sku).length) {
                                    //create
                                    $('#products').append($('<div id="' + response.items[k].sku + '"></div>').data(response.items[k]));
                                }
                            }
                        })
                        .execute('/products?' + $.param(searchObject), 'products', true);
                }
                return (products.length == 0 && sku_search.length > 0 ? undefined : products);
            }, getProduct: function (sku) {
                //lazy load


                if ($('#products #' + sku).length) {
                    return $('#products #' + sku).data();
                } else {
                    console.log('lazy load' + sku);
                    API.getAPIRequest()
                        .setOnSuccess(function (response) {
                            //want to append but theres no data
                            if (!$('#products #' + response.sku).length) {
                                //create
                                $('#products').append($('<div id="' + response.sku + '"></div>').data(response));
                            } else {
                                $('#products #' + response.sku).data(response);
                            }
                        })
                        .execute('/products/' + sku, 'product-' + sku);
                }
            }
        }
    });