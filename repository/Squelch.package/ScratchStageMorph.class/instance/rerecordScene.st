looks ops
rerecordScene

	| sceneName sceneList menu |
	sceneList := self sceneNames .
	sceneList := sceneList copyFrom: 1 to: sceneList size - 3.
	menu := CustomMenu new.
	sceneList do: [:n | menu add: n action: n].
	(sceneName := menu startUp) ifNil: [^ self].

	sceneStates at: sceneName put: self backgroundIndex.
	submorphs do: [:m |
		(m isKindOf: ScratchSpriteMorph) ifTrue: [
			m recordScene: sceneName]].
