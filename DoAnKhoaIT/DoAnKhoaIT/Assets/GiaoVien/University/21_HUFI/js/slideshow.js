$(document).ready(function () {
    var owl = $("#owl-demo");
    owl.owlCarousel({
        navigation: true, // Show next and prev buttons
        slideSpeed: 300,
        autoHeight: true,
        paginationSpeed: 400,
        singleItem: true,
        autoPlay: 4000,
        pagination: true,
        navigation: false,
      //  navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
    });

    //slider doi tac lien ket
    var owl = $("#owl-partner");

    owl.owlCarousel({
        items: 3,
        itemsCustom: [
          [0, 2],
          [450, 2],
          [600, 3],
          [700, 3],
          [768, 3],
          [1000, 5],
          [1200, 5],
          [1400,5],
          [1600, 5]
        ],
        autoPlay: 4000,
        pagination: false,
        navigation: false,
        //navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
    });
    $(".next").click(function () {
        owl.trigger('owl.next');
    })
    $(".prev").click(function () {
        owl.trigger('owl.prev');
    })

    //slider hình ảnh hoạt động
    var owl_action = $("#owl-action");

    owl_action.owlCarousel({
        singleItem:true,
        autoPlay: false,
        pagination: false,
        navigation: false,
    });
    $(".next-action").click(function () {
        owl_action.trigger('owl.next');
    })
    $(".prev-action").click(function () {
        owl_action.trigger('owl.prev');
    })

    //Tin tức liên quan
    var owl_tinlienquan = $("#owl-tinlienquan");

    owl_tinlienquan.owlCarousel({
        singleItem: true,
        autoPlay: false,
        pagination: false,
        navigation: false,
    });
    $(".next-tinlienquan").click(function () {
        owl_tinlienquan.trigger('owl.next');
    })
    $(".prev-tinlienquan").click(function () {
        owl_tinlienquan.trigger('owl.prev');
    })
});