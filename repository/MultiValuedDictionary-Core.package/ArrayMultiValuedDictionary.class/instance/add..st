adding
add: anAssociation
	dictionary at: anAssociation key put: (self wrap: anAssociation value).
	^ anAssociation