accessing
extent: aPoint
"Only use squares"
	self form: (Form extent: aPoint depth: 32).
	self form fillColor: Color transparent.
	self form border: self form boundingBox width: 1.
	showDirection := true.
	lastUpdateMSecs := -1.