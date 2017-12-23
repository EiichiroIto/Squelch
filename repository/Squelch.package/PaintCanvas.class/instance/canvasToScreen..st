private
canvasToScreen: aPoint
	"Answer the given canvas point in screen coordinates."

	^ bounds origin + ((aPoint - (scrollX@scrollY)) * scale) rounded
