initialization
initialize
	"Set the forms for all my UI elements, create a row to hold my buttons, and a column to hold my shortcut buttons."

	super initialize.
	self initFromForm: (ScratchFrameMorph skinAt: #dialogFrame).
	self addNoShadowFrameFromForm: (ScratchFrameMorph skinAt: #dialogFrameNoShadow).
	done := false.
	tabFields := OrderedCollection new.

	"create columns"
	mainColumn := AlignmentMorph newColumn
		color: Color transparent;
		wrapCentering: #center;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	shortcutColumn := AlignmentMorph newColumn
		color: Color transparent;
		wrapCentering: #center;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	fileInfoColumn := AlignmentMorph newColumn
		color: Color transparent;
		wrapCentering: #topLeft;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	titleBin := AlignmentMorph newRow
		color: Color transparent;
		wrapCentering: #center;
		hResizing: #spaceFill;
		vResizing: #rigid;
		height: 32.
	buttonRow := AlignmentMorph newRow
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		height: 32.

	ScratchTranslator isRTL
		ifTrue: [fileInfoColumn wrapCentering: #bottomRight]
		ifFalse: [fileInfoColumn wrapCentering: #topLeft].

	self
		addMorph: mainColumn;
		addMorph: shortcutColumn;
		addMorph: fileInfoColumn;
		addMorph: titleBin.

	mainColumn addMorph: buttonRow.

	self extent: 50@50.
