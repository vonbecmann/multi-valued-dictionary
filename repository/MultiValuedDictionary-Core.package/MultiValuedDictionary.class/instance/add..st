adding
add: anAssociation
	self
		privateAt: anAssociation key
		put:
			(anAssociation value isCollection
				ifTrue: [ collectionClass withAll: anAssociation value ]
				ifFalse: [ anAssociation value ]).
	^ anAssociation