"
a multi-valued dictionary should act as a dictionary.

each association is  like 
	key -> value
	
where value is not a collection of values, is just an object.

"
Class {
	#name : #SimpleDictionaryTest,
	#superclass : #MultiValuedDictionaryRootTest,
	#instVars : [
		'nonEmptyDict',
		'duplicatedElement'
	],
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
SimpleDictionaryTest class >> isAbstract [
	^ self name = #SimpleDictionaryTest
]

{ #category : #requirements }
SimpleDictionaryTest >> aValue [
	" return a value to put into nonEmpty"

	^ 33
]

{ #category : #requirements }
SimpleDictionaryTest >> anIndex [
	" return an index in nonEmpty bounds"

	^ #GG
]

{ #category : #requirements }
SimpleDictionaryTest >> anotherElementNotIn [
	" return an element different of 'elementNotIn'  not included in 'nonEmpty' "

	^ 42
]

{ #category : #requirements }
SimpleDictionaryTest >> anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "

	^ self collection associations anyOne
]

{ #category : #requirements }
SimpleDictionaryTest >> anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "

	^ #z -> 666
]

{ #category : #requirements }
SimpleDictionaryTest >> anotherValue [
	" return a value ( not equal to 'aValue' ) to put into nonEmpty "

	^ 63
]

{ #category : #requirements }
SimpleDictionaryTest >> associationWithKeyAlreadyInToAdd [
	" return an association that will be used to add to nonEmptyDict (the key of this association is already included in nonEmptyDict)"

	^ self nonEmptyDict keys anyOne -> self valueNotIn
]

{ #category : #requirements }
SimpleDictionaryTest >> associationWithKeyNotInToAdd [
	" return an association that will be used to add to nonEmptyDict (the key of this association is not included in nonEmptyDict)"

	^ #z -> 666
]

{ #category : #requirements }
SimpleDictionaryTest >> collectionNotIncluded [
	" return a collection for wich each element is not included in 'nonEmpty' "

	^ {self valueNotIn. self valueNotIn}
]

{ #category : #requirements }
SimpleDictionaryTest >> collectionWithElementsToRemove [
	" return a collection of elements included in 'nonEmpty'  "

	^ {self elementTwiceIn}
]

{ #category : #requirements }
SimpleDictionaryTest >> collectionWithEqualElements [
	" return a collection including atLeast two elements equal"

	^ (self newEmptyDict)
		add: #A -> duplicatedElement;
		add: #B -> 3.5;
		add: #C -> duplicatedElement;
		yourself
]

{ #category : #requirements }
SimpleDictionaryTest >> collectionWithSortableElements [
	" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"

	^ (self newEmptyDict)
		add: #a -> 5;
		add: #b -> 4;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		yourself
]

{ #category : #requirements }
SimpleDictionaryTest >> collectionWithoutEqualElements [
	^ (self newEmptyDict)
		add: #a -> 5;
		add: #b -> 4;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		yourself
]

{ #category : #requirements }
SimpleDictionaryTest >> collectionWithoutNilElements [
	^ (self newEmptyDict)
		add: #a -> 1;
		add: #b -> 2;
		add: #c -> 4;
		yourself
]

{ #category : #requirements }
SimpleDictionaryTest >> elementNotIn [
	"return an element not included in 'nonEmpty' "

	^ 666
]

{ #category : #requirements }
SimpleDictionaryTest >> elementNotInForOccurrences [
	" return an element notIncluded in #collectionWithoutEqualElements"

	^ 715
]

{ #category : #requirements }
SimpleDictionaryTest >> elementToAdd [
	" return an element of type 'nonEmpy' elements'type'  not  yet included in nonEmpty"

	^ #u -> 5
]

{ #category : #requirements }
SimpleDictionaryTest >> elementTwiceInForOccurrences [
	" return an element included exactly two time in # collectionWithEqualElements"

	^ duplicatedElement
]

{ #category : #requirements }
SimpleDictionaryTest >> integerCollectionWithoutEqualElements [
	" return a collection of integer without equal elements"

	^ (self newEmptyDict)
		add: #a -> 5;
		add: #b -> 4;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		yourself
]

{ #category : #requirements }
SimpleDictionaryTest >> keyNotIn [
	^ #z
]

{ #category : #requirements }
SimpleDictionaryTest >> keyNotInNonEmpty [
	" return a key not included in nonEmpty"

	^ #z
]

{ #category : #requirements }
SimpleDictionaryTest >> keyNotInNonEmptyDict [
	" return a key not included in nonEmptyDict"

	^ #z
]

{ #category : #requirements }
SimpleDictionaryTest >> nonEmpty1Element [
	" return a collection of size 1 including one element"

	^ (self newEmptyDict)
		add: #a -> 5;
		yourself
]

{ #category : #requirements }
SimpleDictionaryTest >> nonEmptyDict [
	^ nonEmptyDict
]

{ #category : #requirements }
SimpleDictionaryTest >> nonEmptyDifferentFromNonEmptyDict [
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ (self newEmptyDict)
		add: self keyNotIn -> self valueNotIn;
		yourself
]

{ #category : #requirements }
SimpleDictionaryTest >> nonEmptyWithCopyNonIdentical [
	" return a collection including elements for which copy is not identical 
	  to the initial element ( this is not the case of Integer )"

	^ self newEmptyDict
		add: #A -> 'foo';
		add: #b -> 'bar';
		yourself
]

{ #category : #requirements }
SimpleDictionaryTest >> nonEmptyWithoutEqualsValues [
	" return a dictionary that doesn't include equal values'"

	^ (self newEmptyDict)
		add: #a -> 5;
		add: #b -> 4;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		yourself
]

{ #category : #running }
SimpleDictionaryTest >> setUp [
	nonEmptyDict := (self newEmptyDict)
		add: #a -> self elementTwiceIn;
		add: #b -> 30;
		add: #c -> self elementTwiceIn;
		add: #d -> -2;
		yourself.
	duplicatedElement := 2.5
]

{ #category : #requirements }
SimpleDictionaryTest >> sizeCollection [
	^ self nonEmptyDict
]

{ #category : #requirements }
SimpleDictionaryTest >> valueNotIn [
	" return a value not included in nonEmptyWithoutEqualValues "

	^ 666
]

{ #category : #requirements }
SimpleDictionaryTest >> valueNotInNonEmpty [
	" return a value not included in nonEmpty"

	^ self valueNotIn
]
