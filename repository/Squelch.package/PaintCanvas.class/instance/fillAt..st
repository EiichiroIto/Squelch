private
fillAt: aPoint
	"Perform a fill operation starting at the given point."

	| fillStyle |
	fillStyle := palette pbFillStyle.

	#color = fillStyle ifTrue: [
		canvasForm shapeFill: palette color1 interiorPoint: aPoint].
	#erase = fillStyle ifTrue: [
		canvasForm shapeFill: Color transparent interiorPoint: aPoint].
	#hGradient = fillStyle ifTrue: [
		canvasForm shapeFillGradientFrom: palette color1 to: palette color2 at: aPoint type: #horizontal].
	#vGradient = fillStyle ifTrue: [
		canvasForm shapeFillGradientFrom: palette color1 to: palette color2 at: aPoint type: #vertical].
	#rGradient = fillStyle ifTrue: [
		canvasForm shapeFillGradientFrom: palette color1 to: palette color2 at: aPoint type: #radial].

	self changed.