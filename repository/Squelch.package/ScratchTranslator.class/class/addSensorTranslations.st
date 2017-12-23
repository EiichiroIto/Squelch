language translation
addSensorTranslations
	"Add translations for the sensor names such as 'resistance-A' and 'A connected' from the translations of the root words if they exist."

	| root prefix postfix |
	root := TranslationDict at: 'connected' ifAbsent: [nil].
	root ifNotNil: [
		#(A B C D) do: [:ch |
			prefix := ch asString, ' '.
			"root isUnicode ifTrue: [prefix := UTF8 withAll: prefix]."
			TranslationDict at: (prefix, 'connected') put: (prefix, root)]].

	root := TranslationDict at: 'resistance' ifAbsent: [nil].
	root ifNotNil: [
		#(A B C D) do: [:ch |
			postfix := '-', ch asString.
			TranslationDict at: ('resistance', postfix) put: (root, postfix)]].
