media
importMedia: fileName
	"Import a new image from a file and add it to my media."

	| extension elList baseName fList isFirst |
	extension := FileDirectory extensionFor: fileName asLowercase.

	elList := OrderedCollection new.

	(#(aif aiff wav mp3) includes: extension) ifTrue: [
		baseName := self mediaNameFromFileName: fileName default: 'sound'.
		[elList addLast: (SoundMedia new loadFile: fileName)] ifError: [^ self]].

	(#(jpg jpeg gif bmp png) includes: extension) ifTrue: [
		baseName := self
			mediaNameFromFileName: fileName
			default: self defaultImageMedia mediaName.
		fList := OrderedCollection new.
		extension = 'gif' 
			ifTrue: 
				[[fList := (GIFReadWriter new on: (FileStream oldFileNamed: fileName)) nextImageSet] ifError: [^ self]]
			ifFalse: 
				[[fList addLast: (Form fromFileNamed: fileName)] ifError: [^ self]].
		fList do: [:f | 
			elList addLast: (ImageMedia new form: (ScratchFrameMorph scaledFormForPaintEditor: f))]].

	elList isEmpty ifTrue: [^ self].  "unknown file type; ignore"

	isFirst := true.
	elList do: [:el | 
		el mediaName: (self unusedMediaNameFromBaseName: baseName).
		media addLast: el.
		isFirst ifTrue: [
			isFirst := false. 
			el isSound ifFalse: [self lookLike: el mediaName]]].
	
	self updateMediaCategory.
