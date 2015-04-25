jQuery.cachedScript = function( url, options ) {
  options = $.extend( options || {}, {
    dataType: "script",
    cache: true,
    url: url
  });
  return jQuery.ajax( options );
};

var ckeditor_init = function() {
  CKEDITOR.replace('page_content', {
    extraPlugins: 'uploadimage,image2',
    uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
  });
}

var nonIdempotentFunction = function() {
  jQuery.cachedScript("/ckeditor/ckeditor.js" ).done(function( script, textStatus ) {
    ckeditor_init();
  });
};

$(document).on("ready page:load", nonIdempotentFunction);
