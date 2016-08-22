accessing
at: key ifPresent: aBlock
	"Lookup the given key in the receiver. If it is present, answer the value of evaluating the given block with the values associated with the key. Otherwise, answer nil."

	^ dictionary at: key ifPresent: aBlock