adding
at: key add: anObject
	"add an object at the given key."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	existingValues
		ifNil: [ dictionary at: key put: (collectionClass with: anObject) ]
		ifNotNil: [ existingValues add: anObject ].
	^ anObject