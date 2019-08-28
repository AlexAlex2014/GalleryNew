$(document).ready(function() {
    function heightDetect() {
        $(".main_head").css("height", $(window).height());
    };

    heightDetect();
    $(window).resize(function() {
      heightDetect();
    });

    $(".toggle_mnu").on('click', function() {
        $(".sandwich").toggleClass("active");
    });

    $(".top_mnu ul a").on('click', function() {
        $(".top_mnu").fadeOut(600);
        $(".sandwich").toggleClass("active");
    });

    $(".toggle_mnu").on('click', function () {
        if ($(".top_mnu").is(":visible")) {
            $(".top_mnu").fadeOut(600);
            $(".top_mnu li a").removeClass("fadeInUp animated")
        } else {
            $(".top_mnu").fadeIn(600);
            $(".top_mnu li a").addClass("fadeInUp animated")
        };
    });
});

// $(window).on('load', function() {
//   $(".loader_inner").fadeOut();
//   $(".loader").delay(400).fadeOut("slow");
// });
