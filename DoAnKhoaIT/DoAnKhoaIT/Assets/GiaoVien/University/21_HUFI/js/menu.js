$(document).ready(function () {
    $('#header__icon').click(function (e) {
        e.preventDefault();
        $('body').toggleClass('with--sidebar');
    });

    $('#site-cache').click(function (e) {
        $('body').removeClass('with--sidebar');
    });

    $(".fa-angle-right").click(function () {
        // kiểm tra mũi tên xổ xuống
        if ($(this).hasClass("fa-angle-right")) {
            $(this).removeClass("fa-angle-right").addClass("fa-angle-down");
        }
        else {
            $(this).removeClass("fa-angle-down").addClass("fa-angle-right");
        }

        // sự kiện menu xổ xuống
        $(this).next("ul").slideToggle();

        // đóng các menu đang xổ khi click menu kế tiếp
        var close_ul = $(this).parent().siblings().find("ul");

        var node = $(this).parent().siblings().find("i");
        if (node.hasClass("fa-angle-down")) {
            console.log("down");
            node.removeClass("fa-angle-down").addClass("fa-angle-right");
        }
        
        close_ul.slideUp("500");
    })
});