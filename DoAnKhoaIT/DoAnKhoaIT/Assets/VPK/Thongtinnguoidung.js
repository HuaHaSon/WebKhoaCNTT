

var thongtinnguoidung = {
    init: function () {
        thongtinnguoidung.RegisterEvents()
    },
    RegisterEvents: function () {

        $(document).ready(function () {

            var table = $('#taikhoanTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [5],
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
            var table2 = $('#chucvuTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [1],
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
            var table3 = $('#phanquyenTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [1],
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
            $('#ttaikhoan.toggle-vis').on('click', function (e) {
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
            $('#tchucvu.toggle-vis').on('click', function (e) {
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
            $('#tquyen.toggle-vis').on('click', function (e) {
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
        // taikhoan
        $('#btnthemtaikhoan').click(function (e) {
            alert("vào hàm");
            // taikhoan
            var tentaikhoan = '"' + $('.tentaikhoanadd').val() + '"';
            var a = document.getElementById("taikhoanadd_machucvu");
            var b = document.getElementById("taikhoanadd_flag");
            var flagtaikhoan = b.options[b.selectedIndex].value;
            var matkhau = '"' + $('.matkhautaikhoanadd').val() + '"';

            var taikhoan =
                "  { \"Tentaikhoan\":" + tentaikhoan + ", \"matkhau\": " + matkhau + ", \"flag\": " + "\"" + flagtaikhoan + "\"" + "}";
            //thongtinnguoidung
            var hoten = '"' + $('.hotentaikhoanadd').val() + '"';
            var ngaysinh = '"' + $('.ngaysinhtaikhoanadd').val() + '"';
            var sdt = '"' + $('.sdttaikhoanadd').val() + '"';
            var mail = '"' + $('.mailtaikhoanadd').val() + '"';
            var quequan = '"' + $('.quequantaikhoanadd').val() + '"';
            var machucvu = a.options[a.selectedIndex].value;
            var thongtinnguoidung =
                " { \"Hoten\": " + hoten + ", \"Namsinh\": " + ngaysinh + " , \"Sodienthoai\": " + sdt + ", \"Gmail\": " + mail + " , \"Quequan\":  " + quequan + ", \"Tentaikhoan\": " + tentaikhoan + ", \"Machucvu\": " + "\"" + machucvu + "\"" + ",\"Flag\":\"True\" } ";
            if (hoten != '""' && ngaysinh != '""' && sdt != '""' && mail != '""' && quequan != '""' && tentaikhoan != '""' && matkhau != '""') {
                $.ajax({
                    url: "/Admin/Thongtinnguoidung/Themtaikhoan",
                    data: { taikhoan: taikhoan, thongtinnguoidung: thongtinnguoidung },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {
                        if (response.status == false) {
                            alert("Tài khoản đã tồn tại");
                        } else {
                            alert("Thêm thành công");
                            location.reload();
                            //$('#themtaikhoan').modal('hide');

                            //var t = $('#taikhoanTable').DataTable();

                            //var flagstyle = " <a class='btntaikhoanflag' hres='#'> <span class='text-info'> Không khóa </span> </a>";
                            //if (response.result.flag == false) {
                            //    flagstyle = " <a class='btntaikhoanflag' hres='#'> <span class='text-danger'> Khóa </span> </a> ";
                            //}
                            //var ttstyle = "<span class='badge badge-danger'> Offline </span>";
                            //if (response.result.trangthai == "Online") {
                            //    ttstyle = "<span class='badge badge-success'> Online </span>";
                            //}
                            //var rowNode = $(t.row.add([
                            //    response.result.tentaikhoan,
                            //    response.result.matkhau,
                            //    ttstyle,
                            //    response.result.TGdangky,
                            //    flagstyle,
                            //    "<button class='btnsuachucvu' type='button' data-toggle='modal' data-target='#suataikhoan' style='background-color: transparent; border: none'> <i class='fa fa-pencil-square-o' style = 'color:red'> </i > </button >"
                            //]).draw().node());
                            //rowNode.closest('td').addClass('tentaikhoan');
                            //rowNode.find('td').eq(1).addClass('matkhautaikhoan');
                            //rowNode.find('td').eq(2).addClass('trangthaitaikhoan');
                            //rowNode.find('td').eq(3).addClass('tgdangkitaikhoan');
                            //rowNode.find('td').eq(4).addClass('flagtaikhoan');

                            //$('.tentaikhoanadd').val("");
                            //$('.matkhautaikhoanadd').val("");
                            //$('.flagtaikhoanadd').val("");
                            //$('.hotentaikhoanadd').val("");
                            //$('.ngaysinhtaikhoanadd').val("");
                            //$('.sdttaikhoanadd').val("");
                            //$('.mailtaikhoanadd').val("");
                            //$('.quequantaikhoanadd').val("");

                        }

                    }
                });
            } else {
                alert("Bạn chưa nhập thông tin");
            }

        });
        $(".btnloadtaikhoan").click(function (e) {
            e.preventDefault();
            var btntaikhoan = $(this).closest('tr');
            $.ajax({
                url: "/Admin/Thongtinnguoidung/LoadSuataikhoan",
                data: { id: btntaikhoan.find('.tentaikhoan').text() },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    document.getElementById("taikhoanedit_machucvu").value = response.Jtaikhoan.machucvu;
                    $(".tentaikhoanedit").val(response.Jtaikhoan.tentaikhoan);
                    $(".matkhautaikhoanedit").val(response.Jtaikhoan.matkhau);
                    $(".mailtaikhoanedit").val(response.Jtaikhoan.mail);
                    $(".hotentaikhoanedit").val(response.Jtaikhoan.hoten);
                    $(".ngaysinhtaikhoanedit").val(response.Jtaikhoan.ngaysinh);
                    $(".sdttaikhoanedit").val(response.Jtaikhoan.sdt);
                    $(".quequantaikhoanedit").val(response.Jtaikhoan.quequan);
                }
            });
        });
        $('#btnsuataikhoan').click(function (e) {
            //taikhoan
            var tentaikhoan = '"' + $('.tentaikhoanedit').val() + '"';
            var a = document.getElementById("taikhoanedit_machucvu");
            var matkhau = '"' + $('.matkhautaikhoanedit').val() + '"';
            var taikhoan =
                "  { \"Tentaikhoan\":" + tentaikhoan + ", \"matkhau\": " + matkhau + "}";
            //thongtinnguoidung
            var hoten = '"' + $('.hotentaikhoanedit').val() + '"';
            var ngaysinh = '"' + $('.ngaysinhtaikhoanedit').val() + '"';
            var sdt = '"' + $('.sdttaikhoanedit').val() + '"';
            var mail = '"' + $('.mailtaikhoanedit').val() + '"';
            var quequan = '"' + $('.quequantaikhoanedit').val() + '"';
            var machucvu = a.options[a.selectedIndex].value;
            var thongtinnguoidung =
                " { \"Hoten\": " + hoten + ", \"Namsinh\": " + ngaysinh + " , \"Sodienthoai\": " + sdt + ", \"Gmail\": " + mail + " , \"Quequan\":  " + quequan + ", \"Tentaikhoan\": " + tentaikhoan + ", \"Machucvu\": " + "\"" + machucvu + "\"" + "}";
            alert('xử lí');
            if (hoten != '""' && ngaysinh != '""' && sdt != '""' && mail != '""' && quequan != '""' && tentaikhoan != '""' && matkhau != '""') {
                $.ajax({
                    url: "/Admin/Thongtinnguoidung/Suataikhoan",
                    data: { taikhoan: taikhoan, thongtinnguoidung: thongtinnguoidung },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {
                        alert('Sửa thành công');
                        location.reload();
                    }

                });
            } else {
                alert('Thông tin điền chưa đầy đủ');
            }
        });
        $('.btntaikhoanflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Thongtinnguoidung/ChangeStatusTaikhoan",
                data: { id: btn.data('tentaikhoan') },
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
        // chucvu
        $('#btnthemchucvu').click(function (e) {
            //alert('vao ham');
            var machucvu = '"' + $('.machucvuadd').val() + '"';
            var tenchucvu = '"' + $('.tenchucvuadd').val() + '"';
            var a = document.getElementById("chucvuadd_flag");
            var flagchucvu = a.options[a.selectedIndex].value;
            var chucvu =
                " { \"Machucvu\": " + machucvu + ", \"Tenchucvu\":" + tenchucvu + ", \"Flag\":" + "\"" + flagchucvu + "\"" + "}";

            var x = $(".quyenadd:checked");
            //alert(x.length);
            listquyen = [];
            for (var i = 0; i < x.length; i++) {
                listquyen[i] = x[i].value;
            };
            if (machucvu != '""' && tenchucvu != '""')
                $.ajax({
                    url: "/Admin/Thongtinnguoidung/Themchucvu",
                    data: { list: listquyen, chucvu: chucvu },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {

                        if (response.status == "1") {
                            alert("Bạn chưa phân quyền");
                        }
                        if (response.status == "2") {
                            alert("Chức vụ đã tồn tại");
                        }
                        if (response.status == "3") {
                            alert("Thêm thành công");
                            location.reload();

                            for (var i = 0; i < x.length; i++) {
                                x[i].checked = false;
                            };

                        }

                    }
                });
            else
                alert("Bạn chưa nhập thông tin");
        });
        $('.btnloadchucvu').click(function (e) {
            e.preventDefault();
            var btnchucvu = $(this).closest('tr');
            $.ajax({
                url: "/Admin/Thongtinnguoidung/LoadSuachucvu",
                data: { id: btnchucvu.find('.machucvu').text() },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    $(".machucvuedit").val(response.chucvures.machucvu);
                    $(".tenchucvuedit").val(response.chucvures.tenchucvu);
                    var y = response.slquyen;
                    for (var i = 0; i < y.length; ++i) {
                        var quyen = "#quyenedit" + y[i];
                        //alert(quyen);
                        $(quyen).prop("checked", false);
                    }
                    var x = response.listquyen;
                    for (var i = 0; i < x.length; ++i) {
                        var quyen = "#quyenedit" + x[i];
                        $(quyen).prop("checked", true);
                    }
                }
            });
        })
        $('#btnsuachucvu').click(function (e) {
            alert("vào hàm");
            var machucvu = '"' + $(".machucvuedit").val() + '"';
            var tenchucvu = '"' + $(".tenchucvuedit").val() + '"';
            var chucvu = " {\"Machucvu\" : " + machucvu + ", \"Tenchucvu\": " + tenchucvu + "}";
            var x = $(".quyenedit:checked");
            listquyen = [];
            for (var i = 0; i < x.length; i++) {
                listquyen[i] = x[i].value;
            };
            if (machucvu != '""' && tenchucvu != '""') {
                $.ajax({
                    url: "/Admin/Thongtinnguoidung/Suachucvu",
                    data: { list: listquyen, chucvu: chucvu },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {
                        if (response.status == false) {
                            alert("Bạn chưa chọn quyền");
                        } else {
                            alert("Sửa thành công");
                            location.reload();
                        }
                    }
                });
            }
        });
        $('.btnchucvuflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Thongtinnguoidung/ChangeStatusChucvu",
                data: { id: btn.data('machucvu') },
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
        // quyen
        $('#btnthemquyen').click(function (e) {
            var maquyen = '"' + $(".maquyenadd").val() + '"';
            var tenquyen = '"' + $(".tenquyenadd").val() + '"';
            var a = document.getElementById("quyenadd_Flag");
            var flagquyen = a.options[a.selectedIndex].value;
            var quyen = "{\"Maquyen\": " + maquyen + ", \"Tenquyen\": " + tenquyen + ", \"Flag\" : " + "\"" + flagquyen + "\" }";
            if (maquyen != '""' && tenquyen != '""') {
                $.ajax({
                    url: "Thongtinnguoidung/Themquyen",
                    data: { quyen: quyen },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {
                        if (response.status == false) {
                            alert("Quyền đã tồn tại");
                        } else {
                            alert("Thêm thành công");
                            location.reload();
                        }
                    }
                });
            } else {
                alert("Bạn chưa nhập thông tin");
            }
        });
        $('.btnloadquyen').click(function (e) {
            e.preventDefault();
            var btn = $(this).closest('tr');
            $.ajax({
                url: "/Admin/Thongtinnguoidung/LoadSuaquyen",
                data: { id: btn.find('.maquyen').text() },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    $(".maquyenedit").val(response.quyen.maquyen);
                    $(".tenquyenedit").val(response.quyen.tenquyen);
                }

            });
        });
        $('#btnsuaquyen').click(function (e) {
            var maquyen = '"' + $(".maquyenedit").val() + '"';
            var tenquyen = '"' + $(".tenquyenedit").val() + '"';
            var quyen = "{\"Maquyen\": " + maquyen + ", \"Tenquyen\": " + tenquyen + "}";
            if (maquyen != '""' && tenquyen != '""') {
                $.ajax({
                    url: "Thongtinnguoidung/Suaquyen",
                    data: { quyen: quyen },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {
                        alert("Sửa thành công");
                        location.reload();
                    }
                });
            } else {
                alert("Thông tin chưa đầy đủ");
            }
        });
        $(".btnquyenflag").off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Thongtinnguoidung/ChangeStatusQuyen",
                data: { id: btn.data('maquyen') },
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
thongtinnguoidung.init();