

var thongtinnguoidung = {
    init: function () {
        thongtinnguoidung.RegisterEvents()
    },
    RegisterEvents: function () {
        $('.btntaikhoanflag').off('click').on('click', function (e) {
            alert("Vào hàm");
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Thongtinnguoidung/ChangeStatus",
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
        $(".btnsuataikhoan").click(function (e) {
            e.preventDefault();
            var btn = $(this).closest('tr');
            $.ajax({
                url: "/Admin/Thongtinnguoidung/LoadSuataikhoan",
                data: { id: btn.find('.tentaikhoan').text() },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    document.getElementById("mySelect").value = response.Jtaikhoan.machucvu;
                    $(".tentaikhoanedit").val(response.Jtaikhoan.tentaikhoan);
                    $(".matkhautaikhoanedit").val(response.Jtaikhoan.matkhau);
                    $(".mailtaikhoanedit").val(response.Jtaikhoan.mail);
                    $(".hotenuseredit").val(response.Jtaikhoan.hoten);
                    $(".ngaysinhuseredit").val(response.Jtaikhoan.ngaysinh);
                    $(".sdtuseredit").val(response.Jtaikhoan.sdt);
                    $(".quequanuseredit").val(response.Jtaikhoan.quequan);
                }
            });
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
        $('.btnthemchucvu').click(function (e) {
            //alert('vao ham');
            var machucvu = '"' + $('.machucvuadd').val() + '"';
            var tenchucvu = '"' + $('.tenchucvuadd').val() + '"';
            var a = document.getElementById("chucvu_Flag");
            var flagchucvu = a.options[a.selectedIndex].value;
            var chucvu =
                " { \"Machucvu\": " + machucvu + ", \"Tenchucvu\":" + tenchucvu + ", \"Flag\":" + "\"" + flagchucvu + "\"" + "}";

            var x = $(".quyenadd:checked");
            //alert(x.length);
            listquyen = [];
            for (var i = 0; i < x.length; i++) {
                listquyen[i] = x[i].value;

            };
            if (machucvu != "\"\"" && tenchucvu != "\"\"")
                $.ajax({
                    url: "/Admin/Thongtinnguoidung/Themchucvu",
                    data: { list: listquyen, chucvu: chucvu },
                    dataType: "json",
                    type: "POST",
                    success: function (response) {

                        if (status == "1") {
                            alert("Chức vụ đã tồn tại");
                        } else {
                            alert("Thêm thành công");

                            $('#themchucvu').modal('hide');

                            var t = $('#chucvuTable').DataTable();
                            var flagstyle = "<span class='text-info'> Không khóa </span>";
                            if (flagchucvu == "false") {
                                flagstyle = "<span class='text-danger'> Khóa </span>"
                            }

                            t.row.add([
                                $('.machucvuadd').val(),
                                $('.tenchucvuadd').val(),
                                flagstyle,
                                "<button class='btnsuachucvu' type='button' data-toggle='modal' data-target='#suachucvu' style='background-color: transparent; border: none'> <i class='fa fa-pencil-square-o' style = 'color:red'> </i > </button >"

                            ]).draw(false);
                            $('.machucvuadd').val("");
                            $('.tenchucvuadd').val("");

                            for (var i = 0; i < x.length; i++) {
                                x[i].checked = false;
                            };

                        }

                    }
                });
            else
                alert("Bạn chưa nhập thông tin");
        });
        $('.btnthemtaikhoan').click(function (e) {
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
                        $('#themtaikhoan').modal('hide');
                    }

                }
            });
        });
    }
}
thongtinnguoidung.init();