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
        $('#btnthemchuyentiep').click(function (e) {
            alert("vào hàm");
            var chuyentiep = '{"Machuyentiep":"" , "Tieude":"", "Flag":""}';
            var nguoinhan = document.getElementById("chuyentiepadd_nguoinhan").value;
            var noidungck = CKEDITOR.instances['chuyentiepadd_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            chuyentiep = JSON.parse(chuyentiep);
            chuyentiep.Machuyentiep = $('.machuyentiepadd').val();
            chuyentiep.Tieude = $('.tieudechuyentiepcadd').val();
            chuyentiep.Flag = document.getElementById("chuyentiepadd_flag").value;
            if (chuyentiep.Machuyentiep != "" && chuyentiep.Tieude != "" && noidung != "") {
                chuyentiep = JSON.stringify(chuyentiep);
                $.ajax({
                    url: "/Admin/Thongbaochuyentiep/Themchuyentiep",
                    data: { chuyentiep: chuyentiep, noidung: noidung, nguoinhan: nguoinhan },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Thông báo chuyển tiếp đã tồn tại");
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
        $('#btnsuachuyentiep').click(function (e) {
            alert("vào hàm");
            var chuyentiep = '{"Machuyentiep":"" , "Tieude":""}';
            var nguoinhan = document.getElementById("chuyentiepedit_nguoinhan").value;
            var noidungck = CKEDITOR.instances['chuyentiepedit_noidung'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            chuyentiep = JSON.parse(chuyentiep);
            chuyentiep.Machuyentiep = $('.machuyentiepedit').val();
            chuyentiep.Tieude = $('.tieudechuyentiepcedit').val();
            if (chuyentiep.Machuyentiep != "" && chuyentiep.Tieude != "" && noidung != "") {
                chuyentiep = JSON.stringify(chuyentiep);
                $.ajax({
                    url: "/Admin/Thongbaochuyentiep/Suachuyentiep",
                    data: { chuyentiep: chuyentiep, noidung: noidung, nguoinhan: nguoinhan },
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
        $('.btnloadchuyentiep').click(function (e) {
            var btn = $(this).closest('tr').find('.machuyentiep').text();
            $.ajax({
                url: "/Admin/Thongbaochuyentiep/Loadchuyentiep",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".machuyentiepedit").val(response.chuyentiep.machuyentiep);
                    document.getElementById("chuyentiepedit_nguoinhan").value = response.chuyentiep.nguoinhan;
                    $(".tieudechuyentiepedit").val(response.chuyentiep.tieude);
                    CKEDITOR.instances['chuyentiepedit_noidung'].setData(response.chuyentiep.noidung);
                }
            })
        });
        $('.btnchuyentiepflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/Thongbaochuyentiep/ChangeStatusChuyentiep",
                data: { id: btn.data('machuyentiep') },
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