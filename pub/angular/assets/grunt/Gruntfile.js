module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n',
                sourceMap: true,
                mangle: false
            },
            grocery_bag_dist: {
                src: [
                    '../js/jquery/jquery-1.10.1.min.js',
                    '../bootstrap/js/bootstrap.min.js',
                    '../js/template/idangerous.swiper-2.1.min.js',
                    '../js/template/jquery.cycle2.min.js',
                    '../js/template/jquery.easing.1.3.js',
                    '../js/template/jquery.parallax-1.1.js',
                    '../js/helper-plugins/jquery.mousewheel.min.js',
                    '../js/template/jquery.mCustomScrollbar.js',
                    '../js/ion-checkRadio/ion.checkRadio.min.js',
                    '../js/template/grids.js',
                    '../js/template/owl.carousel.min.js',
                    '../js/template/jquery.minimalect.min.js',
                    '../js/template/bootstrap.touchspin.js',
                    '../js/template/smoothproducts.js',
                    '../js/template/hideMaxListItem-min.js',
                    '../js/template/jquery.scrollme.min.js',
                    '../js/template/home.js',
                    '../js/template/catalog.js',
                    '../js/template/script.js',
                    '../js/template/helper.js',
                    '../js/vendor/lodash.js',
                    '../js/vendor/hammer.js',
                    '../js/vendor/jquery.hammer.js',
                    '../js/vendor/wptr.1.1.js',
                    '../js/vendor/imgcache.js',
                    '../js/vendor/bootstrap.js',
                    '../js/vendor/offcanvas.js',
                    '../js/vendor/plugins.js',
                    '../plugins/angular-1.4.8/angular.js',
                    '../plugins/angular-1.4.8/angular-resource.js',
                    '../plugins/angular-1.4.8/angular-route.js',
                    '../plugins/angular-1.4.8/angular-animate.js',
                    '../plugins/angular-1.4.8/angular-messages.js',
                    '../js/vendor/angular-storage.js',
                    '../js/vendor/angular-ui-router.js',
                    '../js/vendor/angular-google-maps.js',
                    '../js/vendor/angular-imgcache.js',
                    '../js/vendor/angular-facebook.js',
                    '../js/vendor/angular-facebook-phonegap.js',
                    '../js/vendor/facebookConnectPlugin-angular.js',
                    '../js/vendor/angularfire.min.js',
                    '../js/vendor/ng-polymer-elements-0.3.0/ng-polymer-elements.js',
                    '../js/vendor/angular-aria.min.js',
                    '../js/vendor/angular-material.js',
                    '../js/binders.js'
                ],
                dest: '../js/javascript.min.js'
            }
        },
        watch: {
            grocery_bag_watch: {
                files: ['../js/template/*.js'],
                tasks: ['uglify:grocery_bag_dist']
            }
        }
    })
    ;
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('default', ['uglify']);
};