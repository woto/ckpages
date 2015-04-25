var ckeditor_init = function() {
  CKEDITOR.replace('page_content', {
    extraPlugins: 'uploadimage,image2',
    uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
  });
}

var ckeditor_load = function() {
  ckeditor_init();
};

$(document).on("ready page:load", ckeditor_load);
