all
toggleWatcher
	"Toggle between hiding and showing a list watcher for this block."

	| listMorph stage |
	listMorph := receiver lists at: commandSpec ifAbsent: [^ self].
	listMorph owner
		ifNil: [
			(stage := receiver meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].
			stage addMorph: listMorph.
			(stage bounds containsPoint: listMorph topLeft) ifFalse: [
				listMorph position: stage topLeft + 10].
			listMorph
				fixLayoutForNewLanguage;
				startStepping]
		ifNotNil: [
			listMorph delete].
