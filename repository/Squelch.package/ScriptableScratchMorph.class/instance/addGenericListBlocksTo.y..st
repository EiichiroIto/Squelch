blocks
addGenericListBlocksTo: page y: startY
	"Add the generic list blocks to the given page starting at the given y offset."

	| addButton deleteButton x y hasLists stage |
	addButton := ScratchFrameMorph
		buttonLabel: 'Make a list' localized
		selector: #addList.
	(self isKindOf: ScratchStageMorph) ifTrue: [addButton actionSelector: #addGlobalList].

	deleteButton := ScratchFrameMorph
		buttonLabel: 'Delete a list' localized
		selector: #deleteList.

	x := 13.
	y := startY + 10.
	page addMorph: (addButton target: self; position: x@y).
	y := addButton bottom + 3.
	hasLists := self listVarNames size > 0.
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		stage listVarNames size > 0 ifTrue: [hasLists := true]].
	hasLists ifFalse: [^ self].

	page addMorph: (deleteButton target: self; position: x@y).
	y := deleteButton bottom + 10.

	y := (self addListReportersTo: page x: x y: y) + 10.

	(self blocksFor: 'list') do: [:blockOrSym |
		(blockOrSym = #-) | (blockOrSym = #~)
			ifTrue: [
				(blockOrSym = #-) ifTrue: [y := y + 15].	"insert a full space"
				(blockOrSym = #~) ifTrue: [y := y + 5]]	"insert a half space"
			ifFalse: [
				y := self createBlock: blockOrSym atPosition: x@y onPage: page.
				page submorphs last color: ScriptableScratchMorph listBlockColor]].
