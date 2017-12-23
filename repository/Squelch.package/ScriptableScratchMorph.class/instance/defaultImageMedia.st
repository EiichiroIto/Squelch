media
defaultImageMedia
	"Placeholder image media."

	^ ImageMedia new
		form: (Form extent: 8@8 depth: 8) fillWhite;
		mediaName: ('costume' localized, '1')
