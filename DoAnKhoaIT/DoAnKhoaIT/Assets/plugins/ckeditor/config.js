/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    //config.extraPlugins = 'syntaxhighlight';
    //config.syntxhighlight_lang = 'csharp';
    //config.syntxhighlight_hideControls = true;
    config.language = 'vi';
    config.skin = 'office2013';
    config.filebrowserBrowseUrl = '/Assets/plugins/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Assets/plugins/ckfinder/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Assets/plugins/ckfinder/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/Assets/plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/Assets/plugins/Uploads';
    config.filebrowserFlashUploadUrl = '/Assets/plugins/ckfinder/core/connector/aspx/connector.aspx?command = QuickUpload & type=Flash';
    CKFinder.setupCKEditor(null, '/Assets/plugins/ckfinder/');
};
