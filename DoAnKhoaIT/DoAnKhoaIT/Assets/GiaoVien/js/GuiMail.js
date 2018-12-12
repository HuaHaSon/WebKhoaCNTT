var guimail = {
    init: function (){
        guimail.RegisterEvents()
    },
    RegisterEvents: function () {

        var noidungmail = CKEDITOR.replace('noidungmail', {
            customConfig: '/Assets/plugins/ckeditor/config3.js',
        });
    }

}
guimail.init();