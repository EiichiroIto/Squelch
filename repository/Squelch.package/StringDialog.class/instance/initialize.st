initialization
initialize
	"Similar to my superclass, but with a string field for the user's response."

	super initialize.

	self title: '?'.

	"create and position typeinMorph"
	mainColumn
		addMorph: (Morph new extent: (5@6); color: Color transparent);
		addMorph: (typeinMorph := StringFieldMorph
			new client: self;
			borderWidth: 2;
			color: (Color r: (211/255) g: (214/255) b: (216/255)));
		addMorph: (Morph new extent: (5@6); color: Color transparent).
	typeinMorph
		font: (ScratchFrameMorph getFont: #StringDialogTypeIn);
		width: 250.

	tabFields add: typeinMorph.
