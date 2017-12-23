accessing
updateOptionsPane

	| options font s spacer form b formMorph colorToUse brushThumbnail n2 aColor2 fName |

	optionsPane removeAllMorphs.
	options := AlignmentMorph newRow
		width: (optionsPane width - 16);
		height: (optionsPane height - 30);
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap";
		inset: 0".

	(#(paint erase line) includes: self mode) ifTrue: [
		brushSizeMorph := AlignmentMorph newRow
			wrapCentering: #center;
			color: Color transparent.
		font := (StrikeFont fontName: 'VerdanaBold' size: 11).
		s := (StringMorph contents: 'Brush size: ' localized).
		self mode = #erase ifTrue: [s contents: ('Eraser size' localized ,': ')].
		s font: font; color: Color gray darker.
		brushSizeMorph addMorphBack: s.
		self mode = #erase
			ifTrue: [colorToUse := Color transparent]
			ifFalse: [colorToUse := self color1].
		brushSizeMorph addMorphBack: (Morph new extent: 2@5; color: Color transparent).
		brushSizeMorph addMorphBack: (ImageMorph new form: (ScratchFrameMorph skinAt: #downArrow)).
		brushSizeMorph addMorphBack: (Morph new extent: 4@5; color: Color transparent).
		brushThumbnail := Morph new
			extent: 30@30;
			color: Color transparent.
		n2 := self brushSize.
		(n2 <= 6) ifTrue: [n2 := n2 + 1].
		(n2 == 29) ifTrue: [n2 := 23].
		(n2 == 47) ifTrue: [n2 := 25].
		(n2 == 75) ifTrue: [n2 := 27].
		brushIcon := ImageMorph new form: (PaintCanvas brushCursorSize: n2 color: colorToUse scale: 1).
		brushIcon position: (15@15 - ((n2//2)@(n2//2))).
		brushThumbnail addMorphBack: brushIcon.
		brushSizeMorph addMorphBack: brushThumbnail.
		options
			addMorphBack: brushSizeMorph].

	(#(oval rect) includes: self mode) ifTrue: [
		b := ToggleButton onForm: (ScratchFrameMorph skinAt: #paintOptionsButtonPressed)
					 offForm: (ScratchFrameMorph skinAt: #paintOptionsButton).
		b
			target: self;
			actionSelector: #shapeFilling:;
			arguments: (Array with: true);
			toggleMode: false.
		self shapeFilling ifTrue: [b on].
		(self mode = #oval)
			ifTrue: [form := Form extent: 16@17 depth: 16.
					(FormCanvas on: form) fillOval: form boundingBox color: self color1.
					formMorph := ImageMorph new form: form; position: 7@5]
			ifFalse: [form := Form extent: 16@17 depth: 8. form fillColor: self color1.
					formMorph := ImageMorph new form: form; position: 7@5].
		b addMorph: formMorph.
		options addMorphBack: b.
		options addMorphBack: (Morph new extent: 5@2; color: Color transparent).
		b := ToggleButton onForm: (ScratchFrameMorph skinAt: #paintOptionsButtonPressed)
					 offForm: (ScratchFrameMorph skinAt: #paintOptionsButton).
		b
			target: self;
			actionSelector: #shapeFilling:;
			arguments: (Array with: false);
			toggleMode: false.
		self shapeFilling ifFalse: [b on].
		(self mode = #oval)
			ifTrue: [form := Form extent: 16@17 depth: 16.
					(FormCanvas on: form) frameOval: form boundingBox width: 2 color: self color1.
					formMorph := ImageMorph new form: form; position: 7@5]
			ifFalse: [form := Form extent: 16@17 depth: 8. form border: (0@0 extent: 16@17) width: 2 fillColor: self color1.
					formMorph := ImageMorph new form: form; position: 7@5].
		b addMorph: formMorph.
		options addMorphBack: b].

	#fill = self mode ifTrue: [
		fillStylePane := AlignmentMorph newRow
		"inset: 0;"
		borderWidth: 0;
		color: Color transparent;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap.
		spacer := Morph new extent: 5@5; color: Color transparent.
		#(color hGradient vGradient rGradient) do: [:style |
			b := ToggleButton onForm: (ScratchFrameMorph skinAt: #paintOptionsButtonPressed)
					 offForm: (ScratchFrameMorph skinAt: #paintOptionsButton).
			b
				target: self;
				actionSelector: #pbFillStyle:;
				arguments: (Array with: style);
				toggleMode: false.
			form := Form extent: 16@17 depth: 32.
			(style == #color) ifTrue: [form fillColor: self color1].
			(style == #hGradient) ifTrue: [form fillFromXColorBlock: [:m | self color2 mixed: m with: self color1]].
			(style == #vGradient) ifTrue: [form fillFromYColorBlock: [:m | self color2 mixed: m with: self color1]].
			(style == #rGradient) ifTrue: [form fillRadialFromXColorBlock: [:m | self color2 mixed: m with: self color1] center: 8@8].
			formMorph := ImageMorph new form: form; position: 7@5.
			formMorph lock.
			b addMorph: formMorph.
			b off.
			(style == self pbFillStyle) ifTrue: [b on].
			fillStylePane addMorphBack: spacer fullCopy.
			fillStylePane addMorphBack: b.
			b position: b left@ b top + 2].
		fillStylePane addMorphBack: spacer fullCopy.
		options
			addMorphBack: fillStylePane].

	#text = self mode ifTrue: [
		font := (StrikeFont fontName: 'VerdanaBold' size: 11).
		fName := canvasMorph canvasTextBox font name.
		textFontMenu := ImageMorph new form: (ScratchFrameMorph skinAt: #textFontMenu).
		textFontMorph := StringMorph new font: font.
		textFontMorph contents: (textFontMorph stringWithEllipses: fName limitedToWidth: 109).
		textFontMenu addMorph: textFontMorph.
		textFontMorph position: 8@3.
		textSizeMenu := ImageMorph new form: (ScratchFrameMorph skinAt: #textSizeMenu).
		textSizeMorph := StringMorph contents: canvasMorph canvasTextBox font pointSize asString font: font.
		textSizeMenu addMorph: textSizeMorph.
		textSizeMorph position: 9@3.
		aColor2 := self color1.
		(aColor2 == Color transparent) ifTrue: [aColor2 := Color white].
			canvasMorph textColor: aColor2.
			canvasMorph changed.
		options
			addMorphBack: textFontMenu;
			addMorphBack: (Morph new width: 8; height: 5; color: Color transparent);
			addMorphBack: textSizeMenu].

	optionsPane addMorph: options.
	options position: (optionsPane left + (optionsPane width // 2) - (options width // 2))@(optionsPane top + (optionsPane height //2) - (options height // 2)).
