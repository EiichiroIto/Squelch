initialization
addSetRotationCenterButton

	| setRotationLabel spacer font |

	setRotationCenterMorph := AlignmentMorph newRow
		hResizing: #shrinkWrap;
		color: Color transparent;
		wrapCentering: #center.

	"make components"
	setRotationCenterButton := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #paintSetRotCenterButtonPressed)
		offForm: (ScratchFrameMorph skinAt: #paintSetRotCenterButton).
	setRotationCenterButton
		target: paletteMorph;
		actionSelector: #toggleRotationPoint;
		setProperty: #balloonText toValue: 'Position the cross-hair to set the rotation center' localized.
	spacer := Morph new extent: 6@3; color: Color transparent.
	setRotationLabel := StringMorph contents: 'Set costume center' localized.
	font := (ScratchFrameMorph getFont: #PaintSetRotationCenter).
	setRotationLabel font: font; color: Color gray darker.

	"add components"
	setRotationCenterMorph
		addMorphBack: setRotationCenterButton;
		addMorphBack: spacer;
		addMorphBack: setRotationLabel.

	"add bar to frame"
	self addMorph: setRotationCenterMorph.
