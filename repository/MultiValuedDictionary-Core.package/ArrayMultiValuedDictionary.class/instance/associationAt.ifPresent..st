accessing
associationAt: key ifPresent: aBlock
	"Answer the association with the given key.
	If key is not found, return the result of evaluating aBlock."

	^ dictionary associationAt: key ifPresent: aBlock