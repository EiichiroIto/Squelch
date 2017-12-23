looks ops
setScene: sceneName

	| sceneState |
	sceneState := sceneStates at: sceneName ifAbsent: [^ self hide].
	self show.
	self referencePosition: (sceneState at: #referencePosition).
	self setSizeTo: (sceneState at: #size).
	self heading: (sceneState at: #heading).
