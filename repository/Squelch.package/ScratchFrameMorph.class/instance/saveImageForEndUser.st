menu/button actions
saveImageForEndUser

	(self confirm: '
Close non-Scratch windows and save this
image in end-user (fillScreen) mode?') ifFalse: [^ self].

	ScratchFrameMorph isXO ifTrue: [Preferences useLargeFonts].

	self setLanguage: 'en'.
	World submorphs do: [:m |
		(m isKindOf: SystemWindow) ifTrue: [m delete]].
	self clearStage.

	Display newDepth: 32.
	self fillScreenOn.
	World doOneCycleNow.
	Smalltalk snapshot: true andQuit: true.
	self startup.
	Sensor useOSEvents: true.
