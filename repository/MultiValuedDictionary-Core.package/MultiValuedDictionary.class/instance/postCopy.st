copying
postCopy
	| newDict |
	newDict := self dictionaryClass new.
	dictionary associationsDo: [ :assoc | newDict at: assoc key put: assoc value copy ].
	dictionary := newDict