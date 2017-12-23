media
unusedMediaNameFromBaseName: baseName forMedia: aMedia
	"Answer an unused name for a new media item with the given base name. Strip off the file extension, if any.  med is the sound or costume media which is currently being renamed."

	| nm i existingNames greatestNum nm2 |
	nm := baseName.
	i := nm indexOf: $..
	i > 1 ifTrue: [nm := nm copyFrom: 1 to: i - 1].

	nm size = 0 ifTrue: [
		aMedia
			ifNil: [nm := 'new' localized, '1']
			ifNotNil: [
				aMedia isImage
					ifTrue: [nm := self defaultImageMedia mediaName]
					ifFalse: [nm := 'sound' localized, '1']]].

	existingNames := Set new.
	media do: [:m | m = aMedia ifFalse: [existingNames add: m mediaName copy]].

	(nm size > 0 and: [nm last isDigit]) ifFalse: [
		(existingNames includes: nm) ifFalse: [^ nm]].

	"remove trailing digits, if any"
	i := nm size.
	[i > 1 and: [(nm at: i) isDigit]] whileTrue: [i := i - 1].
	[i > 1 and: [(nm at: i) = Character space]] whileTrue: [i := i - 1].
	nm := nm copyFrom: 1 to: i.

	greatestNum := 0.
	existingNames do: [:n |
		i := n size.
		[i > 1 and: [(n at: i) isDigit]] whileTrue: [i := i - 1].
		(n copyFrom: 1 to: i) = nm ifTrue: [
			nm2 := (n copyFrom: i+1 to: n size).
			nm2 ifNotEmpty: [greatestNum := nm2 asNumber max: greatestNum]]].

	^ nm, (greatestNum+1) printString
