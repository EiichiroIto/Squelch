event handling
mouseDown: evt

	target isNil | selector isNil ifTrue: [^ self].
	Cursor normal show.
	MenuBarIsActive := true.
	target perform: selector with: self.  "invoke my menu"
