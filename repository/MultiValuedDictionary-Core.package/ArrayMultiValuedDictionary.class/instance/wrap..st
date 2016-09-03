private
wrap: anObject
	^ (anObject isCollection and: [ anObject isString not ])
		ifTrue: [ Array withAll: anObject ]
		ifFalse: [ Array with: anObject ]