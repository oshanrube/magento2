function loadProductPage() {
    //add the frame to the page
    $(".sp-wrap").append('<div class="sp-large"></div>' +
        '<div class="sp-thumbs sp-tb-active"></div>');
    //move the link to the thumbnail
    $(".sp-wrap a").appendTo(".sp-thumbs");
    //make the 1st one to tbe current
    $(".sp-thumbs a:first")
        .addClass("sp-current").clone().removeClass("sp-current").appendTo(".sp-large");
    $(".sp-wrap").css("display", "inline-block");
    var slideTiming = 300;
    $(".sp-thumbs").on("click", function (e) {
        e.preventDefault()
    });
    $(".sp-tb-active a").on("click", function (e) {
        $(".sp-current").removeClass();
        $(".sp-thumbs").removeClass("sp-tb-active");
        $(".sp-zoom").remove();
        var t = $(".sp-large").height();
        $(".sp-large").css({overflow: "hidden", height: t + "px"});
        $(".sp-large a").remove();
        $(this).addClass("sp-current")
            .clone()
            .hide()
            .removeClass("sp-current")
            .appendTo(".sp-large")
            .fadeIn(slideTiming, function () {
                var e = $(".sp-large img").height();
                $(".sp-large").height(t).animate({height: e}, "fast", function () {
                    $(".sp-large").css("height", "auto")
                });
                $(".sp-thumbs").addClass("sp-tb-active")
            });
        loadImageZoom();
        e.preventDefault()
    });

    var loadImageZoom = function () {
        $(".sp-large a").on("click", function (e) {
            var t = $(this).attr("href");
            $(".sp-large").append('<div class="sp-zoom"><img src="' + t + '"/></div>');
            $(".sp-zoom").fadeIn();
            $(".sp-large").css({left: 0, top: 0});

            $(".sp-zoom").on("click", function (e) {
                $(this).fadeOut(function () {
                    $(this).remove()
                })
            });
            e.preventDefault()
        });
    }
    loadImageZoom();

    $(".sp-large").mousemove(function (e) {
        var t = $(".sp-large").width();
        var n = $(".sp-large").height();
        var r = $(".sp-zoom").width();
        var i = $(".sp-zoom").height();
        var s = $(this).parent().offset();
        var o = e.pageX - s.left;
        var u = e.pageY - s.top;
        var a = Math.floor(o * (t - r) / t);
        var f = Math.floor(u * (n - i) / n);
        $(".sp-zoom").css({left: a, top: f})
    }).mouseout(function () {
    });
    // customs select by minimalect
    $("select").minimalect();
}