var baidang = {
    init: function () {
        baidang.RegisterEvents()
    },
    RegisterEvents: function () {
        //$('#btnimage').on('click', function () {
        //    var finder = new CKFinder();
        //    finder.selectActionFunction = function (url) {
        //        $('#txtimage').val(url);
        //    };
        //    finder.popup();
        //})

        var baidangadd = CKEDITOR.replace('baidangadd_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var baidangedit = CKEDITOR.replace('baidangedit_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });

        $(document).ready(function () {
            var table = $('#baidangTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [9],
                        "searchable": false,
                        "ordering": false
                    }
                ],
                "pagingType": "full_numbers",
                "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                "language": {
                    "lengthMenu": "Hiển thị _MENU_",
                    "zeroRecords": "Không tìm thấy thông tin",
                    "info": "Hiển thị _PAGE_ trên _PAGES_",
                    "infoEmpty": "Không tìm thấy dữ liệu",
                    "infoFiltered": "(tìm kiếm trong _MAX_ hàng)",
                    "paginate": {
                        "first": "Đầu",
                        "last": "Cuối",
                        "next": "Tiếp",
                        "previous": "Trước"
                    },
                }

            });
            var table2 = $('#loaibaidangTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [3],
                        "searchable": false,
                        "ordering": false
                    }
                ],
                "pagingType": "full_numbers",
                "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                "language": {
                    "lengthMenu": "Hiển thị _MENU_",
                    "zeroRecords": "Không tìm thấy thông tin",
                    "info": "Hiển thị _PAGE_ trên _PAGES_",
                    "infoEmpty": "Không tìm thấy dữ liệu",
                    "infoFiltered": "(tìm kiếm trong _MAX_ hàng)",
                    "paginate": {
                        "first": "Đầu",
                        "last": "Cuối",
                        "next": "Tiếp",
                        "previous": "Trước"
                    },
                }

            });
            var table3 = $('#tagidTable').DataTable({
                "order": [[0, "asc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [4],
                        "searchable": false,
                        "ordering": false
                    }
                ],
                "pagingType": "full_numbers",
                "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                "language": {
                    "lengthMenu": "Hiển thị _MENU_",
                    "zeroRecords": "Không tìm thấy thông tin",
                    "info": "Hiển thị _PAGE_ trên _PAGES_",
                    "infoEmpty": "Không tìm thấy dữ liệu",
                    "infoFiltered": "(tìm kiếm trong _MAX_ hàng)",
                    "paginate": {
                        "first": "Đầu",
                        "last": "Cuối",
                        "next": "Tiếp",
                        "previous": "Trước"
                    },
                }
            });
            $('#tbaidang.toggle-vis').on('click', function (e) {
                e.preventDefault();
                if ($(this).hasClass("text-danger")) {
                    $(this).removeClass('text-danger');
                    $(this).addClass('text-info');
                } else {
                    $(this).removeClass('text-info');
                    $(this).addClass('text-danger');
                }
                // Get the column API object
                var column = table.column($(this).attr('data-column'));

                // Toggle the visibility
                column.visible(!column.visible());
            });
            $('#tloaibaidang.toggle-vis').on('click', function (e) {
                e.preventDefault();
                if ($(this).hasClass("text-danger")) {
                    $(this).removeClass('text-danger');
                    $(this).addClass('text-info');
                } else {
                    $(this).removeClass('text-info');
                    $(this).addClass('text-danger');
                }

                // Get the column API object
                var column = table2.column($(this).attr('data-column'));

                // Toggle the visibility
                column.visible(!column.visible());
            });
            $('#ttagid.toggle-vis').on('click', function (e) {
                e.preventDefault();
                if ($(this).hasClass("text-danger")) {
                    $(this).removeClass('text-danger');
                    $(this).addClass('text-info');
                } else {
                    $(this).removeClass('text-info');
                    $(this).addClass('text-danger');
                }
                // Get the column API object
                var column = table3.column($(this).attr('data-column'));

                // Toggle the visibility
                column.visible(!column.visible());
            });

        });
        // bài đăng
        $("#btnthembaidang").click(function (e) {
            //alert("vào hàm");
            var noidungck = CKEDITOR.instances['baidangadd_noidung'].getData();

            noidung = noidungck.replace(/</g, '&quirk');
            alert(noidung);
            var mabaidang = '"' + $(".mabaidangadd").val() + '"';
            var tieude = '"' + $(".tieudebaidangadd").val() + '"';
            var thoigianhieuluc = '"' + $(".tghieulucbaidangadd").val() + '"';
            var nguoidang = '"' + $("#sessiontext").text() + '"';

            var a = document.getElementById("baidangadd_maloai");
            var b = document.getElementById("baidangadd_DThienthi");
            var c = document.getElementById("baidangadd_flag");

            var maloai = a.options[a.selectedIndex].value;
            var dthienthi = b.options[b.selectedIndex].value;
            var flag = c.options[c.selectedIndex].value;


            var baidang = "{ \"Mabaidang\": " + mabaidang + ", \"Maloai\": " + "\"" + maloai + "\"" + ", \"Thoigianhieuluc\": " + thoigianhieuluc + ", \"Tennguoidang\": " + nguoidang + ", \"Tieude\": " + tieude + ", \"Flag\": " + "\"" + flag + "\"" + ", \"ĐoituongHT\": " + "\"" + dthienthi + "\" }";

            var x;

            if ($("#tagbaidangadd").val() == null) {
                x = 0;
            } else {
                x = $("#tagbaidangadd").val().length;
            }
            alert($("#tagbaidangadd").val());

            var listtag = [];
            for (var i = 0; i < x; ++i) {
                listtag[i] = $("#tagbaidangadd").val()[i];
            };

            if (mabaidang != '""' && tieude != '""' && noidung != "") {
                $.ajax({
                    url: "/Admin/Baidang/Thembaidang",
                    data: { baidang: baidang, noidung: noidung, listtag: listtag },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {
                        if (response.status == "1") {
                            alert("Bạn chưa chọn tag");
                        }
                        if (response.status == "2") {
                            alert("Bài đăng đã tồn tại");
                        }
                        if (response.status == "3") {
                            alert("Thêm thành công");
                            location.reload();
                        }
                    }
                });
            } else {
                alert("Bạn chưa nhập đủ thông tin");
            }

        });
        $("#btnsuabaidang").click(function (e) {
            //alert("vào hàm");
            var noidungck = CKEDITOR.instances['baidangedit_noidung'].getData();

            noidung = noidungck.replace(/</g, '&quirk');
            alert(noidung);
            var mabaidang = '"' + $(".mabaidangedit").val() + '"';
            var tieude = '"' + $(".tieudebaidangedit").val() + '"';
            var thoigianhieuluc = '"' + $(".tghieulucbaidangedit").val() + '"';
            //var nguoidang = '"' + $("#sessiontext").text() + '"';

            var a = document.getElementById("baidangedit_maloai");
            var b = document.getElementById("baidangedit_DThienthi");

            var maloai = a.options[a.selectedIndex].value;
            var dthienthi = b.options[b.selectedIndex].value;


            var baidang = "{ \"Mabaidang\": " + mabaidang + ", \"Maloai\": " + "\"" + maloai + "\"" + ", \"Thoigianhieuluc\": " + thoigianhieuluc + /*", \"Tennguoidang\": " + nguoidang +*/ ", \"Tieude\": " + tieude + ", \"ĐoituongHT\": " + "\"" + dthienthi + "\" }";

            var x;

            if ($("#tagbaidangedit").val() == null) {
                x = 0;
            } else {
                x = $("#tagbaidangedit").val().length;
            }
            alert($("#tagbaidangedit").val());

            var listtag = [];
            for (var i = 0; i < x; ++i) {
                listtag[i] = $("#tagbaidangedit").val()[i];
            };

            if (mabaidang != '""' && tieude != '""' && noidung != "") {
                $.ajax({
                    url: "/Admin/Baidang/Suabaidang",
                    data: { baidang: baidang, noidung: noidung, listtag: listtag },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {
                        if (response.status == false) {
                            alert("Bạn chưa chọn tag");
                        }
                        if (response.status == true) {
                            alert("Sửa thành công");
                            location.reload();
                        }
                    }
                });
            } else {
                alert("Bạn chưa nhập đủ thông tin");
            }

        });
        $(".btnloadbaidang").click(function (e) {
            e.preventDefault();
            var btn = $(this).closest('tr');
            $.ajax({
                url: "/Admin/Baidang/Loadbaidang",
                data: { id: btn.find('.mabaidang').text() },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    $(".mabaidangedit").val(response.baidang.mabaidang);
                    document.getElementById("baidangedit_maloai").value = response.baidang.maloai;
                    document.getElementById("baidangedit_DThienthi").value = response.baidang.doituonghienthi;
                    $(".tghieulucbaidangedit").val(response.baidang.thoigianhieuluc);
                    $(".tieudebaidangedit").val(response.baidang.tieude);
                    CKEDITOR.instances['baidangedit_noidung'].setData(response.baidang.noidung);
                    document.getElementById("baidangedit_chucvu").value = response.chucvu;
                    $.ajax({
                        url: "/Admin/Baidang/Chucvudangbai",
                        data: { id: response.chucvu },
                        dataType: "json",
                        type: "Post",
                        success: function (response2) {
                            $("#tagbaidangedit").find('option').remove();
                            for (var i = 0; i < response2.list.length; ++i) {
                                var option = new Option(response2.list[i], response2.listid[i]);
                                $('#tagbaidangedit').append($(option));
                            }
                            for (var i = 0; i < response.taglist.length; ++i) {
                                $('#tagbaidangedit > option[value=' + response.taglist[i] + ']').attr('selected', 'selected');
                            }

                            $('#tagbaidangedit').selectpicker('refresh');
                        }
                    });
                }
            });
        });
        $("#baidangadd_chucvu").change(function (e) {
            //alert($(this).val());
            $.ajax({
                url: "/Admin/Baidang/Chucvudangbai",
                data: { id: $(this).val() },
                dataType: "json",
                type: "Post",
                success: function (response) {
                    $("#tagbaidangadd").find('option').remove();
                    for (var i = 0; i < response.list.length; ++i) {
                        var option = new Option(response.list[i], response.listid[i]);
                        $('#tagbaidangadd').append($(option));
                    }
                    $('#tagbaidangadd').selectpicker('refresh');
                }
            })
        });
        $("#baidangedit_chucvu").change(function (e) {
            //alert($(this).val());
            $.ajax({
                url: "/Admin/Baidang/Chucvudangbai",
                data: { id: $(this).val() },
                dataType: "json",
                type: "Post",
                success: function (response) {
                    $("#tagbaidangedit").find('option').remove();
                    for (var i = 0; i < response.list.length; ++i) {
                        var option = new Option(response.list[i], response.listid[i]);
                        $('#tagbaidangedit').append($(option));
                    }
                    $('#tagbaidangedit').selectpicker('refresh');
                }
            })
        });
        $('.btnbaidangflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Baidang/ChangeStatusBaidang",
                data: { id: btn.data('mabaidang') },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    if (response.status == true) {
                        btn.text("Khóa")
                        btn.css("color", "#ff7676");
                    } else {
                        btn.text("Không khóa")
                        btn.css("color", "#2cabe3");
                    }
                }
            });

        });
        // loại bài đăng
        $('#btnthemloaibaidang').click(function (e) {
            alert("vào hàm");
            var loaibaidang = '{"maloai":"" , "tenloai":"", "flag":""}';
            loaibaidang = JSON.parse(loaibaidang);
            loaibaidang.maloai = $('.maloailoaibaidangadd').val();
            loaibaidang.tenloai = $('.tenloailoaibaidangadd').val();
            loaibaidang.flag = document.getElementById("loaibaidangadd_flag").value;
            if (loaibaidang.maloai != "" && loaibaidang.tenloai != "") {
                loaibaidang = JSON.stringify(loaibaidang);
                $.ajax({
                    url: "/Admin/Baidang/Themloaibaidang",
                    data: { loaibaidang: loaibaidang },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Loại bài đăng đã tồn tại");
                        else {
                            alert("Thêm thành công");
                            location.reload();
                        }
                    }
                });
            } else {
                alert("bạn chưa nhập đủ thông tin");
            }

        });
        $("#btnsualoaibaidang").click(function (e) {
            var loaibaidang = '{"maloai":"" , "tenloai":""}';
            loaibaidang = JSON.parse(loaibaidang);
            loaibaidang.maloai = $('.maloailoaibaidangedit').val();
            loaibaidang.tenloai = $('.tenloailoaibaidangedit').val();
            if (loaibaidang.maloai != "" && loaibaidang.tenloai != "") {
                loaibaidang = JSON.stringify(loaibaidang);
                $.ajax({
                    url: "/Admin/Baidang/Sualoaibaidang",
                    data: { loaibaidang: loaibaidang },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        alert("Sửa thành công");
                        location.reload();
                    }
                });
            } else {
                alert("bạn chưa nhập đủ thông tin");
            }

        });
        $('.btnloadloaibaidang').click(function (e) {
            var btn = $(this).closest('tr').find('.maloaibaidang').text();
            $.ajax({
                url: "/Admin/Baidang/Loadloaibaidang",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".maloailoaibaidangedit").val(response.loaibaidang.maloai);
                    $(".tenloailoaibaidangedit").val(response.loaibaidang.tenloai);
                }
            })
        });
        $('.btnloaibaidangflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Baidang/ChangeStatusLoaibaidang",
                data: { id: btn.data('maloaibaidang') },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    if (response.status == true) {
                        btn.text("Khóa")
                        btn.css("color", "#ff7676");
                    } else {
                        btn.text("Không khóa")
                        btn.css("color", "#2cabe3");
                    }
                }
            });
        });
        //tagid
        $('#btnthemtagid').click(function (e) {
            var tagid = '{"tentag":"" , "machucvu":"", "flag":""}';
            tagid = JSON.parse(tagid);
            tagid.tentag = $('.tentagtagidadd').val();
            tagid.machucvu = document.getElementById("tagidadd_chucvu").value;
            tagid.flag = document.getElementById("tagidadd_flag").value;
            if (tagid.tentag != "") {
                tagid = JSON.stringify(tagid);
                $.ajax({
                    url: "/Admin/Baidang/Themtagid",
                    data: { tagid: tagid },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Tên tag đã tồn tại");
                        else {
                            alert("Thêm thành công");
                            location.reload();
                        }
                    }
                });
            } else {
                alert("bạn chưa nhập đủ thông tin");
            }

        });
        $('#btnsuatagid').click(function (e) {
            var tagid = '{"tagid":"", "tentag":"", "machucvu":""}';
            tagid = JSON.parse(tagid);
            tagid.tagid = $('.matagtagidedit').val();
            tagid.tentag = $('.tentagtagidedit').val();
            tagid.machucvu = document.getElementById("tagidedit_chucvu").value;
            if (tagid.tentag != "") {
                tagid = JSON.stringify(tagid);
                $.ajax({
                    url: "/Admin/Baidang/Suatagid",
                    data: { tagid: tagid },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Tên tag đã tồn tại");
                        else {
                            alert("Sửa thành công");
                            location.reload();
                        }
                    }
                });
            } else {
                alert("bạn chưa nhập đủ thông tin");
            }

        });
        $('.btnloadtagid').click(function (e) {
            var btn = $(this).closest('tr').find('.matagid').text();
            $.ajax({
                url: "/Admin/Baidang/Loadtagid",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".matagtagidedit").val(response.tagid.tagid);
                    $(".tentagtagidedit").val(response.tagid.tentag);
                    document.getElementById("tagidedit_chucvu").value = response.tagid.machucvu;
                }
            })
        });
        $('.btntagidflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Baidang/ChangeStatusTagid",
                data: { id: btn.data('matagid') },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    if (response.status == true) {
                        btn.text("Khóa")
                        btn.css("color", "#ff7676");
                    } else {
                        btn.text("Không khóa")
                        btn.css("color", "#2cabe3");
                    }
                }
            });
        });
    }
}
baidang.init();