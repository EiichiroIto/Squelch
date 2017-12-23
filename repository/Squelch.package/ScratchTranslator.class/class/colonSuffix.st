language translation
colonSuffix
	"Answer a colon suffix. If the current language is RTL, then include the Unicode RTL mark after the colon."

	^ self isRTL ifTrue: [ColonSuffix] ifFalse: [':']
