drawing
drawSubmorphsOn: aCanvas
	"Clip submorph drawing to my bounds."

	| r |
	r := self bounds.
	rolloverOn | isSelected ifTrue: [r := r insetBy: 3].
	super drawSubmorphsOn: (aCanvas copyClipRect: r).

