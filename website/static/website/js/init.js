$(document).ready(function () {
    $('.parallax').parallax();
    $('.carousel.carousel-slider.card').carousel({
        fullWidth: true,
        indicators: true
    });
    $('.carousel.carousel-slider.front').carousel({
        fullWidth: false,
        indicators: true
    });
});
