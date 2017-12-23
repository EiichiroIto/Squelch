private-incoming commands
doSendVars: cmd from: requestSock
	"Handle a variable send request: send-vars"

	"force all my global variables to be re-transmitted"
	lastSentValues := lastSentValues species new.
