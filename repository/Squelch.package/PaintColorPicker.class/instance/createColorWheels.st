initialization
createColorWheels

	| f h c f2 fx fy fx2 fy2 |
	fx := colorPickerContainer width - 2.
	fy := colorPickerContainer height - 2.
	f := Form extent: fx@fy depth: 32.
	fx2 := shadePickerContainer width - 2.
	fy2 := shadePickerContainer height - 2.
	f2 := Form extent: fx2@fy2 depth: 32.

	0 to: fx do: [:x |
		h := x * 360 // fx.
		0 to: (fy // 2) do: [:y |
			c := Color h: h s: (y / (fy // 2)) v: 1.0.
			f fill: (x@y extent: 1@1) fillColor: c].
		((fy // 2) + 1) to: fy do: [:y |
			c := Color h: h s: 1.0 v: (fy - y) / (fy // 2).
			f fill: (x@y extent: 1@1) fillColor: c]].
	0 to: fx2 do: [:x |
		c := Color gray: (x / fx2).
		f2 fill: ((x@0) extent: (1@fy2)) fillColor: c].

	colorPickerImage form: f.
	shadePickerImage form: f2.
