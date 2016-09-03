private
wrap: anObject
	^ (anObject isCollection and: [ anObject isString not ])
		ifTrue: [ anObject ]
		ifFalse: [ Array with: anObject ]