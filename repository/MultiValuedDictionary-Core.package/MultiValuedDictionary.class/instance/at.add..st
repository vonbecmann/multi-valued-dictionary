accessing
at: key add: anObject
	"add an object at key."

	| existingValue newValue |
	existingValue := dictionary at: key ifAbsent: nil.
	newValue := existingValue
		ifNil: [ anObject ]
		ifNotNil: [ 
			collectionClass == existingValue class
				ifTrue: [ existingValue copyWith: anObject ]
				ifFalse: [ collectionClass with: existingValue with: anObject ] ].
	self privateAt: key put: newValue.
	^ anObject