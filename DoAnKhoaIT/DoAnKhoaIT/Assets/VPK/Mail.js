var mail = {
    init: function () {
        mail.RegisterEvents()
    },
    RegisterEvents: function () {
        $("#btnguimail").click(function () {
            alert("vao ham");
            var nguoinhan = $("#taikhoannhan").val();
            var chude = $("#tieude").val();
            var noidung = $("#noidung").val();
            $.ajax({
                url: "/Admin/Mail/Soanthu",
                type: "POST",
                dataType: "json",
                data: { nguoinhan: nguoinhan, chude: chude, noidung: noidung },
                success: function (response) {
                    
                }
            });
        });
    }
}
mail.init();