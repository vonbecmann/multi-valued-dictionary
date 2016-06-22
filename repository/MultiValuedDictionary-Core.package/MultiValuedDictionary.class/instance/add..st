adding
add: anAssociation
	self
		basicprivateAt: anAssociation key
		put:
			(anAssociation value isCollection
				ifTrue: [ collectionClass withAll: anAssociation value ]
				ifFalse: [ collectionClass with: anAssociation value ]).
	^ anAssociation