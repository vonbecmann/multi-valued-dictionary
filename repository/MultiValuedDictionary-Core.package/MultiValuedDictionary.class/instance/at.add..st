accessing
at: key add: anObject
	"add an object at key."

	| existingValue |
	existingValue := dictionary at: key ifAbsent: nil.
	existingValue
		ifNil: [ self privateAt: key put: anObject ]
		ifNotNil: [ 
			collectionClass == existingValue class
				ifTrue: [ existingValue add: anObject ]
				ifFalse: [ self privateAt: key put: (collectionClass with: existingValue with: anObject) ] ].
	^ anObject