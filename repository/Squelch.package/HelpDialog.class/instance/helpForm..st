other
helpForm: anImage

	| f |
	f := anImage.
	(f isKindOf: ColorForm) ifTrue: [
		f := f copy.
		f colors: (f colors collect: [:c | c isTransparent ifTrue: [Color black] ifFalse: [c]])].

	imageMorph form: f.
