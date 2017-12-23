menu/button actions
getLoginName
	"Ask the user for their name name and record their answer in 'loginName'."

	| s |
	s := StringDialog
		askWithCancel: 'User name:'
		initialAnswer: loginName.
	s size = 0 ifTrue: [^ ''].
	loginName := s.
	^ s
