private
projectIsEmpty
	"Answer true if the current project has no scripts, no variables, no special costumes or sounds, and at most a single sprite."

	| allScriptables defaultCostumes defaultSnds |
	"at most one sprite in workpane?"
	workPane submorphs size > 1 ifTrue: [^ false].
	workPane submorphs size = 1 ifTrue: [
		(workPane submorphs first isKindOf: ScratchSpriteMorph) ifFalse: [^ false]].

	allScriptables := workPane submorphs copyWith: workPane.
	defaultCostumes := Set
		with: ScriptableScratchMorph defaultBackgroundForm.
	defaultSnds := Set
		with: ScriptableScratchMorph popSound
		with: ScriptableScratchMorph meowSound.

	ScratchFrameMorph defaultSprite ifNotNil: [
		ScratchFrameMorph defaultSprite media do: [:media |
			media isImage ifTrue: [defaultCostumes add: media form].
			media isSound ifTrue: [defaultSnds add: media sound]]].

	allScriptables do: [:m |
		m blocksBin submorphs size > 0 ifTrue: [^ false].  "any stacks?"
		m varNames size > 1 ifTrue: [^ false].  "any variables?"
		m media do: [:media |
			(media isImage and: [(defaultCostumes includes: media form) not]) ifTrue: [^ false].
			(media isSound and: [(defaultSnds includes: media sound) not]) ifTrue: [^ false]]].

	^ true
