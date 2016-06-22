comparing
hash
	| hash size |
	hash := (self class hash + self dictionaryClass hash + self collectionClass hash) hashMultiply.
	size := self size.
	size <= 10
		ifTrue: [ self do: [ :elem | hash := (hash + elem hash) hashMultiply ] ].
	^ (hash + size hash) hashMultiply