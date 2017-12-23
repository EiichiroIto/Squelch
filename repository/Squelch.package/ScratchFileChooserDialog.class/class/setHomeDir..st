accessing
setHomeDir: aStringOrNil
	"Set the home directory for this user. If the user name contains an asterisk, replace it with the name of logged in user."
	"self setHomeDir: '/Users/*/Documents'"

	| path root |
	UserHomeFolder := nil.
	aStringOrNil ifNotNil: [
		path := self replaceAsteriskWithUserName: aStringOrNil.
		root := FileDirectory on: ''.
		(root directoryExists: path) ifTrue: [
			UserHomeFolder := root on: path]].
