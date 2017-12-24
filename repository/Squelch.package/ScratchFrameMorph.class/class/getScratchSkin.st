scratch skin
getScratchSkin
	| response zip |
	response := ZnEasy get: 'http://download.scratch.mit.edu/source-code/ScratchSkin1.4.zip'.
	[ 
	'tmp.zip' asFileReference
		writeStreamDo: [ :stream | 
			stream binary.
			response entity writeOn: stream ].
	zip := ZipArchive new readFrom: 'tmp.zip'.
	zip extractAllTo: FileSystem workingDirectory ]
		ensure: [ 'tmp.zip' asFileReference delete ]