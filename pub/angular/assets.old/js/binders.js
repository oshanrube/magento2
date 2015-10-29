$(document).ready(function () {
    if (!isPhonegap()) {
        //onDeviceReady();
        // Create the event
        var event = new CustomEvent("deviceready", { "detail": "Example of an event" });
        // Dispatch/Trigger/Fire the event
        document.dispatchEvent(event);
    }
});

//location.pathname
function onDeviceReady() {
//    $.event.special.swipe.scrollSupressionThreshold = (screen.availWidth) / 10;  // (default: 10) (pixels) – More than this horizontal displacement, and we will suppress scrolling.
//    $.event.special.swipe.horizontalDistanceThreshold = (screen.availWidth) / 30; // (default: 30) (pixels) – Swipe horizontal displacement must be less than this.
//    $.event.special.swipe.verticalDistanceThreshold = (screen.availHeight) / 75; // (default: 75) (pixels) – Swipe vertical displacement must be less than this.
//    $.event.special.swipe.durationThreshold = 1000; // (default: 1000) (milliseconds) – More time than this, and it isn't a swipe.

    $('body.loading').removeClass('loading');
//    $("body").swiperight(function () {
//        console.log('right');
//        if ($('#rightNavMenu').hasClass('in')) {
//            $('#rightMenuLink').trigger('click');
//        } else {
//            if (!$('#leftNavMenu').hasClass('in')) {
//                $('#leftMenuLink').trigger('click');
//            }
//        }
//    }).swipeleft(function () {
//        console.log('left');
//        if ($('#leftNavMenu').hasClass('in')) {
//            $('#leftMenuLink').trigger('click');
//        } else {
//            if (!$('#rightNavMenu').hasClass('in')) {
//                $('#rightMenuLink').trigger('click');
//            }
//        }
//    });

//    var hammertime = new Hammer($('body'), {});
//    hammertime.on('swipe', function(ev) {
//        console.log(ev);
//    });

    $("body").hammer().on('swipeleft',function () {
        if ($('#leftNavMenu').hasClass('in')) {
            $('#leftMenuLink').trigger('click');
        } else {
            if (!$('#rightNavMenu').hasClass('in')) {
                $('#rightMenuLink').trigger('click');
            }
        }
    }).on('swiperight', function () {
        if ($('#rightNavMenu').hasClass('in')) {
            $('#rightMenuLink').trigger('click');
        } else {
            if (!$('#leftNavMenu').hasClass('in')) {
                $('#leftMenuLink').trigger('click');
            }
        }
    });

    $('#leftNavMenu a,#rightNavMenu a').click(function () {
        //close the left and right menus
        if ($('#leftNavMenu').hasClass('in')) {
            $('#leftMenuLink').trigger('click');
        }
        if ($('#rightNavMenu').hasClass('in')) {
            $('#rightMenuLink').trigger('click');
        }
    });
}
function isPhonegap() {
    return (typeof cordova !== 'undefined' || typeof phonegap !== 'undefined');
};