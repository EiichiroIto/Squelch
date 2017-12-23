class initialization
initialize
	"self initialize"

	Clipboard := nil.
	WorkpaneExtent := 480@360.
	UseErrorCatcher := false. "true"
	DefaultNotes := ''.

	self initFonts.

	SoundSystem soundEnabled: true.
	SoundPlayer stopPlayerProcess.
	self readSkinFrom: (FileSystem workingDirectory / 'ScratchSkin').
	self isXO: false.
	self version:  '1.4 (source code of 23-Sep-09)'.
	self takeOverScreen: false.
	ScriptableScratchMorph doubleSize: false.
	ScratchServers := #()