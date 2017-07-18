adding
add: anAssociation
	| existingValues |
	existingValues := dictionary at: anAssociation key ifAbsent: nil.
	existingValues
		ifNil: [ dictionary at: anAssociation key put: (collectionClass with: anAssociation value) ]
		ifNotNil: [ existingValues add: anAssociation value ].
	^ anAssociation