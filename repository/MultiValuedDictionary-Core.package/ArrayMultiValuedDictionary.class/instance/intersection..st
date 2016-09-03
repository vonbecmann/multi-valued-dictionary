enumerating
intersection: aCollection
	"Answer the set theoretic intersection of two collections."

	| other duplicates |
	other := aCollection asSet.
	duplicates := Set new.
	^ self
		select: [ :each | 
			((other includes: each) and: [ (duplicates includes: each) not ])
				ifTrue: [ duplicates add: each. true ]
				ifFalse: [ false ] ]