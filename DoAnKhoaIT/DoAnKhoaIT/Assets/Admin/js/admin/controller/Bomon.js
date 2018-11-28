var bomon = {
    init: function () {
        bomon.RegisterEvents()
    },
    RegisterEvents: function () {
        //do logic here
        var noidungbomonoadd = CKEDITOR.replace('bomonadd_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var noidungbomonedit = CKEDITOR.replace('bomonedit_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var thongtingiaovienadd = CKEDITOR.replace('giaovienadd_thongtin', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var thongtingiaovienedit = CKEDITOR.replace('giaovienedit_thongtin', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        $(document).ready(function () {
            var table = $('#bomonTable').DataTable({
                "order": [[1, "desc"]],
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
            var table2 = $('#monhocTable').DataTable({
                "order": [[1, "desc"]],
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
            var table3 = $('#giaovienTable').DataTable({
                "order": [[1, "desc"]],
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
            $('#tbomon.toggle-vis').on('click', function (e) {
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
            $('#tmonhoc.toggle-vis').on('click', function (e) {
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
            $('#tgiaovien.toggle-vis').on('click', function (e) {
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
        // bo mon
        $('#btnthembomon').click(function (e) {
            var bomon = '{"MaBM":"" , "TenBM":"", "Flag":""}';
            bomon = JSON.parse(bomon);
            bomon.MaBM = $('.mabomonadd').val();
            bomon.TenBM = $('.tenbomonadd').val();
            bomon.flag = document.getElementById("bomonadd_flag").value;
            var noidungck = CKEDITOR.instances['bomonadd_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            if (bomon.MaloaiDT != "" && bomon.Tenloai != "" && noidung != "") {
                bomon = JSON.stringify(bomon);
                $.ajax({
                    url: "/Admin/Bomon/Thembomon",
                    data: { bomon: bomon, noidung: noidung },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Bộ môn đã tồn tại");
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
        $('#btnsuabomon').click(function (e) {
            var bomon = '{"MaBM":"" , "TenBM":""}';
            bomon = JSON.parse(bomon);
            bomon.MaBM = $('.mabomonedit').val();
            bomon.TenBM = $('.tenbomonedit').val();
            var noidungck = CKEDITOR.instances['bomonedit_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            if (bomon.MaloaiDT != "" && bomon.Tenloai != "" && noidung != "") {
                bomon = JSON.stringify(bomon);
                $.ajax({
                    url: "/Admin/Bomon/Suabomon",
                    data: { bomon: bomon, noidung: noidung },
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
        $('.btnloadbomon').click(function (e) {
            var btn = $(this).closest('tr').find('.mabomon').text();
            $.ajax({
                url: "/Admin/Bomon/Loadbomon",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".mabomonedit").val(response.bomon.mabomon);
                    $(".tenbomonedit").val(response.bomon.tenbomon);
                    CKEDITOR.instances['bomonedit_noidung'].setData(response.bomon.noidung);
                }
            })
        });
        $('.btnbomonflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Bomon/ChangeStatusbomon",
                data: { id: btn.data('mabomon') },
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
        // mon hoc
        $('#btnthemmonhoc').click(function (e) {
            var monhoc = '{"MaMH":"" , "MaBM":"","TenMH":"", "Flag":""}';
            monhoc = JSON.parse(monhoc);
            monhoc.MaMH = $('.mamonhocadd').val();
            monhoc.MaBM = document.getElementById("monhocadd_bomon").value;
            monhoc.TenMH = $('.tenmonhocadd').val();
            monhoc.flag = document.getElementById("monhocadd_flag").value;           
            if (monhoc.MaMH != "" && monhoc.TenMH != "") {
                monhoc = JSON.stringify(monhoc);
                $.ajax({
                    url: "/Admin/Bomon/Themmonhoc",
                    data: { monhoc: monhoc },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Môn học đã tồn tại");
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
        $('#btnsuamonhoc').click(function (e) {
            var monhoc = '{"MaMH":"" , "MaBM":"","TenMH":""}';
            monhoc = JSON.parse(monhoc);
            monhoc.MaMH = $('.mamonhocedit').val();
            monhoc.MaBM = document.getElementById("monhocedit_bomon").value;
            monhoc.TenMH = $('.tenmonhocedit').val();          
            if (monhoc.MaMH != "" && monhoc.TenMH != "") {
                monhoc = JSON.stringify(monhoc);
                $.ajax({
                    url: "/Admin/Bomon/Suamonhoc",
                    data: { monhoc: monhoc },
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
        $('.btnloadmonhoc').click(function (e) {
            var btn = $(this).closest('tr').find('.mamonhoc').text();
            $.ajax({
                url: "/Admin/Bomon/Loadmonhoc",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".mamonhocedit").val(response.monhoc.mamonhoc);
                    document.getElementById("monhocedit_bomon").value = response.monhoc.mabomon;
                    $(".tenmonhocedit").val(response.monhoc.tenmonhoc);
                }
            })
        });
        $('.btnmonhocflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Bomon/ChangeStatusMonhoc",
                data: { id: btn.data('mamonhoc') },
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
        //giao vien
        $('#btnthemgiaovien').click(function (e) {
            var giaovien = '{"MaGV":"", "MaBM":"", "TenGV":"", "Chucvu":"", "Chucdanh":"", "Diachimail":"", "Flag":""}';
            var thongtinck = CKEDITOR.instances['giaovienadd_thongtin'].getData();
            thongtin = thongtinck.replace(/</g, '&quirk');
            giaovien = JSON.parse(giaovien);
            giaovien.MaGV = $('.magiaovienadd').val();
            giaovien.MaBM = document.getElementById("giaovienadd_bomon").value;
            giaovien.TenGV = $('.tengiaovienadd').val();
            giaovien.Chucvu = $(".chucvugiaovienadd").val();
            giaovien.Chucdanh = $(".chucdanhgiaovienadd").val();
            giaovien.Diachimail = $(".mailgiaovienadd").val();
            giaovien.Flag = document.getElementById("giaovienadd_flag").value;
            if (giaovien.MaGV != "" && giaovien.TenGV != "" && giaovien.chucvu != "" && giaovien.Chucdanh != "" && giaovien.Diachimail != "") {
                giaovien = JSON.stringify(giaovien);
                $.ajax({
                    url: "/Admin/Bomon/Themgiaovien",
                    data: { giaovien: giaovien, thongtin: thongtin },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Môn học đã tồn tại");
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
        $('#btnsuagiaovien').click(function (e) {
            var giaovien = '{"MaGV":"", "MaBM":"", "TenGV":"", "Chucvu":"", "Chucdanh":"", "Diachimail":""}';
            var thongtinck = CKEDITOR.instances['giaovienedit_thongtin'].getData();
            thongtin = thongtinck.replace(/</g, '&quirk');
            giaovien = JSON.parse(giaovien);
            giaovien.MaGV = $('.magiaovienedit').val();
            giaovien.MaBM = document.getElementById("giaovienedit_bomon").value;
            giaovien.TenGV = $('.tengiaovienedit').val();
            giaovien.Chucvu = $(".chucvugiaovienedit").val();
            giaovien.Chucdanh = $(".chucdanhgiaovienedit").val();
            giaovien.Diachimail = $(".mailgiaovienedit").val();          
            if (giaovien.MaGV != "" && giaovien.TenGV != "" && giaovien.chucvu != "" && giaovien.Chucdanh != "" && giaovien.Diachimail != "") {
                giaovien = JSON.stringify(giaovien);
                $.ajax({
                    url: "/Admin/Bomon/Suagiaovien",
                    data: { giaovien: giaovien, thongtin: thongtin },
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
        $('.btnloadgiaovien').click(function (e) {
            var btn = $(this).closest('tr').find('.magiaovien').text();
            $.ajax({
                url: "/Admin/Bomon/Loadgiaovien",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".magiaovienedit").val(response.giaovien.magiaovien);
                    document.getElementById("giaovienedit_bomon").value = response.giaovien.mabomon;
                    $(".tengiaovienedit").val(response.giaovien.tengiaovien);
                    $(".chucvugiaovienedit").val(response.giaovien.chucvu);
                    $(".chucdanhgiaovienedit").val(response.giaovien.chucdanh);
                    CKEDITOR.instances['giaovienedit_thongtin'].setData(response.giaovien.thongtin);
                    $(".mailgiaovienedit").val(response.giaovien.mail);
                }
            })
        });
        $('.btngiaovienflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Bomon/ChangeStatusGiaovien",
                data: { id: btn.data('magiaovien') },
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
bomon.init();