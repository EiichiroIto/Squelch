private
stopPlaying
	"Stop playing all movies and sounds."

	| firstCostume |
	costume stopPlaying.
	self filterReset.
	self setVolumeTo: 100.  "reset volume"

	"exit camera mode"
	(costume isKindOf: CameraMedia) ifTrue: [
		firstCostume := media detect: [:el | el isImage] ifNone: [^ self].
		self lookLike: firstCostume mediaName].
