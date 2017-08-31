$(function() {
    winW = $(window).width();
    spped = 3000;
    $('#horizon4').css({
        left: winW / 2
    }).animate({
        left: 0,
        width: winW
    }, spped);
});
