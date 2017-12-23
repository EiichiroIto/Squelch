event handling
mouseEnterDragging: evt
	"Switch the tabs to script if a block is current being dragged"

	| scriptEditorMorph |
	scriptEditorMorph := self meOrOwnerThatIsA: ScratchScriptEditorMorph.
	(scriptEditorMorph currentCategory = 'Scripts') ifFalse:[
		scriptEditorMorph currentCategory: 'Scripts'].
