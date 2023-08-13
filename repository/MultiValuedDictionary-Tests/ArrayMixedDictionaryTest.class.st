"
unit tests for array multi-valued dictionaries

each association is  like 
	key -> value  where value is an Object 
or 
	key -> value where value is a collection of values 
 
	
"
Class {
	#name : #ArrayMixedDictionaryTest,
	#superclass : #ArrayMultiValuedDictionaryRootTest,
	#instVars : [
		'nonEmptyDict',
		'duplicatedElement'
	],
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
ArrayMixedDictionaryTest class >> isAbstract [
	^ self name = #ArrayMixedDictionaryTest
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> aValue [
	^ 37
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> anIndex [
	^ #GG
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> anotherElementNotIn [
	^ 42
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "

	^ self collection associations anyOne
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "

	^ #z -> 666
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> anotherValue [
	^ 63
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> associationWithKeyAlreadyInToAdd [
	^ #e -> 11
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> associationWithKeyNotInToAdd [
	^ #z -> 666
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> collectionNotIncluded [
	^ {701 . 703}
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> collectionWithElementsToRemove [
	^ {8}
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> collectionWithEqualElements [
	" return a collection including atLeast two elements equal"

	^ self newEmptyDict
		add: #A -> duplicatedElement;
		add: #B -> 3.5;
		add: #C -> duplicatedElement;
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> collectionWithSortableElements [
	" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"

	^ self newEmptyDict
		add: #a -> 3;
		add: #a -> 5;
		add: #b -> 4;
		add: #b -> 8;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		add: #e -> 10;
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> collectionWithoutEqualElements [
	^ self newEmptyDict
		add: #a -> 1;
		add: #b -> 2;
		add: #b -> 3;
		add: #c -> 4;
		add: #c -> 5;
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> collectionWithoutNilElements [
	^ self newEmptyDict
		add: #a -> 1;
		add: #b -> 2;
		add: #b -> 3;
		add: #c -> 4;
		add: #c -> 5;
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> elementNotIn [
	^ 666
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> elementNotInForOccurrences [
	" return an element notIncluded in #collectionWithoutEqualElements"
	^ 715
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> elementToAdd [
	^ #u -> 901
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> elementTwiceInForOccurrences [
	" return an element included exactly two time in # collectionWithEqualElements"

	^ duplicatedElement
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> integerCollectionWithoutEqualElements [
	" return a collection of integer without equal elements"

	^ self newEmptyDict
		add: #a -> 0;
		add: #a -> 1;
		add: #b -> 2;
		add: #b -> 3;
		add: #c -> 4;
		add: #c -> 5;
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> keyNotIn [
	^ #z
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> keyNotInNonEmpty [
	^ #z
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> keyNotInNonEmptyDict [
	^ #z
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> nonEmpty1Element [
	^ self newEmptyDict
		add: #a -> 5;
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> nonEmptyDict [
	^ nonEmptyDict
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> nonEmptyDifferentFromNonEmptyDict [
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ self newEmptyDict
		add: #h -> 101;
		add: #i -> 102;
		add: #i -> 103;
		add: #j -> 104;
		add: #j -> 105;
		add: #k -> 106;
		add: #k -> 107;
		add: #l -> 108;
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> nonEmptyWithCopyNonIdentical [
	" return a collection including elements for which copy is not identical to the initial element ( this is not the case of Integer )"

	^ self newEmptyDict
		add: #A -> 'foo';
		add: #A -> 'foo2';
		add: #b -> 'bar';
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> nonEmptyWithoutEqualsValues [
	" return a dictionary that doesn't include equal values'"

	^ self newEmptyDict
		add: #a -> 3;
		add: #a -> 5;
		add: #b -> 4;
		add: #b -> 8;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		add: #e -> 10;
		yourself
]

{ #category : #running }
ArrayMixedDictionaryTest >> setUp [

	super setUp.
	nonEmptyDict := self newEmptyDict
		                add: #a -> 'hello_world';
		                add: #b -> 2;
		                add: #c -> 4;
		                add: #c -> 5;
		                add: #d -> 6;
		                add: #d -> 7;
		                add: #e -> 8;
		                yourself.
	duplicatedElement := 2.5
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> sizeCollection [
	^ self newEmptyDict
		add: #B -> 3;
		add: #B -> 7;
		yourself
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> valueNotIn [
	" return a value not included in nonEmptyWithoutEqualValues "

	^ self elementNotIn
]

{ #category : #requirements }
ArrayMixedDictionaryTest >> valueNotInNonEmpty [
	^ self elementNotIn
]
