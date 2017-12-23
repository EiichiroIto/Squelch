menu/button actions
languageMenu: aToggleButtonMorph
	"Present a menu of possible languages for blocks."

	| bullet menu choice |
	bullet := '* '.
	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	ScratchTranslator languageNames do: [:lang |
		((ScratchTranslator isoCodeForName: lang) = (ScratchTranslator currentLanguage))
			ifTrue: [menu add: (bullet, lang) selector: #value: argument: lang]
			ifFalse: [menu add: lang selector: #value: argument: lang]].
	menu invokeAt: aToggleButtonMorph bottomLeft + (0@10) in: self world.

	choice ifNil: [^ self].
	self stopAll.
	self setLanguage: choice.
	self recordLanguage: (ScratchTranslator currentLanguage).
