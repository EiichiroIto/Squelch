instance creation
rotate: aSprite
	"create my single instance and set it to rotate aSprite"	

	self vanish.
	Current := self new 
		type: #rotate;
		form: (ScratchFrameMorph skinAt: #spriteRotate); 
		target: aSprite;
		setBalloonText: 'drag to rotate' localized.
	^ Current
