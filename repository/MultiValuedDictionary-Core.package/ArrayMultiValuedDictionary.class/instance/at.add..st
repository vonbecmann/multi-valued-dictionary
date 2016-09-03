adding
at: key add: anObject
	"add an object at the given key."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	existingValues
		ifNil: [ self at: key put: anObject ]
		ifNotNil: [ self privateAt: key put: (existingValues copyWith: anObject) ].
	^ anObject