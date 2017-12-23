initialization
initialize

	super initialize.
	mediaName := 'costume' localized, '1'.
	form := (Form extent: 8@8 depth: 4) fillWhite.
	rotationCenter := form extent // 2.	"relative to the top-left corner of the Form"
	textBox := nil.
	jpegBytes := nil.
	compositeForm := nil.
