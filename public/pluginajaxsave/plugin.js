( function() {
	var pluginName = 'pluginajaxsave';

	// Register a plugin named "pluginajaxsave".
	CKEDITOR.plugins.add( pluginName, {
		icons: 'pluginajaxsave',
		init: function( editor ) {
			editor.ui.addButton( 'Save', {
				label: 'Cохранить',
				command: pluginName,
        click: function(editor) {
          $.ajax({
            type: "PATCH",
            url: $(editor.element.$.form).attr('action'),
            data: {page: {content: editor.getData()}},
            dataType: 'json'
          });
        },
        toolbar: 'insert'
			} );
		}
	} );
} )();
