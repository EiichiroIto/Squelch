initialization
directory: aFileDirectory

	directory := aFileDirectory.
	dict := Dictionary new.

	fileSizes := Dictionary new.
	directory entries do: [:entry |
		entry isDirectory ifFalse: [
			fileSizes at: entry name put: entry size]].
