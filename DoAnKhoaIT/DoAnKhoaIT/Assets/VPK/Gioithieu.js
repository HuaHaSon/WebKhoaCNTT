var gioithieu = {
    init: function () {
        gioithieu.RegisterEvents()
    },
    RegisterEvents: function () {
        //do logic here
        var noidunggioithieuadd = CKEDITOR.replace('noidunggioithieuadd_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var noidunggioithieuedit = CKEDITOR.replace('noidunggioithieuedit_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        $(document).ready(function () {
            var table = $('#loaigioithieuTable').DataTable({
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
            var table2 = $('#noidunggioithieuTable').DataTable({
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
            $('#tloaigioithieu.toggle-vis').on('click', function (e) {
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
            $('#tnoidunggioithieu.toggle-vis').on('click', function (e) {
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
        $('#btnthemloaigioithieu').click(function (e) {
            var gioithieu = '{"MaGT":"" , "TenGT":"", "flag":""}';
            loaigioithieu = JSON.parse(gioithieu);
            loaigioithieu.MaGT = $('.maloaigioithieuadd').val();
            loaigioithieu.TenGT = $('.tenloaigioithieuadd').val();
            loaigioithieu.flag = document.getElementById("loaigioithieuadd_flag").value;
            if (loaigioithieu.MaGT != "" && loaigioithieu.TenGT != "") {
                loaigioithieu = JSON.stringify(loaigioithieu);
                $.ajax({
                    url: "/Admin/Gioithieu/Themloaigioithieu",
                    data: { loaigioithieu: loaigioithieu },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Loại giới thiệu đã tồn tại");
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
        $('#btnsualoaigioithieu').click(function (e) {
            var gioithieu = '{"MaGT":"" , "TenGT":""}';
            loaigioithieu = JSON.parse(gioithieu);
            loaigioithieu.MaGT = $('.maloaigioithieuedit').val();
            loaigioithieu.Tenloai = $('.tenloaigioithieuedit').val();
            if (loaigioithieu.MaGT != "" && loaigioithieu.Tenloai != "") {
                loaigioithieu = JSON.stringify(loaigioithieu);
                $.ajax({
                    url: "/Admin/Gioithieu/Sualoaigioithieu",
                    data: { loaigioithieu: loaigioithieu },
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
        $('.btnloadloaigioithieu').click(function (e) {
            var btn = $(this).closest('tr').find('.maloaigioithieu').text();
            $.ajax({
                url: "/Admin/Gioithieu/Loadloaigioithieu",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".maloaigioithieuedit").val(response.loaigioithieu.Maloai);
                    $(".tenloaigioithieuedit").val(response.loaigioithieu.Tenloai);
                }
            })
        });
        $('.btnloaigioithieuflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Gioithieu/ChangeStatusLoaigioithieu",
                data: { id: btn.data('maloaigioithieu') },
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
        $('#btnthemnoidunggioithieu').click(function (e) {
            alert("vào hàm");
            var noidunggioithieu = '{"MaNDGT":"" , "MaGT":"", "Tieude":"", "Flag":""}';
            var noidungck = CKEDITOR.instances['noidunggioithieuadd_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            noidunggioithieu = JSON.parse(noidunggioithieu);
            noidunggioithieu.MaNDGT = $('.manoidunggioithieuadd').val();
            noidunggioithieu.Tieude = $('.tieudenoidunggioithieuadd').val();
            noidunggioithieu.MaGT = document.getElementById("noidunggioithieuadd_maloai").value;
            noidunggioithieu.Flag = document.getElementById("noidunggioithieuadd_flag").value;
            if (noidunggioithieu.MaNDGT != "" && noidunggioithieu.Tieude != "" && noidung != "") {
                noidunggioithieu = JSON.stringify(noidunggioithieu);
                $.ajax({
                    url: "/Admin/Gioithieu/Themnoidunggioithieu",
                    data: { noidunggioithieu: noidunggioithieu, noidung: noidung },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Nội dung giới thiệu đã tồn tại");
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
        $('#btnsuanoidunggioithieu').click(function (e) {
            alert("vào hàm");
            var noidunggioithieu = '{"MaNDGT":"" , "MaGT":"", "Tieude":""}';
            var noidungck = CKEDITOR.instances['noidunggioithieuedit_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            noidunggioithieu = JSON.parse(noidunggioithieu);
            noidunggioithieu.MaNDGT = $('.manoidunggioithieuedit').val();
            noidunggioithieu.Tieude = $('.tieudenoidunggioithieuedit').val();
            noidunggioithieu.MaGT = document.getElementById("noidunggioithieuedit_maloai").value;
            if (noidunggioithieu.MaNDGT != "" && noidunggioithieu.Tieude != "" && noidung != "") {
                noidunggioithieu = JSON.stringify(noidunggioithieu);
                $.ajax({
                    url: "/Admin/Gioithieu/Suanoidunggioithieu",
                    data: { noidunggioithieu: noidunggioithieu, noidung: noidung },
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
        $('.btnloadnoidunggioithieu').click(function (e) {
            var btn = $(this).closest('tr').find('.manoidunggioithieu').text();
            $.ajax({
                url: "/Admin/Gioithieu/Loadnoidunggioithieu",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".manoidunggioithieuedit").val(response.noidunggioithieu.MaNDGT);
                    document.getElementById("noidunggioithieuedit_maloai").value = response.noidunggioithieu.MaGT;
                    $(".tieudenoidunggioithieuedit").val(response.noidunggioithieu.Tieude);
                    CKEDITOR.instances['noidunggioithieuedit_noidung'].setData(response.noidunggioithieu.Noidung);
                }
            })
        });
        $('.btnnoidunggioithieuflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Gioithieu/ChangeStatusNoidunggioithieu",
                data: { id: btn.data('manoidunggioithieu') },
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
gioithieu.init();