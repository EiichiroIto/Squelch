looks ops
showScene: sceneName

	(sceneStates includesKey: sceneName) ifTrue: [
		self showBackground: (sceneStates at: sceneName)].

	submorphs do: [:m |
		(m isKindOf: ScratchSpriteMorph) ifTrue: [
			m setScene: sceneName]].
