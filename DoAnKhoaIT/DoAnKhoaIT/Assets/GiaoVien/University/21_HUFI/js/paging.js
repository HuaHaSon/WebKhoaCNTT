jQuery(document).ready(function () {
    $('.pagination a').click(function () {
        var id_cate = $(this).attr('rel');
        var page = $(this).text();
        var className = ".box-news-" + id_cate + " .list-paging";
        var classNamePage = ".box-news-" + id_cate;
        $(classNamePage + ' .pagination a').removeClass('current').removeAttr("style");
        $(this).addClass('current');
        $.ajax({
            url: "/WebTinTuc/PhanTrangTinTuc",
            type: 'GET',
            dataType: 'html',
            data: 'id=' + id_cate + '&page=' + page + '&take=' + sotin + '&viewName=ListTinTuc_Paging',
            success: function (data) {
                $(className).html(data);
            }
        });
    });
});