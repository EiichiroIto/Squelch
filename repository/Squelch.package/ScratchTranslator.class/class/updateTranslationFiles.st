import/export
updateTranslationFiles
	"Takes the existing .po files and updates them to reflect the latest Scratch strings to be translated."
	"self updateTranslationFiles"

	| translationDict codes |
	self importLanguagesList.
	codes := self isoDict keys.
	codes do: [:c |
		(c = 'en') ifFalse:[
			translationDict := self importTranslation: c,'.po'.
			self exportStringsToTranslateFrom: translationDict toFile: c,'.po']].
