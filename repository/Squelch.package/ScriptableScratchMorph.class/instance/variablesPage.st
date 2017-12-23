blocks
variablesPage
	"Answer a morph containing my variables."

	| page addButton deleteButton hasVars stage x y maxX |
	page := ScratchBlockPaletteMorph new
		color: (Color r: 0.8 g: 0.8 b: 1.0);
		borderWidth: 0.

	addButton := ScratchFrameMorph
		buttonLabel: 'Make a variable' localized
		selector: #addGlobalVariable.
	(self isKindOf: ScratchSpriteMorph) ifTrue: [addButton actionSelector: #addVariable].

	deleteButton := ScratchFrameMorph
		buttonLabel: 'Delete a variable' localized
		selector: #deleteVariable.

	x := 13.
	page addMorph: (addButton target: self; position: x@7).
	y := addButton bottom + 3.

	hasVars := self varNames size > 0.
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		stage varNames size > 0 ifTrue: [hasVars := true]].

	hasVars ifTrue: [
		page addMorph: (deleteButton target: self; position: x@y).
		y := deleteButton bottom + 10.

		y := self addVariableReportersTo: page x: x y: y.
		y := y + 12.
		y := self addGenericVariableBlocksTo: page x: x y: y].

	self addGenericListBlocksTo: page y: y.
	page updateWatcherButtonsForFrame: (self meOrOwnerThatIsA: ScratchFrameMorph).
	maxX := page submorphs inject: 0 into: [:t :m | t max: m right].
	page extent: (maxX + 10) @ y.
	^ page
