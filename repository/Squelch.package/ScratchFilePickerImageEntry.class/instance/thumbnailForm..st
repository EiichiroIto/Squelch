accessing
thumbnailForm: aForm
	"Set my thumbnail form."

	thumbnailForm := aForm.
	thumbnailMorph top: self bottom - thumbnailForm height - 23.
	thumbnailMorph left: self left + ((self width - thumbnailForm width) // 2).
	thumbnailMorph form: thumbnailForm.

