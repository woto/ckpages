// Register the plugin within the editor.
CKEDITOR.plugins.add( 'pluginupload', {

	// Register the icons.
	icons: 'pluginupload',

	// The plugin initialization logic goes inside this method.
	init: function( editor ) {

    // ACF
    editor.addFeature({allowedContent:"img[alt,height,!src,title,width]",requiredContent:"img"})

		// Create a toolbar button that executes the above command.
		editor.ui.addButton( 'PluginUpload', {

			// The text part of the button (if available) and tooptip.
			label: 'Закачка файлов',

      click: function (editor) { window.open('/ckpages/plugin_uploads?CKEditor=' + editor.name,'Закачка файлов','scrollbars=yes, resizable=yes, width=500, height=500'); },

			// The button placement in the toolbar (toolbar group name).
			toolbar: 'insert'
		});

	}
});
