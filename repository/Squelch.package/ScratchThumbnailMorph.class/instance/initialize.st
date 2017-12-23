initialization
initialize

	super initialize.
	self form: (Form extent: 46@46 depth: 32).
	self form fillColor: Color transparent.
	self form border: self form boundingBox width: 1.
	showDirection := true.
	lastUpdateMSecs := -1.
