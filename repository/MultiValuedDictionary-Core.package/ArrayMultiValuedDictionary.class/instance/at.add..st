adding
at: key add: anObject
	"add an object at the given key."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	dictionary
		at: key
		put:
			(existingValues
				ifNil: [ Array with: anObject ]
				ifNotNil: [ existingValues copyWith: anObject ]).
	^ anObject