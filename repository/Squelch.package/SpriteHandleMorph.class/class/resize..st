instance creation
resize: aSprite
	"create my single instance and set it to resize aSprite"	

	self vanish.
	Current := self new 
		type: #resize;
		form: (ScratchFrameMorph skinAt: #spriteResize); 
		target: aSprite;
		setBalloonText: 'drag to resize' localized.
	^ Current
