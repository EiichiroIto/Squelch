other
filesToUpdate
	"Answer a list of image files that need to have their thumbnails updated."

	| extensions imageFiles |
	extensions := #(gif jpeg jpg bmp png sprite) asSet.
	imageFiles := directory fileNames select: [:fn |
		extensions includes: (fn asFileReference extension) asLowercase asSymbol].

	^ imageFiles select: [:fn | (dict includesKey: fn) not].
