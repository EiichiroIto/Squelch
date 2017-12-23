private
screenToCanvas: aPoint
	"Answer the given screen point in canvas coordinates."

	^ ((aPoint - bounds origin) // scale) + (scrollX@scrollY)
