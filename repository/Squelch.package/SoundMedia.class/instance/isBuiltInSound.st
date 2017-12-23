compressing
isBuiltInSound
	"Answer true if my sound is one of the Scratch builtin sounds."

	((mediaName = 'pop') and:
	 [originalSound samples size = ScriptableScratchMorph popSound samples size])
		ifTrue: [^ true].
	((mediaName = 'meow') and:
	 [originalSound samples size = ScriptableScratchMorph meowSound samples size])
		ifTrue: [^ true].

	^ false
