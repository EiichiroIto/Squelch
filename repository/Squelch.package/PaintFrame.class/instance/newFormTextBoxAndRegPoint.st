other
newFormTextBoxAndRegPoint
	"Answer an array containing my current canvasForm, text box, and registration point. The text box is sized to fit the text or is nil if it is empty."

	| textBox r newForm regPoint |
	canvasMorph commitMove.

	textBox := canvasMorph canvasTextBox copy.
	textBox
		textColor: canvasMorph textColor;
		fitContents.
	textBox contents isEmpty ifTrue: [textBox := nil].

	(originalObject isKindOf: ScratchStageMorph)
		ifTrue: [
			r := 0@0 extent: ScratchFrameMorph workpaneExtent.
			newForm := Form extent: r extent depth: 32.
			newForm fillWhite.
			canvasMorph canvasForm
				displayOn: newForm
				at: (newForm extent - canvasMorph canvasForm extent // 2)
				rule: Form paint]
		ifFalse: [
			r := canvasMorph canvasForm rectangleEnclosingPixelsNotOfColor: Color transparent.
			((r area = 0) & textBox isNil) ifTrue: [^ nil].  "empty canvas and no text"
			r area = 0 ifTrue: [r := textBox position extent: 1@1].  "text only"
			textBox ifNotNil: [
				r := r merge: textBox bounds.
				textBox position: textBox position - r origin].
			newForm := Form extent: r extent depth: 32.
			canvasMorph canvasForm displayOn: newForm at: r origin negated rule: Form paint].

	regPoint := canvasMorph registrationPoint.
	regPoint
		ifNil: [regPoint := r extent // 2]
		ifNotNil: [regPoint := regPoint - r topLeft].

	^ Array with: newForm with: textBox with: regPoint
