utilities
version: aString
	"self version: '1.0 (internal ', (Date today printFormat: #(1 2 3 $- 2 2)), ')'"
	"self version: '1.0'"

	Version := aString.
	VersionDate := Date today printFormat: #(3 2 1 $- 1 1).
