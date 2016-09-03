adding
add: anAssociation
	self privateAt: anAssociation key put: (self wrap: anAssociation value).
	^ anAssociation