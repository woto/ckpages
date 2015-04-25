var nonIdempotentFunction;

nonIdempotentFunction = function() {
  CKEDITOR.replace('page_content', {
    extraPlugins: 'uploadimage,image2',
    uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
  });
};

$(document).on("ready page:load", nonIdempotentFunction);
