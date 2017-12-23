accessing
currentDirectory: aDirectoryOrString
	"Set my current directory to the given FileDirectory or path String."

	| s truncated w eWidth |
	(currentDir isKindOf: ScratchServerDirectory) ifTrue: [
		fetchInProgress := false.
		currentDir stopFetching].

	(aDirectoryOrString isKindOf: String)
		ifTrue: [currentDir := aDirectoryOrString asFileReference]
		ifFalse: [currentDir := aDirectoryOrString].

	currentDir path isRoot
		ifTrue: [s := '/']
		ifFalse: [s := currentDir path segments last].

	"trim directory name to fit button, if necessary"
	truncated := false.
	eWidth := (ScratchTranslator stringExtent: '...' font: directoryBarMorph label font) x.
	w := 190 - eWidth.
	[((ScratchTranslator stringExtent: s font: directoryBarMorph label font) x) > w] whileTrue: [
		truncated := true.
		s := s copyFrom: 1 to: s size - 1].
	truncated ifTrue: [s := s, '...'].
	s = '/' ifTrue: [s := 'Computer'].
	directoryBarMorph label: s font: (ScratchFrameMorph getFont: #FilePickerDirectoryName).
	directoryBarMorph
		width: contentsPaneMorph width - 160.
	directoryBarArrowMorph right: directoryBarMorph right - 9.
	lastUpMSecs := 0.
	self getDirectoryContents.
