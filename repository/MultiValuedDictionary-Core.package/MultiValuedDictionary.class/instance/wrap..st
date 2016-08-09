private
wrap: anObject
	^ (anObject isCollection and: [ anObject isString not ])
		ifTrue: [ collectionClass withAll: anObject ]
		ifFalse: [ collectionClass with: anObject ]