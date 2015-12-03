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
                    execute: function (url, key, append) {
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
                                    if (response.items !== undefined && append) {
                                        //want to append but theres no data
                                        if ($rootScope.data[key] !== undefined && append) {
                                            for (var k in response.items) {
                                                for (var k1 in $rootScope.data[key]) {
                                                    if ($rootScope.data[key][k1] !== response.items[k]) {
                                                        $rootScope.data[key].push(response.items[k]);
                                                    }
                                                }
                                            }
                                        } else {
                                            $rootScope.data[key] = response.items;
                                        }
                                    } else {
                                        $rootScope.data[key] = response;
                                    }
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
                var db_products = $rootScope.getData('products');
                for (var k in skus) {
                    for (var k_1 in db_products) {
                        if (db_products[k_1].sku == skus[k]) {
                            products.push(db_products[k_1]);
                            skus.splice(k, 1);
                        }
                    }
                }
                if (skus.length > 0) {
                    var searchObject = {
                        searchCriteria: {
                            filterGroups: [
                                {
                                    filters: [
                                        {
                                            field: 'sku',
                                            value: skus,
                                            conditionType: 'in'
                                        }
                                    ]
                                }
                            ]
                        }
                    };
                    API.getAPIRequest()
                        .execute('/products?' + $.param(searchObject), 'products', true);
                }
                return products;
            }
        }
    });