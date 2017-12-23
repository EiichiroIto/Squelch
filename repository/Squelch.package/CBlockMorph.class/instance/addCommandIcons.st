private
addCommandIcons
	"Add additional icons to certain blocks. Do nothing if this isn't one of those blocks."

	| f |
	super addCommandIcons.

	(#(doForever doForeverIf doRepeat doUntil) includes: selector) ifTrue: [
		f := ScratchFrameMorph skinAt: #loopIcon ifAbsent: [^ self].
		loopMorph := ImageMorph new form: f.
		self addMorphBack: loopMorph].
