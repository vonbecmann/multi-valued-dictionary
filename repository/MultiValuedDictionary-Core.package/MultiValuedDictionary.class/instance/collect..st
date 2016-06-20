enumerating
collect: aBlock
	"Evaluate aBlock with each of my values as the argument.  Collect the
	resulting values into a collection that is like me. Answer with the new
	collection."

	| newCollection |
	newCollection := self class dictionary: dictionary class collection: collectionClass.
	self associationsDo: [ :each | newCollection add: each key -> (aBlock value: each value) ].
	^ newCollection