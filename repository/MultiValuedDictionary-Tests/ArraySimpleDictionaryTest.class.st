"
a multi-valued dictionary should act as a dictionary.

each association is  like 
	key -> value
	
where value is not a collection of values, is just an object.
"
Class {
	#name : #ArraySimpleDictionaryTest,
	#superclass : #ArrayMultiValuedDictionaryRootTest,
	#instVars : [
		'nonEmptyDict',
		'duplicatedElement'
	],
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
ArraySimpleDictionaryTest class >> isAbstract [
	^ self name = #ArraySimpleDictionaryTest
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> aValue [
	" return a value to put into nonEmpty"

	^ 33
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> anIndex [
	" return an index in nonEmpty bounds"

	^ #GG
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> anotherElementNotIn [
	" return an element different of 'elementNotIn'  not included in 'nonEmpty' "

	^ 42
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "

	^ self collection associations anyOne
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "

	^ #z -> 666
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> anotherValue [
	" return a value ( not equal to 'aValue' ) to put into nonEmpty "

	^ 63
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> associationWithKeyAlreadyInToAdd [
	" return an association that will be used to add to nonEmptyDict (the key of this association is already included in nonEmptyDict)"

	^ self nonEmptyDict keys anyOne -> self valueNotIn
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> associationWithKeyNotInToAdd [
	" return an association that will be used to add to nonEmptyDict (the key of this association is not included in nonEmptyDict)"

	^ #z -> 666
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> collectionNotIncluded [
	" return a collection for wich each element is not included in 'nonEmpty' "

	^ {self valueNotIn. self valueNotIn}
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> collectionWithElementsToRemove [
	" return a collection of elements included in 'nonEmpty'  "

	^ {self elementTwiceIn}
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> collectionWithEqualElements [
	" return a collection including atLeast two elements equal"

	^ (self newEmptyDict)
		add: #A -> duplicatedElement;
		add: #B -> 3.5;
		add: #C -> duplicatedElement;
		yourself
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> collectionWithSortableElements [
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
ArraySimpleDictionaryTest >> collectionWithoutEqualElements [
	^ (self newEmptyDict)
		add: #a -> 5;
		add: #b -> 4;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		yourself
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> collectionWithoutNilElements [
	^ (self newEmptyDict)
		add: #a -> 1;
		add: #b -> 2;
		add: #c -> 4;
		yourself
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> elementNotIn [
	"return an element not included in 'nonEmpty' "

	^ 666
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> elementNotInForOccurrences [
	" return an element notIncluded in #collectionWithoutEqualElements"

	^ 715
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> elementToAdd [
	" return an element of type 'nonEmpy' elements'type'  not  yet included in nonEmpty"

	^ #u -> 5
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> elementTwiceInForOccurrences [
	" return an element included exactly two time in # collectionWithEqualElements"

	^ duplicatedElement
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> integerCollectionWithoutEqualElements [
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
ArraySimpleDictionaryTest >> keyNotIn [
	^ #z
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> keyNotInNonEmpty [
	" return a key not included in nonEmpty"

	^ #z
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> keyNotInNonEmptyDict [
	" return a key not included in nonEmptyDict"

	^ #z
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> nonEmpty1Element [
	" return a collection of size 1 including one element"

	^ (self newEmptyDict)
		add: #a -> 5;
		yourself
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> nonEmptyDict [
	^ nonEmptyDict
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> nonEmptyDifferentFromNonEmptyDict [
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ (self newEmptyDict)
		add: self keyNotIn -> self valueNotIn;
		yourself
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> nonEmptyWithCopyNonIdentical [
	" return a collection including elements for which copy is not identical 
	  to the initial element ( this is not the case of Integer )"

	^ self newEmptyDict
		add: #A -> 'foo';
		add: #b -> 'bar';
		yourself
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> nonEmptyWithoutEqualsValues [
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
ArraySimpleDictionaryTest >> setUp [
	nonEmptyDict := (self newEmptyDict)
		add: #a -> self elementTwiceIn;
		add: #b -> 30;
		add: #c -> self elementTwiceIn;
		add: #d -> -2;
		yourself.
	duplicatedElement := 2.5
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> sizeCollection [
	^ self nonEmptyDict
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> valueNotIn [
	" return a value not included in nonEmptyWithoutEqualValues "

	^ 666
]

{ #category : #requirements }
ArraySimpleDictionaryTest >> valueNotInNonEmpty [
	" return a value not included in nonEmpty"

	^ self valueNotIn
]
