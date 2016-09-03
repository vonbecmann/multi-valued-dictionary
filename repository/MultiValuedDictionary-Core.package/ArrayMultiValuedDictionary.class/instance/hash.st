comparing
hash
	| hash |
	hash := (self class hash + self dictionaryClass hash) hashMultiply.
	^ (hash + dictionary hash) hashMultiply