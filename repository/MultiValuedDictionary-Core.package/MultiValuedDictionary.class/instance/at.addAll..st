adding
at: key addAll: aCollection
	"add all values of a collection at the given key."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	existingValues
		ifNil: [ dictionary at: key put: (collectionClass withAll: aCollection) ]
		ifNotNil: [ existingValues addAll: aCollection ].
	^ aCollection