other
updateThumbnails
	"Update my dictionary by creating thumbnails for all the image files in my directory. If updates were needed, try to save save the thumbnails cache."

	| didRemove fList n thumb buf fSize |
	didRemove := self removeObsoleteEntries.
	fList := self filesToUpdate.

	fList size > 0 ifTrue: [
		n := 0.
		('Updating thumbnails' localized, ScratchTranslator ellipsesSuffix)
			displayProgressAt: Display center
			from: 0 to: fList size
			during: [:bar |
				fList do: [:fn |
					bar value: n.
					thumb := nil.
					[
						buf := (FileStream readOnlyFileNamed: (directory fullNameFor: fn)) binary contentsOfEntireFile.
						(fn asLowercase endsWith: '.sprite')
							ifTrue: [thumb := self thumbnailFromSpriteData: buf]
							ifFalse: [thumb := self thumbnailFromImageData: buf].
					] ifError: [].
					fSize := fileSizes at: fn ifAbsent: [0].
					thumb ifNotNil: [dict at: fn put: (Array with: fSize with: thumb colorReduced)].
					n := n + 1]]].

	(didRemove | (fList size > 0) | (dict size = 0)) ifTrue: [self writeThumbnailFile].
