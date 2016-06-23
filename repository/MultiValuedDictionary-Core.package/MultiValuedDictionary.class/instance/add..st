adding
add: anAssociation
	self
		basicprivateAt: anAssociation key
		put:
			(anAssociation value isCollection
				ifTrue: [ collectionClass withAll: anAssociation value ]
				ifFalse: [ anAssociation value ]).
	^ anAssociation