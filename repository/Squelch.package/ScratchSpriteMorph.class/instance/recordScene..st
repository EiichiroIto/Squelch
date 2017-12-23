looks ops
recordScene: sceneName

	| state |
	self visible ifFalse: [
		sceneStates removeKey: sceneName ifAbsent: [].
		^ self ].

	state := Dictionary new.
	state at: #referencePosition put: self referencePosition.
	state at: #size put: self scale.
	state at: #heading put: self heading.
	sceneStates at: sceneName put: state.
