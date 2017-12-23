other
jpegCompressIfPossibleQuality: quality saveOriginal: saveFlag
	"Attempt to compress my form using JPEG at the given quality level. if saveFlag is true and I was not previously compressed, save my original (pre-compression) image so that compression can be undone later (e.g. after uploading the project)."

	| wasCompressed |
	saveFlag & quality notNil
		ifTrue: [savedForm := form]
		ifFalse: [savedForm := nil].

	wasCompressed := self jpegCompressIfPossibleQuality: quality.

	wasCompressed & saveFlag not ifTrue: [
		"show the result of doing the compression"
		form := FastJPEG uncompress: jpegBytes.
		compositeForm := nil].

	^ wasCompressed
