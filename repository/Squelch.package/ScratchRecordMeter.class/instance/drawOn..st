drawing
drawOn: aCanvas

	| clipC p width |

	super drawOn: aCanvas.

	p := self topLeft + (1@1).
	clipC := aCanvas copyClipRect: self bounds.
	
	(level = 0) ifTrue: [
		lineForm fillColor: Color green.
		clipC paintImage: lineForm at: p.
		^ self].
	
	[(p x - self topLeft x) <= level] whileTrue: [
		width := p x - self topLeft x.
		(width > 0) ifTrue: [lineForm fillColor: Color green].
		(width > 150) ifTrue: [lineForm fillColor: Color yellow].
		(width > 230) ifTrue: [lineForm fillColor: Color red].
		clipC paintImage: lineForm at: p.
		p := (p x + (lineForm width * 3)) @ p y].