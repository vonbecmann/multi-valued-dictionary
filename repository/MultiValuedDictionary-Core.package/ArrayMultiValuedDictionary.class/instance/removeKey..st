removing
removeKey: key
	"Remove key from the receiver.
	If key is not in the receiver, notify an error."

	^ dictionary removeKey: key ifAbsent: [ self errorKeyNotFound: key ]