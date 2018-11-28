var bieumauthutuc = {
    init: function () {
        bieumauthutuc.RegisterEvents()
    },
    RegisterEvents: function () {
        //do logic here
        var noidungbieumauadd = CKEDITOR.replace('noidungbieumauadd_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var noidungbieumauedit = CKEDITOR.replace('noidungbieumauedit_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });

        $(document).ready(function () {
            var table = $('#bieumauTable').DataTable({
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
            var table2 = $('#noidungbieumauTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [7],
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
            $('#tbieumau.toggle-vis').on('click', function (e) {
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
            $('#tnoidungbieumau.toggle-vis').on('click', function (e) {
                e.preventDefault();
                if ($(this).hasClass("text-danger")) {
                    $(this).removeClass('text-danger');
                    $(this).addClass('text-info');
                } else {
                    $(this).removeClass('text-info');
                    $(this).addClass('text-danger');
                }

                //Get the column API object
                var column = table2.column($(this).attr('data-column'));

                //Toggle the visibility
                column.visible(!column.visible());
            });

        });
        // biểu mẫu
        $('#btnthembieumau').click(function (e) {
            var bieumau = '{"MaBMTT":"" , "TeNBMTT":"", "flag":""}';
            bieumau = JSON.parse(bieumau);
            bieumau.MaBMTT = $('.mabieumauadd').val();
            bieumau.TenBMTT = $('.tenbieumauadd').val();
            bieumau.flag = document.getElementById("bieumauadd_flag").value;
            if (bieumau.MaBMTT != "" && bieumau.TenBMTT != "") {
                bieumau = JSON.stringify(bieumau);
                $.ajax({
                    url: "/Admin/Bieumauthutuc/Thembieumau",
                    data: { bieumau: bieumau },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Biểu mẫu đã tồn tại");
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
        $('#btnsuabieumau').click(function (e) {
            var bieumau = '{"MaBMTT":"" , "TeNBMTT":""}';
            bieumau = JSON.parse(bieumau);
            bieumau.MaBMTT = $('.mabieumauedit').val();
            bieumau.TenBMTT = $('.tenbieumauedit').val();
            if (bieumau.MaBMTT != "" && bieumau.TenBMTT != "") {
                bieumau = JSON.stringify(bieumau);
                $.ajax({
                    url: "/Admin/Bieumauthutuc/Suabieumau",
                    data: { bieumau: bieumau },
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
        $('.btnloadbieumau').click(function (e) {
            var btn = $(this).closest('tr').find('.mabieumau').text();
            $.ajax({
                url: "/Admin/Bieumauthutuc/Loadbieumau",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".mabieumauedit").val(response.bieumau.MaBMTT);
                    $(".tenbieumauedit").val(response.bieumau.TenBMTT);
                }
            })
        });
        $('.btnbieumauflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Bieumauthutuc/ChangeStatusBieumau",
                data: { id: btn.data('mabmtt') },
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
        // nội dung biểu mẫu
        $('#btnthemnoidungbieumau').click(function (e) {
            alert("vào hàm");
            var noidungbieumau = '{"MaNDBMTT":"" , "MaBMTT":"", "Tieude":"", "flag":""}';
            var noidungck = CKEDITOR.instances['noidungbieumauadd_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            noidungbieumau = JSON.parse(noidungbieumau);
            noidungbieumau.MaNDBMTT = $('.manoidungbieumauadd').val();
            noidungbieumau.Tieude = $('.tieudenoidungbieumauadd').val();
            noidungbieumau.MaBMTT = document.getElementById("noidungbieumauadd_mabieumau").value;
            noidungbieumau.flag = document.getElementById("noidungbieumauadd_flag").value;
            if (noidungbieumau.MaNDBMTT != "" && noidungbieumau.Tieude != "" && noidung != "") {
                noidungbieumau = JSON.stringify(noidungbieumau);
                $.ajax({
                    url: "/Admin/Bieumauthutuc/Themnoidungbieumau",
                    data: { noidungbieumau: noidungbieumau, noidung: noidung },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Biểu mẫu đã tồn tại");
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
        $('#btnsuanoidungbieumau').click(function (e) {
            var noidungbieumau = '{"MaNDBMTT":"" , "MaBMTT":"", "Tieude",""}';
            var noidungck = CKEDITOR.instances['noidungbieumauedit_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            noidungbieumau = JSON.parse(noidungbieumau);
            noidungbieumau.MaNDBMTT = $('.manoidungbieumauedit').val();
            noidungbieumau.MaBMTT = document.getElementById("noidungbieumauedit_mabieumau").value;
            noidungbieumau.Tieude = $('.tieudenoidungbieumauedit').val();
            if (noidungbieumau.MaNDBMTT != "" && noidungbieumau.Tieude != "" && noidung != "") {
                noidungbieumau = JSON.stringify(noidungbieumau);
                $.ajax({
                    url: "/Admin/Bieumauthutuc/Suanoidungbieumau",
                    data: { noidungbieumau: noidungbieumau, noidung: noidung },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        alert("Sửa thành công");
                        location.reload();
                    }
                })
            } else {
                alert("bạn chưa nhập đủ thông tin");
            }

        });
        $('.btnloadnoidungbieumau').click(function (e) {
            var btn = $(this).closest('tr').find('.manoidungbieumau').text();
            $.ajax({
                url: "/Admin/Bieumauthutuc/Loadnoidungbieumau",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".manoidungbieumauedit").val(response.noidungbieumau.MaND);
                    document.getElementById("noidungbieumauedit_mabieumau").value = response.noidungbieumau.MaBM;
                    $(".tieudenoidungbieumauedit").val(response.noidungbieumau.Tieude);
                    CKEDITOR.instances['noidungbieumauedit_noidung'].setData(response.noidungbieumau.Noidung);
                }
            })
        });
        $('.btnnoidungbieumauflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Bieumauthutuc/ChangeStatusNoidungbieumau",
                data: { id: btn.data('mandbmtt') },
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
bieumauthutuc.init();