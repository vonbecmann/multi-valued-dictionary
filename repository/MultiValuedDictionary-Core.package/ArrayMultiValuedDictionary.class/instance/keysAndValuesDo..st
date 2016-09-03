enumerating
keysAndValuesDo: aBlock
	"Enumerate the receiver with all the keys and values."

	self associationsDo: [ :assoc | aBlock value: assoc key value: assoc value ]