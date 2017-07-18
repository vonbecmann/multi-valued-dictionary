accessing
at: key put: anObject
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	existingValues
		ifNil: [ dictionary at: key put: (collectionClass with: anObject) ]
		ifNotNil: [ existingValues add: anObject ].
	^ anObject