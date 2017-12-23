initialization
addTitleAndControls

	titleMorph := StringMorph new contents: 'myList'; font: (ScratchFrameMorph getFont: #Label).
	addItemMorph := (ImageMorph new form: (ScratchFrameMorph skinAt: #addItem)).
	resizeMorph := ScratchResizeMorph ofType: #corner.
	countMorph := StringMorph new
		contents: '0';
		font: (ScratchFrameMorph getFont: #XYReadout);
		color: (Color gray: 0.15).

	"emptyMorph is added to contents pane when list is empty"
	emptyMorph := StringMorph new
		contents: '(empty)' localized;
		font: (ScratchFrameMorph getFont: #CommentBlock).

	self addMorph: titleMorph.
	self addMorph: addItemMorph.
	self addMorph: resizeMorph.
	self addMorph: countMorph.
