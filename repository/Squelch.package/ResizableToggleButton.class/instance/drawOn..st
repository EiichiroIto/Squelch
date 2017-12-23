drawing
drawOn: aCanvas
	"Draw my normalLeft/normalEdge/normalRight forms and extend the normalEdgeForm to the width of my bounds."

	| startPoint p clipC lastX formLeft formEdge formRight |

	isOn & pressedFormLeft notNil
		ifTrue: [formLeft := pressedFormLeft.
				formEdge := pressedFormEdge.
				formRight := pressedFormRight] 
		ifFalse: [formLeft := normalFormLeft.
				formEdge := normalFormEdge.
				formRight := normalFormRight].
	
	startPoint := self bounds origin + (formLeft width@0).
	p := startPoint.
	clipC := aCanvas copyClipRect: self bounds.
	lastX := self bounds right - (formRight width) - 1.

	clipC paintImage: formLeft at: self bounds origin.
	[p x <= lastX] whileTrue: [
		clipC paintImage: formEdge at: p.
		p := (p x + formEdge width) @ p y].
	clipC paintImage: formRight at: p.
	
	
