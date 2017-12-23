drawing
previewForm
	"Answer a full-size preview of me and my submorphs. Use super fullDrawOn: to avoid drawing the shadows along the top and left edges of the workspace."

	| canvas |
	canvas := FormCanvas extent: bounds extent depth: 32.
	canvas translateBy: bounds topLeft negated during: [:c | super fullDrawOn: c].
	^ canvas form
