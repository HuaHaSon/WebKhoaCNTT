var nghiencuukhoahoc = {
    init: function () {
        nghiencuukhoahoc.RegisterEvents()
    },
    RegisterEvents: function () {
        var noidungchitietnghiencuuadd = CKEDITOR.replace('chitietnghiencuuadd_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var noidungchitietnghiencuuedit = CKEDITOR.replace('chitietnghiencuuedit_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        $(document).ready(function () {
            var table = $('#nghiencuuTable').DataTable({
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
            var table2 = $('#chitietnghiencuuTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [8],
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
            $('#tnghiencuu.toggle-vis').on('click', function (e) {
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
            $('#tchitietnghiencuu.toggle-vis').on('click', function (e) {
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
        // nghien cuu
        $('#btnthemnghiencuu').click(function (e) {
            var nghiencuu = '{"MaNCKH":"" , "TenNCKH":"", "Flag":""}';
            nghiencuu = JSON.parse(nghiencuu);
            nghiencuu.MaNCKH = $('.manghiencuuadd').val();
            nghiencuu.TenNCKH = $('.tennghiencuuadd').val();
            nghiencuu.flag = document.getElementById("nghiencuuadd_flag").value;
            if (nghiencuu.MaNCKH != "" && nghiencuu.TenNCKH != "") {
                nghiencuu = JSON.stringify(nghiencuu);
                $.ajax({
                    url: "/Admin/Nghiencuukhoahoc/Themnghiencuu",
                    data: { nghiencuu: nghiencuu },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Loại nghiên cứu đã tồn tại");
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
        $('#btnsuanghiencuu').click(function (e) {
            var nghiencuu = '{"MaNCKH":"" , "TenNCKH":""}';
            nghiencuu = JSON.parse(nghiencuu);
            nghiencuu.MaNCKH = $('.manghiencuuedit').val();
            nghiencuu.TenNCKH = $('.tennghiencuuedit').val();
            if (nghiencuu.MaNCKH != "" && nghiencuu.TenNCKH != "") {
                nghiencuu = JSON.stringify(nghiencuu);
                $.ajax({
                    url: "/Admin/Nghiencuukhoahoc/Suanghiencuu",
                    data: { nghiencuu: nghiencuu },
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
        $('.btnloadnghiencuu').click(function (e) {
            var btn = $(this).closest('tr').find('.manghiencuu').text();
            $.ajax({
                url: "/Admin/Nghiencuukhoahoc/Loadnghiencuu",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".manghiencuuedit").val(response.nghiencuu.manghiencuu);
                    $(".tennghiencuuedit").val(response.nghiencuu.tennghiencuu);
                }
            })
        });
        $('.btnnghiencuuflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Nghiencuukhoahoc/ChangeStatusNghiencuu",
                data: { id: btn.data('manghiencuu') },
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
        // chi tiet nghien cuu
        $('#btnthemchitietnghiencuu').click(function (e) {
            alert("vào hàm");
            var chitietnghiencuu = '{"MaCTNCKH":"" , "MaNCKH":"", "Tieude":"", "NgaySK":"", "Flag":""}';
            var noidungck = CKEDITOR.instances['chitietnghiencuuadd_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            chitietnghiencuu = JSON.parse(chitietnghiencuu);
            chitietnghiencuu.MaCTNCKH = $('.machitietnghiencuuadd').val();
            chitietnghiencuu.Tieude = $('.tieudechitietnghiencuuadd').val();
            chitietnghiencuu.NgaySK = $('.ngaysukienchitietnghiencuuadd').val();
            chitietnghiencuu.MaNCKH = document.getElementById("chitietnghiencuuadd_manghiencuu").value;
            chitietnghiencuu.Flag = document.getElementById("chitietnghiencuuadd_flag").value;
            if (chitietnghiencuu.MaCTNCKH != "" && chitietnghiencuu.Tieude != "" && noidung != "" && chitietnghiencuu.NgaySK != "") {
                chitietnghiencuu = JSON.stringify(chitietnghiencuu);
                $.ajax({
                    url: "/Admin/Nghiencuukhoahoc/Themchitietnghiencuu",
                    data: { chitietnghiencuu: chitietnghiencuu, noidung: noidung },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Chi tiết nghiên cứu đã tồn tại");
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
        $('#btnsuachitietnghiencuu').click(function (e) {
            alert("vào hàm");
            var chitietnghiencuu = '{"MaCTNCKH":"" , "MaNCKH":"", "Tieude":"", "NgaySK":""}';
            var noidungck = CKEDITOR.instances['chitietnghiencuuedit_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            chitietnghiencuu = JSON.parse(chitietnghiencuu);
            chitietnghiencuu.MaCTNCKH = $('.machitietnghiencuuedit').val();
            chitietnghiencuu.Tieude = $('.tieudechitietnghiencuuedit').val();
            chitietnghiencuu.NgaySK = $('.ngaysukienchitietnghiencuuedit').val();
            chitietnghiencuu.MaNCKH = document.getElementById("chitietnghiencuuedit_manghiencuu").value;
            
            if (chitietnghiencuu.MaCTNCKH != "" && chitietnghiencuu.Tieude != "" && noidung != "" && chitietnghiencuu.NgaySK != "") {
                chitietnghiencuu = JSON.stringify(chitietnghiencuu);
                $.ajax({
                    url: "/Admin/Nghiencuukhoahoc/Suachitietnghiencuu",
                    data: { chitietnghiencuu: chitietnghiencuu, noidung: noidung },
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
        $('.btnloadchitietnghiencuu').click(function (e) {
            alert("vao ham");
            var btn = $(this).closest('tr').find('.machitietnghiencuu').text();
            $.ajax({
                url: "/Admin/Nghiencuukhoahoc/Loadchitietnghiencuu",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".machitietnghiencuuedit").val(response.chitietnghiencuu.mactnc);
                    document.getElementById("chitietnghiencuuedit_manghiencuu").value = response.chitietnghiencuu.manc;
                    $(".tieudechitietnghiencuuedit").val(response.chitietnghiencuu.tieude);
                    $(".ngaysukienchitietnghiencuuedit").val(response.chitietnghiencuu.ngaysk);
                    CKEDITOR.instances['chitietnghiencuuedit_noidung'].setData(response.chitietnghiencuu.noidung);
                }
            })
        });
        $('.btnchitietnghiencuuflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Nghiencuukhoahoc/ChangeStatusChitietnghiencuu",
                data: { id: btn.data('machitietnghiencuu') },
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
nghiencuukhoahoc.init();