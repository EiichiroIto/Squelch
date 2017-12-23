private
checkForScratchInfoFetchDone
	"Try to retrieve info for the currently selected Scratch project and, if successful, report it to our client."
	"Details: The fetcher is allowed to keep running even after the info dictionary is retrieved. Thus if the user decides to open this project, we'll have a head start on fetching it."

	| data s version infoSize infoDict |
	scratchProjectFetcher ifNil: [^ self].

	data := scratchProjectFetcher bodyData.
	data size >= 14 ifTrue: [
		s := ReadStream on: data.
		version := ObjStream scratchFileVersionFrom: (s next: 10) asString.
		(version = 1) | (version = 2)
			ifTrue: [
				infoSize := s uint32.
				infoSize <= (s size - s position) ifTrue: [
					infoDict := [ObjStream new readObjFrom: s] ifError: [Dictionary new].
					scratchInfoClient scratchInfo: infoDict]]
			ifFalse: [
				scratchInfoClient scratchInfo: Dictionary new]].

