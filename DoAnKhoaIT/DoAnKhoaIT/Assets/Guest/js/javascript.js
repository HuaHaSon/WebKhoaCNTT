/* 
 * APP3S
 * Author  :   tuanlm
 * Date    :   30, 11, 2015
 */
$(function () {
    $('#tab-responsive').tabCollapse();
    $(document).on("shown.bs.collapse shown.bs.tab", ".panel-collapse, a[data-toggle='tab']", function (e) {
        if ($(".page-content .container").width() < 750) {
            $('html,body').animate({scrollTop: $(this).parent('div').offset().top}, 500);
        }
    });
    $(document).on("mouseover", ".main-menu .dropdown", function () {
        if ($(".page-content .container").width() >= 970) {
            $(this).addClass("open");
        }
    });
    $(document).on("mouseleave", ".main-menu .dropdown", function () {
        if ($(".page-content .container").width() >= 970) {
            $(this).removeClass("open");
        }
    });
    /*  slide show          */
    $('#owl-slide-show').owlCarousel({
        loop: true,
        autoplayHoverPause: true,
        dots: true,
        autoplay: true,
        autoplaySpeed: 1000,
        autoplayTimeout: 5000,
        responsive: {
            0: {
                items: 1
            }
        }
    });
    $('.scrollbar-inner').scrollbar();
    /* cooperate slide      */
    var iuhSlide = $("#owl-iuh");
    iuhSlide.owlCarousel({
        autoplayHoverPause: true,
        loop: true,
        autoplay: true,
        autoplayTimeout: 5000,
        responsive: {
            0: {
                items: 2
            },
            600: {
                items: 3
            },
            992: {
                items: 5
            }
        }
    });
    $(".cooperate-next").click(function () {
        iuhSlide.trigger('next.owl.carousel');
    });
    $(".cooperate-prev").click(function () {
        iuhSlide.trigger('prev.owl.carousel');
    });
    $(".cooperate-button").on("mouseover", function () {
        iuhSlide.trigger('stop.owl.autoplay');
    });
    $(".cooperate-button").on("mouseout", function () {
        iuhSlide.trigger('play.owl.autoplay');
    });
    /* menu fixed       */
    $('.header-menu').addClass('menu-original').clone().insertAfter('.header-menu').addClass('menu-fixed').removeClass('menu-original');
    $('.menu-fixed').find('#collapse-search').attr('id', 'collapse-search-fixed');
    $('.menu-fixed').find('.navbar-search').attr('data-target', '#collapse-search-fixed');
    $('.menu-fixed').find('#collapse-menu').attr('id', 'collapse-menu-fixed');
    $('.menu-fixed').find('.navbar-menu').attr('data-target', '#collapse-menu-fixed');
    $(window).scroll(function () {
        // menu scroll fix
        var menuOnTop = $('.header-menu').offset().top - $(window).scrollTop();
        if (menuOnTop <= 0) {
            $('.scroll-top').fadeIn();
            $('.menu-fixed').addClass('active');
        } else {
            $('.scroll-top').fadeOut();
            $('.menu-fixed').removeClass('active');
        }
        return false;
    });

    //  Multi menu custom
    $('.dropdown-menu').on('click', '.dropdown > a', function () {
        $(this).parent('.dropdown').toggleClass('open');
        return false;
    });

    //  box scroll fix
    $('.page-right').children('div:not(".clearfix"):last').addClass('box-fixed');
    $(".box-fixed").stick_in_parent({
        parent: ".content-bottom",
        offset_top: 46
    });

    // TODO: Add any custom classes with 'position: fixed' to the selector below
    var fixedCls = '.menu-fixed';
    var oldSSB = $.fn.modal.Constructor.prototype.setScrollbar;
    $.fn.modal.Constructor.prototype.setScrollbar = function () {
        oldSSB.apply(this);
        if (this.bodyIsOverflowing && this.scrollbarWidth)
            $(fixedCls).css('padding-right', this.scrollbarWidth);
    };

    var oldRSB = $.fn.modal.Constructor.prototype.resetScrollbar;
    $.fn.modal.Constructor.prototype.resetScrollbar = function () {
        oldRSB.apply(this);
        $(fixedCls).css('padding-right', '');
    };

    $('.scroll-top').on('click', function () {
        $('html, body').animate({scrollTop: 0}, 500);
        return false;
    });
});
