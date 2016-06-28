adding
add: anAssociation
	self
		privateAt: anAssociation key
		put:
			((anAssociation value isCollection and: [ anAssociation value isString not ])
				ifTrue: [ collectionClass withAll: anAssociation value ]
				ifFalse: [ anAssociation value ]).
	^ anAssociation