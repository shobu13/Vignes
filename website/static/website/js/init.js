$(document).ready(function () {
    $('.parallax').parallax();
    $(".owl-carousel").owlCarousel(
        {
            items: 1,
            loop: true,
            margin: 10,
            autoplay: true,
            autoplayTimeout: 3000,
            autoplayHoverPause: true,
            video:true,
        }
    );
});
