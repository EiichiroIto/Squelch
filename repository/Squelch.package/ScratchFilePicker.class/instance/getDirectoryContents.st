private
getDirectoryContents
	"Generate and layout the morphs in my contents pane from the files and folder in the current directory."

	feedbackMorph delete.

	(currentDir isKindOf: FileReference)
		ifTrue: [^ self getLocalDirectoryContents].

	"remote case: start fetching directory contents and give feedback that fetch is started"
	feedbackMorph
		contents: 'Reading from ', currentDir serverName, '...';
		position: self topLeft + (20@60).

	contentsPaneMorph contents removeAllMorphs.
	contentsPaneMorph vScrollRelative: 0.
	self addMorphFront: feedbackMorph.
	fetchInProgress := true.
