other
jpegCompressIfPossibleQuality: quality
	"Attempt to compress my form using JPEG at the given quality level. If successful, save the compressed JPEG data in my jpegBytes instance variable. If JPEG compression does not yield a sufficient savings, then set jpegBytes to nil. If jpegBytes is non-nil when I am saved, then my form will not be saved and the form will be reconstructed from the JPEG data when this media is read back in. Answer true if JPEG compression was done."

	| oldSz tally |
	jpegBytes ifNotNil: [^ false].

	form unhibernate.
	(form isKindOf: ColorForm)
		ifTrue: [
			(form colorsUsed includes: Color transparent) ifTrue: [^ false]]
		ifFalse: [
			form depth > 1 ifTrue: [
				tally := form tallyPixelValues.
				(tally at: 1) > 0 ifTrue: [^ false]]].  "contains transparent pixels"

	"no transparency; attempt jpeg compression"
	form hibernate.
	oldSz := form bitsSize.
	jpegBytes := PluginBasedJPEGReadWriter new compress: form quality: quality.
	jpegBytes size <= (oldSz // 3)
		ifFalse: [jpegBytes := nil].  "not enough savings; don't use JPEG"

	^ jpegBytes notNil
