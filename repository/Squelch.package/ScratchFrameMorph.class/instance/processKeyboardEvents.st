stepping
processKeyboardEvents

	| evt ch |
		[(evt := self nextUnclaimedKeystrokeOrNil) notNil] whileTrue: [
			ch := evt keyValue.
			evt commandKeyPressed ifTrue: [ch := ch \\ 32].	"map cmd/alt keys to control keys"
			(ch = 3) | (ch = 13) ifTrue: [^ self pressGreenFlagButton].
			ch = 15 ifTrue: [^ self openScratchProject].
			ch = 17 ifTrue: [^ self quitScratch].
			ch = 19 ifTrue: [^ self saveScratchProjectNoDialog].
			ch = 27 ifTrue: [
				TakeOverScreen ifTrue: [
					Smalltalk fullScreenMode: false.
					Smalltalk fullScreenMode: true.
					World restoreDisplay].
				^ self].
			workPane broadcastEventNamed: 'Scratch-KeyPressedEvent' with: evt]