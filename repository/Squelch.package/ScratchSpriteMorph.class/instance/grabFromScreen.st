right button menu
grabFromScreen
	"Set my form to be a rectangular portion of the screen."

	| f el |
	(f := self grabFormFromScreen) ifNil: [^ self].
	el := ImageMedia new form: f.
	el mediaName: (self unusedMediaNameFromBaseName: 'costume1').
	media addLast: el.
	self lookLike: el mediaName.
	self updateMediaCategory.
