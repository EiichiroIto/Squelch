private
newContents: listOfStrings
	"Set my contents to the given collection of strings."

	scrollPane contents
		removeAllMorphs;
		top: scrollPane top;
		extent: scrollPane extent.

	cellMorphs := cellMorphs species new: ((2 * listOfStrings size) max: 1000).
	numberMorphs := #().

	listOfStrings do: [:s | cellMorphs addLast: (self createCell: s)].
	self updateContents.
