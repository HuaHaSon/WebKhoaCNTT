var thongbaochuyentiep = {
    init: function () {
        thongbaochuyentiep.RegisterEvents()
    },
    RegisterEvents: function () {
        //do logic here
        var chuyentiepadd = CKEDITOR.replace('chuyentiepadd_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var chuyentiepedit = CKEDITOR.replace('chuyentiepedit_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        $(document).ready(function () {
            var table = $('#chuyentiepTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [6],
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
            $('#tchuyentiep.toggle-vis').on('click', function (e) {
                alert("vao ham");
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
            

        });
        // nội dung biểu mẫu
        $('#btnthemnoidungdaotao').click(function (e) {
            alert("vào hàm");
            var noidungdaotao = '{"MaNDDT":"" , "MaloaiDT":"", "Tieude":"", "Flag":""}';
            var noidungck = CKEDITOR.instances['noidungdaotaoadd_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            noidungdaotao = JSON.parse(noidungdaotao);
            noidungdaotao.MaNDDT = $('.manoidungdaotaoadd').val();
            noidungdaotao.Tieude = $('.tieudenoidungdaotaoadd').val();
            noidungdaotao.MaloaiDT = document.getElementById("noidungdaotaoadd_maloai").value;
            noidungdaotao.Flag = document.getElementById("noidungdaotaoadd_flag").value;
            if (noidungdaotao.MaNDDT != "" && noidungdaotao.Tieude != "" && noidung != "") {
                noidungdaotao = JSON.stringify(noidungdaotao);
                $.ajax({
                    url: "/Admin/Daotao/Themnoidungdaotao",
                    data: { noidungdaotao: noidungdaotao, noidung: noidung },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Nội dung đào tạo đã tồn tại");
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
        $('#btnsuanoidungdaotao').click(function (e) {
            alert("vào hàm");
            var noidungdaotao = '{"MaNDDT":"" , "MaloaiDT":"", "Tieude":""}';
            var noidungck = CKEDITOR.instances['noidungdaotaoedit_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            noidungdaotao = JSON.parse(noidungdaotao);
            noidungdaotao.MaNDDT = $('.manoidungdaotaoedit').val();
            noidungdaotao.Tieude = $('.tieudenoidungdaotaoedit').val();
            noidungdaotao.MaloaiDT = document.getElementById("noidungdaotaoedit_maloai").value;
            if (noidungdaotao.MaNDDT != "" && noidungdaotao.Tieude != "" && noidung != "") {
                noidungdaotao = JSON.stringify(noidungdaotao);
                $.ajax({
                    url: "/Admin/Daotao/Suanoidungdaotao",
                    data: { noidungdaotao: noidungdaotao, noidung: noidung },
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
        $('.btnloadnoidungdaotao').click(function (e) {
            var btn = $(this).closest('tr').find('.manoidungdaotao').text();
            $.ajax({
                url: "/Admin/Daotao/Loadnoidungdaotao",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".manoidungdaotaoedit").val(response.noidungdaotao.MaNDDT);
                    document.getElementById("noidungdaotaoedit_maloai").value = response.noidungdaotao.MaLDT;
                    $(".tieudenoidungdaotaoedit").val(response.noidungdaotao.Tieude);
                    CKEDITOR.instances['noidungdaotaoedit_noidung'].setData(response.noidungdaotao.Noidung);
                }
            })
        });
        $('.btnnoidungdaotaoflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Daotao/ChangeStatusNoidungdaotao",
                data: { id: btn.data('manoidungdaotao') },
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
thongbaochuyentiep.init();