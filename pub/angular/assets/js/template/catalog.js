function loadCatalog() {
    var isMobile = function () {
        //console.log("Navigator: " + navigator.userAgent);
        return /(iphone|ipod|ipad|android|blackberry|windows ce|palm|symbian)/i.test(navigator.userAgent);
    };

    if (isMobile()) {
        // For  mobile , ipad, tab
        $('.animateme').removeClass('animateme');
        $('.category-wrapper').addClass('ismobile');
        $('.main-container-wrapper').addClass('ismobile');
        $('#category-intro').addClass('ismobile');

    } else {
    }
    //change the view in catalog page
    // List view and Grid view
    $(".change-view .list-view, .change-view-flat .list-view").click(function (e) { //use a class, since your ID gets mangled
        e.preventDefault();
        $('.item').addClass("list-view"); //add the class to the clicked element
        $('.add-fav').attr("data-placement", $(this).attr("left"));
        $('.categoryProduct > .item').detectGridColumns();
    });
    $(".change-view .grid-view, .change-view-flat .grid-view").click(function (e) { //use a class, since your ID gets mangled
        e.preventDefault();
        $('.item').removeClass("list-view"); //add the class to the clicked element
        $('.categoryProduct > .item').detectGridColumns();
        setTimeout(function () {
                //  reload function after 0.5 second
                $('.categoryProduct > .item').responsiveEqualHeightGrid();
            }
            , 500);

    });
    //END
    $('.shrtByP a').click(function () {
        $('.shrtByP a').removeClass('active');
        $(this).addClass('active');
    });


    $('.filterToggle').click(function () {
        $(this).toggleClass('filter-is-off');
        $('.filterToggle span').toggleClass('is-off');
        $('.catColumnWrapper').toggleClass('filter-is-off');
        $('.catColumnWrapper .col-sm-4').toggleClass('col-sm-3 col-lg-3 col-md-3');

        // equal height reload function

        var $elements = $('.categoryProduct > .item');
        var columns = $elements.detectGridColumns();
        $elements.equalHeightGrid(columns);
        setTimeout(function () {
                //  reload function after 0.5 second
                $('.categoryProduct > .item').responsiveEqualHeightGrid();
            }
            , 500);
    });


    $('[data-toggle="collapse"]').click(function (e) {

        $('#accordion').on('show.bs.collapse', function (e) {
            $(e.target).prev().addClass('active').find('span').removeClass('hasPlus').addClass('hasMinus');
        });
        $('#accordion').on('hide.bs.collapse', function (e) {
            $(e.target).prev().addClass('active').find('span').addClass('hasPlus').removeClass('hasMinus');

        });
        e.preventDefault();
    });


    $(window).bind('resize load', function () {
        if ($(this).width() < 767) {
            $('#accordion .panel-collapse').collapse('hide');

            $('#accordion .panel-heading ').find('span').removeClass('hasMinus').addClass('hasPlus');

        } else {
            $('#accordion .panel-collapse').removeClass('out').addClass('in').css('height', 'auto');
            $('#accordion .panel-heading ').find('span').removeClass('hasPlus').addClass('hasMinus');


        }
    });
}