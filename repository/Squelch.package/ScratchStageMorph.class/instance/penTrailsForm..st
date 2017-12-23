pen support
penTrailsForm: aForm

	penTrailsForm := aForm.
	penTrailsForm ifNotNil: [self createOrResizeTrailsForm].
