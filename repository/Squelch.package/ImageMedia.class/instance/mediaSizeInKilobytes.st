accessing
mediaSizeInKilobytes
	"Returns the storage size of this media in kilobytes, rounded to the nearest kilobyte."

	| bytes |
	bytes := 0.
	jpegBytes
		ifNil: [form hibernate. bytes := form bits size]
		ifNotNil: [bytes := jpegBytes size].
	self hasTextLayer ifTrue: [
		self compositeForm hibernate.
		bytes := bytes + compositeForm bits size].

	bytes < 1024 ifTrue: [
		 ^ (bytes / 1024) roundTo: 0.01].

	^ (bytes + 512) // 1024
