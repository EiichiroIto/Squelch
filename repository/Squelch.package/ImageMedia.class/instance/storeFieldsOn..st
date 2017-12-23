object i/o
storeFieldsOn: anObjStream

	| oldForm f |
	super storeFieldsOn: anObjStream.

	oldForm := form.

	compositeForm := nil.
	self hasTextLayer ifTrue: [
		compositeForm := self compositeForm hibernate.
		compositeForm couldBeColorReduced ifTrue: [
			f := compositeForm colorReduced hibernate.
			(f bits size < compositeForm bits size) ifTrue: [compositeForm := f]]].

	jpegBytes
		ifNil: [form := form hibernate]
		ifNotNil: [form := JPEGPlaceholderForm].

	self storeFieldsNamed: #(
		form
		rotationCenter
		textBox
		jpegBytes
		compositeForm
	) on: anObjStream.

	form := oldForm.
	compositeForm := nil.
