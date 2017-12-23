accessing
defaultImageMedia

	^ ImageMedia new
		form: self class defaultBackgroundForm;
		mediaName: ('background' localized, '1')
