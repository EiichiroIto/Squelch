accessing
highlight: aBoolean

	| labelColor |
	isSelected = aBoolean ifTrue: [^ self].

	isSelected := aBoolean.
	isSelected
		ifTrue: [
			rolloverOn := false.
			highlightForm extent: self extent.
			currentForm := highlightForm.
			self addMorphBack: (currentForm position: (self position + (0@0))).
			labelColor := Color white]
		ifFalse: [
			currentForm ifNotNil: [
				currentForm delete.
				currentForm := nil].
			labelColor := Color gray: 0.8].

	nameMorph color: labelColor.
	"scriptCountMorph color: labelColor darker."
	self changed.
