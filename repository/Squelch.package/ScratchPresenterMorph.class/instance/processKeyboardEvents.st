event handling
processKeyboardEvents

	| prompter evt ch |
	prompter := stage submorphs detect: [:m | m isKindOf: ScratchPrompterMorph] ifNone: [nil].
	World hands do: [:h |
		[(evt := self nextUnclaimedKeystrokeOrNil) notNil] whileTrue: [
			ch := evt keyValue.
			ch = 27 ifTrue: [^ self exitPresentation].  "escape"
			prompter
				ifNotNil: [
					prompter dispatchKeyStroke: evt]
				ifNil: [
					(ch = 3) | (ch = 13) ifTrue: [^ self shoutGo].
					stage broadcastEventNamed: 'Scratch-KeyPressedEvent' with: evt]]].
