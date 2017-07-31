testing
includesAssociation: anAssociation
	^ (dictionary associationAt: anAssociation key ifAbsent: [ ^ false ]) value includes: anAssociation value