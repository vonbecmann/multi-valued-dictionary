accessing
at: key ifPresent: oneArgBlock ifAbsent: absentBlock
	"Lookup the given key in the receiver. If it is present, answer the value of evaluating the oneArgBlock with the values associated with the key, otherwise answer the value of absentBlock."

	^ dictionary at: key ifPresent: oneArgBlock ifAbsent: absentBlock