looks ops
newScene

	| sceneName |
	sceneName := StringDialog ask: 'Enter Scene Name:'.
	sceneName size = 0 ifTrue: [ ^ self ].

	sceneStates at: sceneName put: self backgroundIndex.
	submorphs do: [:m |
		(m isKindOf: ScratchSpriteMorph) ifTrue: [
			m recordScene: sceneName]].
