enumerating
difference: aCollection
	"Answer the set theoretic difference of two collections. This is a specialized version for Dictionaries keeping the keys of the objects. At a slightly higher price of an additional Set to track duplicates."

	| other duplicates |
	other := aCollection asSet.
	duplicates := Set new.
	^ self
		select: [ :each | 
			((other includes: each) not and: [ (duplicates includes: each) not ])
				ifTrue: [ duplicates add: each. true ]
				ifFalse: [ false ] ]