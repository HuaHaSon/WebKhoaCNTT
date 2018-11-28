var congtacgiaovien = {
    init: function () {
        congtacgiaovien.RegisterEvents()
    },
    RegisterEvents: function () {
        var noidungchitietcongtacadd = CKEDITOR.replace('chitietcongtacadd_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var thanhphanchitietcongtacadd = CKEDITOR.replace('chitietcongtacadd_thanhphan', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var noidungchitietcongtacedit = CKEDITOR.replace('chitietcongtacedit_noidung', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        var thanhphanchitietcongtacedit = CKEDITOR.replace('chitietcongtacedit_thanhphan', {
            customConfig: '/Assets/plugins/ckeditor/config.js',
        });
        $(document).ready(function () {
            var table = $('#congtacTable').DataTable({
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
            var table2 = $('#chitietcongtacTable').DataTable({
                "order": [[1, "desc"]],
                "paging": true,
                "ordering": true,
                "info": true,
                "columnDefs": [  // dinh dang column

                    {
                        "targets": [10],
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
            $('#tcongtac.toggle-vis').on('click', function (e) {
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
            $('#tchitietcongtac.toggle-vis').on('click', function (e) {
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
        $('#btnthemcongtac').click(function (e) {
            var congtac = '{"MaCT":"" , "TenCT":"", "Flag":""}';
            congtac = JSON.parse(congtac);
            congtac.MaCT = $('.macongtacadd').val();
            congtac.TenCT = $('.tencongtacadd').val();
            congtac.flag = document.getElementById("congtacadd_flag").value;
            if (congtac.MaCT != "" && congtac.TenCT != "") {
                congtac = JSON.stringify(congtac);
                $.ajax({
                    url: "/Admin/congtacgiaovien/Themcongtac",
                    data: { congtac: congtac },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Loại công tác đã tồn tại");
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
        $('#btnsuacongtac').click(function (e) {
            var congtac = '{"MaCT":"" , "TenCT":""}';
            congtac = JSON.parse(congtac);
            congtac.MaCT = $('.macongtacedit').val();
            congtac.TenCT = $('.tencongtacedit').val();
            
            if (congtac.MaCT != "" && congtac.TenCT != "") {
                congtac = JSON.stringify(congtac);
                $.ajax({
                    url: "/Admin/congtacgiaovien/Suacongtac",
                    data: { congtac: congtac },
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
        $('.btnloadcongtac').click(function (e) {
            var btn = $(this).closest('tr').find('.macongtac').text();
            $.ajax({
                url: "/Admin/congtacgiaovien/Loadcongtac",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".macongtacedit").val(response.congtac.macongtac);
                    $(".tencongtacedit").val(response.congtac.tencongtac);
                }
            })
        });
        $('.btncongtacflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/congtacgiaovien/ChangeStatusCongtac",
                data: { id: btn.data('macongtac') },
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
        $('#btnthemchitietcongtac').click(function (e) {
            alert("vào hàm");
            var chitietcongtac = '{"MaCTCTGV":"" , "MaCT":"", "NgayCT":"", "Diadiem":"","Chutri":"","Bosung":"", "Flag":""}';
            var noidungck = CKEDITOR.instances['chitietcongtacadd_noidung'].getData();
            var thanhphanck = CKEDITOR.instances['chitietcongtacadd_thanhphan'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            thanhphan = thanhphanck.replace(/</g, '&quirk');
            chitietcongtac = JSON.parse(chitietcongtac);
            chitietcongtac.MaCTCTGV = $('.machitietcongtacadd').val();
            chitietcongtac.Diadiem = $('.diadiemchitietcongtacadd').val();
            chitietcongtac.Chutri = $('.chutrichitietcongtacadd').val();
            chitietcongtac.Bosung = $('.bosungchitietcongtacadd').val();
            chitietcongtac.NgayCT = $('.ngaycongtacchitietcongtacadd').val();
            chitietcongtac.MaCT = document.getElementById("chitietcongtacadd_macongtac").value;
            chitietcongtac.Flag = document.getElementById("chitietcongtacadd_flag").value;
            if (chitietcongtac.MaCTCTGV != "" && chitietcongtac.NgayCT != "" && noidung != "" && thanhphan != "" && chitietcongtac.Diadiem != "" && chitietcongtac.Chutri ) {
                chitietcongtac = JSON.stringify(chitietcongtac);
                $.ajax({
                    url: "/Admin/congtacgiaovien/Themchitietcongtac",
                    data: { chitietcongtac: chitietcongtac, noidung: noidung, thanhphan: thanhphan },
                    type: "POST",
                    dataType: "Json",
                    success: function (response) {
                        if (response.status == false) alert("Chi tiết công tác đã tồn tại");
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
        $('#btnsuachitietcongtac').click(function (e) {
            alert("vào hàm 2");
            var chitietcongtac = '{"MaCTCTGV":"" , "MaCT":"", "NgayCT":"", "Diadiem":"","Chutri":"","Bosung":""}';
            var noidungck = CKEDITOR.instances['chitietcongtacedit_noidung'].getData();
            var thanhphanck = CKEDITOR.instances['chitietcongtacedit_thanhphan'].getData();
            noidung = noidungck.replace(/</g, '&quirk');
            thanhphan = thanhphanck.replace(/</g, '&quirk');
            chitietcongtac = JSON.parse(chitietcongtac);
            chitietcongtac.MaCTCTGV = $('.machitietcongtacedit').val();
            chitietcongtac.Diadiem = $('.diadiemchitietcongtacedit').val();
            chitietcongtac.Chutri = $('.chutrichitietcongtacedit').val();
            chitietcongtac.Bosung = $('.bosungchitietcongtacedit').val();
            chitietcongtac.NgayCT = $('.ngaysukienchitietcongtacedit').val();
            chitietcongtac.MaCT = document.getElementById("chitietcongtacedit_macongtac").value;
            if (chitietcongtac.MaCTCTGV != "" && chitietcongtac.NgayCT != "" && noidung != "" && thanhphan != "" && chitietcongtac.Diadiem != "" && chitietcongtac.Chutri) {
                chitietcongtac = JSON.stringify(chitietcongtac);
                $.ajax({
                    url: "/Admin/congtacgiaovien/Suachitietcongtac",
                    data: { chitietcongtac: chitietcongtac, noidung: noidung, thanhphan: thanhphan },
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
        $('.btnloadchitietcongtac').click(function (e) {
            alert("vao ham");
            var btn = $(this).closest('tr').find('.machitietcongtac').text();
            $.ajax({
                url: "/Admin/congtacgiaovien/Loadchitietcongtac",
                data: { id: btn },
                type: "POST",
                dataType: "Json",
                success: function (response) {
                    $(".machitietcongtacedit").val(response.chitietcongtac.mactct);
                    document.getElementById("chitietcongtacedit_macongtac").value = response.chitietcongtac.mact;
                    $(".ngaycongtacchitietcongtacedit").val(response.chitietcongtac.ngayct);
                    $(".diadiemchitietcongtacedit").val(response.chitietcongtac.diadiem);
                    $(".chutrichitietcongtacedit").val(response.chitietcongtac.chutri);
                    $(".bosungchitietcongtacedit").val(response.chitietcongtac.bosung);
                    CKEDITOR.instances['chitietcongtacedit_noidung'].setData(response.chitietcongtac.noidung);
                    CKEDITOR.instances['chitietcongtacedit_thanhphan'].setData(response.chitietcongtac.thanhphan);
                }
            })
        });
        $('.btnchitietcongtacflag').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            $.ajax({
                url: "/Admin/congtacgiaovien/ChangeStatusChitietcongtac",
                data: { id: btn.data('machitietcongtac') },
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
congtacgiaovien.init();