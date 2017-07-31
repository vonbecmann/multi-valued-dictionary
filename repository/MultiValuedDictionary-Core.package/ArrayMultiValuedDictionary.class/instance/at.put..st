accessing
at: key put: anObject
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	dictionary
		at: key
		put:
			(existingValues
				ifNil: [ Array with: anObject ]
				ifNotNil: [ existingValues copyWith: anObject ]).
	^ anObject