drawing
drawSubmorphsOn: aCanvas
	"Display submorphs back to front, draw a bar where appropriate in between tabs"

	| f barWidth myBox clipC |
	myBox := Rectangle origin: (self bounds origin) extent: (self bounds extent x - 20)@(self bounds extent y).
	clipC := aCanvas copyClipRect: myBox.

	barWidth := self width - 7.
	submorphs reverseDo:[:m | ((m isKindOf: ResizableToggleButton2) and: [m isOn])
		ifTrue: [f := Form extent: (barWidth @ barForm height) depth: 32.
				10 to: barWidth by: barForm width do: [:x | barForm displayOn: f at: x@0 rule: Form blend]].
		f ifNotNil: [clipC translucentImage: f at: ((self left - 13) @ (m bottom - 5))].
		clipC fullDrawMorph: m].
