adding
add: anAssociation
	anAssociation value isCollection
		ifTrue: [ self privateAt: anAssociation key putAll: anAssociation value ]
		ifFalse: [ self privateAt: anAssociation key put: anAssociation value ].
	^ anAssociation