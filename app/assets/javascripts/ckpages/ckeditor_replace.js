var ckeditor_replace = function() {
  CKEDITOR.replace('page_content', {
    extraPlugins: 'uploadimage,image2,embed',
    uploadUrl: ckpages_uploads_path,
    height: '400'
  });
}
