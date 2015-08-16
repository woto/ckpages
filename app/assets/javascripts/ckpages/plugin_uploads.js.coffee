$(document).on 'click', '#insert_files_into_ckeditor', ->
  text = $("#file").html()
  editor = $('#ckeditor-name').text()
  window.opener.CKEDITOR.instances[editor].insertHtml(text)
  window.close()
