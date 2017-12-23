event handling
click: evt

	| delta |
	delta := (evt cursorPoint x - slider center x) sign.
	truncate ifFalse: [delta := delta * ((maxVal - minVal) / 100.0)].
	self setScaledValue: self getScaledValue + delta.
