accessing
at: key putAll: aCollection
	"Set the values at key to be aCollection.  If key is not found, create a
	new entry for key and set its values to aCollection. Answer aCollection."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	existingValues
		ifNil: [ dictionary at: key put: (collectionClass withAll: aCollection) ]
		ifNotNil: [ existingValues addAll: aCollection ].
	^ aCollection