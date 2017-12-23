forms/sounds/icons
defaultBackgroundForm

	(DefaultBackgroundForm isNil or:
	 [DefaultBackgroundForm extent ~= ScratchFrameMorph workpaneExtent]) ifTrue: [
		DefaultBackgroundForm := (Form extent: ScratchFrameMorph workpaneExtent depth: 1).
		DefaultBackgroundForm fillWhite].

	^ DefaultBackgroundForm
