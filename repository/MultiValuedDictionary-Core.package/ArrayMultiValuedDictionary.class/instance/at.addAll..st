adding
at: key addAll: aCollection
	"add all values of a collection at the given key."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	dictionary
		at: key
		put:
			(existingValues
				ifNil: [ Array withAll: aCollection ]
				ifNotNil: [ existingValues , aCollection ]).
	^ aCollection