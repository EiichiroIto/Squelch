language translation
languageNames
	"Answer a list of language names for the languages menu. These are generally in the native language (e.g. 'Español') and must match the strings in the setLanguage: method."

	self importLanguagesList.
	^ ISODict values sort
