menu/button actions
stopAll
	"Tell my workPane to stop everything."

	| oldJustSaved |
	oldJustSaved := justSaved.
	workPane stopAll.
	justSaved := oldJustSaved.
