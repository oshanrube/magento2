angular.module('app.controllers.catalog', [])
    .controller('CatalogController', function ($scope, $stateParams, API, APIQuery, Page, Modal) {
        this.catalog = null;
        $scope.filters = [];
        this.getCatalog = function () {
            if ($scope.getData('catalog-' + $stateParams.id) === undefined) {
                API.getAPIRequest()
                    .execute('/categories/' + $stateParams.id, 'catalog-' + $stateParams.id);
            }
            return $scope.getData('catalog-' + $stateParams.id);
        };
        this.getFilters = function () {
            if ($scope.getData('products-attributes', 'items') === undefined) {
                var myObject = {
                    searchCriteria: {
                        filterGroups: [
                            {
                                filters: [
                                    {
                                        field: 'is_searchable',
                                        value: 1
                                    }
                                ]
                            }
                        ],
                        pageSize: 10
                    }
                };

                API.getAPIRequest()
                    .execute('/products/attributes?' + $.param(myObject), 'products-attributes');
            }
            return $scope.getData('products-attributes', 'items');
        };
        this.getName = function () {
            return (this.getCatalog() ? this.getCatalog().name : 'Loading...');
        };
        this.getProducts = function () {
            if ($scope.getData('catalog-' + $stateParams.id + '-products') === undefined) {
                API.getAPIRequest()
                    .execute('/categories/' + $stateParams.id + '/products', 'catalog-' + $stateParams.id + '-products');
            } else {
                var skus = [];
                for (var key in $scope.getData('catalog-' + $stateParams.id + '-products')) {
                    skus.push($scope.getData('catalog-' + $stateParams.id + '-products')[key].sku);
                }
                return APIQuery.getProducts(skus);
            }
            return;
        };
    })
    .controller('CatalogFilterController', function ($scope, $stateParams, API, APIQuery, Page, Modal) {
        this.filterBy = function (value, index, array) {
            var product_filters = $scope.getData('products-attributes', 'items');
            var response = true;
            for (var key in $scope.filters) {
                for (var k = 0; k < product_filters.length; k++) {
                    if (key == product_filters[k].attribute_code) {
                        var attr_value = $scope.filters[key];
                        switch (product_filters[k].frontend_input) {
                            case 'price':
                                if (!((attr_value['min'] == undefined || array[index].price >= attr_value['min']) && (attr_value['max'] == undefined || array[index].price <= attr_value['max']))) {
                                    return false;
                                }
                                break;
                            case 'text':
                            case 'textarea':
                                if (array[index][key] !== undefined) {
                                    var re = new RegExp(attr_value, 'i');
                                    if (!array[index][key].match(re)) {
                                        return false;
                                    }
                                } else {
                                    //custom attributes
                                    for (var k_1 = 0; k_1 < array[index].custom_attributes.length; k_1++) {
                                        if (array[index].custom_attributes[k_1].attribute_code == key) {
                                            var re = new RegExp(attr_value, 'i');
                                            if (!array[index][key].match(re)) {
                                                return false;
                                            }
                                        }
                                    }
                                }

                                break;
                            case 'select':
                                if (array[index][key] !== undefined) {
                                    if (array[index][key] != attr_value) {
                                        return false;
                                    }
                                } else {
                                    //custom attributes
                                    for (var k_1 = 0; k_1 < array[index].custom_attributes.length; k_1++) {
                                        if (array[index].custom_attributes[k_1].attribute_code == key) {
                                            if (array[index].custom_attributes[k_1].value != attr_value) {
                                                return false;
                                            }
                                        }
                                    }
                                }
                                break;
                            default:
                                console.log('no filter mentioned for ' + key);
                                break;
                        }
                    }
                }
            }
            return response;
        };
        $scope.loadFilterValues = function (filter, products) {
            switch (filter.attribute_code) {
                case 'price':
                    var min = 0;
                    var max = 0;
                    if (products) {
                        for (var x = 0; x < products.length; x++) {
                            if (x == 0) {
                                min = products[x].price;
                                max = products[x].price;
                            } else {
                                min = Math.min(min, products[x].price);
                                max = Math.max(max, products[x].price);
                            }
                        }
                    }
                    return {min: min, max: max};
                    break;
            }
        };
        this.getMin = function (filter, products) {
            var limits = $scope.loadFilterValues(filter, products);
            return limits['min'];
        };

        this.getMax = function (filter, products) {
            var limits = $scope.loadFilterValues(filter, products);
            return limits['max'];
        };

        $scope.filterByText = function (key, value, array, index) {
            return array[index][key].search(value);
        };

        $scope.filterBySelect = function (key, value, array, index) {
            return array[index][key].search(value);
        }
    });
