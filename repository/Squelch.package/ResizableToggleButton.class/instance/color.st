accessing
color

	isOn
		ifNotNil:[isOn
			ifTrue:[^ pressedFormEdge colorAt: ((pressedFormEdge width // 2)@(pressedFormEdge height // 2))]
			ifFalse:[^ normalFormEdge colorAt: ((normalFormEdge width // 2)@(normalFormEdge height // 2))]]
		ifNil:[^ super color].