other
revertToUncompressed
	"Revert to my original, uncompressed Form after compression with the 'saveOriginal' flag."

	savedForm ifNotNil: [
		form := savedForm.
		compositeForm := nil.
		jpegBytes := nil.
		savedForm := nil].
