private
zoomRectFrom: startRect to: finalRect

	| steps r p1 p2 |
	steps := 8.
	r := startRect.
	Display border: r width: 2 rule: Form reverse fillColor: Color gray.
	Display forceDisplayUpdate.
	0 to: steps do: [:i |
		(Delay forMilliseconds: 35) wait.
		Display border: r width: 2 rule: Form reverse fillColor: Color gray.
		Display forceDisplayUpdate.
		p1 := startRect origin + ((i * (finalRect origin - startRect origin)) // steps).
		p2 := startRect corner + ((i * (finalRect corner - startRect corner)) // steps).
		r := p1 corner: p2.
		Display border: r width: 2 rule: Form reverse fillColor: Color gray.
		Display forceDisplayUpdate].
	(Delay forMilliseconds: 35) wait.
	Display border: r width: 2 rule: Form reverse fillColor: Color gray.
	Display forceDisplayUpdate.
