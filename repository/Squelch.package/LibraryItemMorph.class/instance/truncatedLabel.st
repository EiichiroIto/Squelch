private
truncatedLabel
	"Answer the label string to used as the name morph."

	| ellipses s w n |

	nameMorph contents = target objName ifFalse: [
		n := target objName.
		ellipses := ScratchTranslator ellipsesSuffix.
		1 to: n size do: [:i |
			s := n copyFrom: 1 to: i.
			w := nameMorph stringWidth: (s, ellipses).
			w > (self width - 3) ifTrue: [
				^ (n copyFrom: 1 to: i - 1), ellipses]]].

	^ target objName
