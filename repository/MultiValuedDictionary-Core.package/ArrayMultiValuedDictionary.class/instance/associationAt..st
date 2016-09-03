accessing
associationAt: key
	^ dictionary associationAt: key ifAbsent: [ self errorKeyNotFound: key ]