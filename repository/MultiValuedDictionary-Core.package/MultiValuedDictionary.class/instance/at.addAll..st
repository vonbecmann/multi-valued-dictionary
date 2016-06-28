accessing
at: key addAll: aCollection
	"add all values of a collectionn at key."

	| existingValue |
	existingValue := dictionary at: key ifAbsent: nil.
	existingValue
		ifNil: [ self privateAt: key put: (collectionClass withAll: aCollection) ]
		ifNotNil: [ 
			collectionClass == existingValue class
				ifTrue: [ existingValue addAll: aCollection ]
				ifFalse: [ 
					self
						privateAt: key
						put:
							((collectionClass with: existingValue)
								addAll: aCollection;
								yourself) ] ].
	^ aCollection