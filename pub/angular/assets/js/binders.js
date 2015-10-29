$(document).ready(function () {
    onDeviceReady();
});

//location.pathname
function onDeviceReady() {
    $('body.loading').removeClass('loading');
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