accessing
allNames
	"If the last fetch completed successfully, answer an array of all my entry names. Otherwise, answer an empty array."

	| allNames |
	self fetchSucceeded ifFalse: [^ #()].

	allNames := (HtmlChunker linksFrom: fetcher bodyData asString) asArray
		collect: [:assoc | assoc value replaceHtmlHexChars].

	allNames := allNames select: [:s | s size > 0 and: [s first ~= $/]].  "eliminate parent folder links"
	allNames := allNames select: [:s | ((s includes: $=) | (s includes: $;)) not].  "eliminate Apache sorting links"

	allNames := allNames collect: [:s |
		((s size > 1) and: [s last = $/])
			ifTrue: [s copyFrom: 1 to: s size - 1]
			ifFalse: [s]].  "remove trailing '/' characters"

	allNames sort: [:s1 :s2 | s1 caseInsensitiveLessOrEqual: s2].

	^ allNames 

