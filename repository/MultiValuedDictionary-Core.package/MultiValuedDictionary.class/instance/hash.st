comparing
hash
	| hash |
	hash := (self class hash + self dictionaryClass hash + self collectionClass hash) hashMultiply.
	^ (hash + dictionary hash) hashMultiply