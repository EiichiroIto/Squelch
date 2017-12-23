private
addCommandIcons
	"Add additional icons to certain blocks. Do nothing if this isn't one of those blocks."

	| f m |
	#turnLeft: = selector ifTrue: [
		f := ScratchFrameMorph skinAt: #turnCCW ifAbsent: [^ self].
		m := self firstSubmorph delete.
		self addMorphFront: (ImageMorph new form: f).
		self addMorphFront: m].

	#turnRight: = selector ifTrue: [
		f := ScratchFrameMorph skinAt: #turnCW ifAbsent: [^ self].
		m := self firstSubmorph delete.
		self addMorphFront: (ImageMorph new form: f).
		self addMorphFront: m].

	#stopAll = selector ifTrue: [
		f := ScratchFrameMorph skinAt: #stopButton ifAbsent: [^ self].
		self addMorphBack: (ImageMorph new form: f)].
