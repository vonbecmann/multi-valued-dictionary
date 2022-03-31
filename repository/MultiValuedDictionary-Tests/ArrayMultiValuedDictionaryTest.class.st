"
unit tests for multi-valued dictionaries

each association is  like 
	key -> value where value is a collection of values 
 
	
"
Class {
	#name : #ArrayMultiValuedDictionaryTest,
	#superclass : #ArrayMultiValuedDictionaryRootTest,
	#instVars : [
		'nonEmptyDict',
		'duplicatedElement'
	],
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
ArrayMultiValuedDictionaryTest class >> isAbstract [
	^ self name = #ArrayMultiValuedDictionaryTest
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> aValue [
	^ 37
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> anIndex [
	^ #GG
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> anotherElementNotIn [
	^ 42
	
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "

	^ self collection associations anyOne
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "

	^ #z -> 666
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> anotherValue [
	^ 63
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> associationWithKeyAlreadyInToAdd [
	^ #e -> 'eleven'
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> associationWithKeyNotInToAdd [
	^ #z -> 666
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> collectionNotIncluded [
	^ {701 . 703}
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> collectionWithElementsToRemove [
	^ {8}
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> collectionWithEqualElements [
	" return a collection including atLeast two elements equal"

	^ self newEmptyDict
		add: #A -> duplicatedElement;
		add: #B -> 3.5;
		add: #C -> duplicatedElement;
		yourself
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> collectionWithSortableElements [
	" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"

	^ self newEmptyDict
		add: #a -> 3;
		add: #a -> 5;
		add: #b -> 4;
		add: #b -> 8;
		add: #c -> 7;
		add: #c -> 11;
		add: #d -> 6;
		add: #d -> 12;
		add: #e -> 9;
		add: #e -> 10;
		yourself
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> collectionWithoutEqualElements [
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
ArrayMultiValuedDictionaryTest >> collectionWithoutNilElements [
	^ self newEmptyDict
		add: #a -> 1;
		add: #a -> 6;
		add: #b -> 2;
		add: #b -> 3;
		add: #c -> 4;
		add: #c -> 5;
		yourself
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> elementNotIn [
	^ 666
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> elementNotInForOccurrences [
	" return an element notIncluded in #collectionWithoutEqualElements"
	^ 715
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> elementToAdd [
	^ #u -> 901
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> elementTwiceInForOccurrences [
	" return an element included exactly two time in # collectionWithEqualElements"

	^ duplicatedElement
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> integerCollectionWithoutEqualElements [
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
ArrayMultiValuedDictionaryTest >> keyNotIn [
	^ #z
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> keyNotInNonEmpty [
	^ #z
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> keyNotInNonEmptyDict [
	^ #z
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> nonEmpty1Element [
	^ (self newEmptyDict)
		add: #a -> 5;
		yourself
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> nonEmptyDict [
	^ nonEmptyDict
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> nonEmptyDifferentFromNonEmptyDict [
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ self newEmptyDict
		add: #h -> 101;
		add: #h -> 101.01;
		add: #i -> 102;
		add: #i -> 103;
		add: #j -> 104;
		add: #j -> 105;
		add: #k -> 106;
		add: #k -> 107;
		add: #l -> 108;
		add: #l -> 109;
		add: #l -> 109;
		yourself
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> nonEmptyWithCopyNonIdentical [
	" return a collection including elements for which copy is not identical to the initial element ( this is not the case of Integer )"

	^ self newEmptyDict
		add: #A -> 'foo';
		add: #A -> 'foo2';
		add: #b -> 'bar';
		add: #b -> 'baz';
		yourself
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> nonEmptyWithoutEqualsValues [
	" return a dictionary that doesn't include equal values'"

	^ self newEmptyDict
		add: #a -> 3;
		add: #a -> 5;
		add: #b -> 4;
		add: #b -> 8;
		add: #c -> 7;
		add: #c -> $s;
		add: #d -> 6;
		add: #d -> $e;
		add: #e -> 9;
		add: #e -> 10;
		yourself
]

{ #category : #running }
ArrayMultiValuedDictionaryTest >> setUp [
	nonEmptyDict := self newEmptyDict
		add: #a -> 1;
		add: #a -> 'hello_world';
		add: #b -> 2;
		add: #b -> $2;
		add: #c -> 4;
		add: #c -> 5;		
		add: #d -> 6;
		add: #d -> 7;		
		add: #e -> 8;
		add: #e -> 'nine';				
		yourself.
	duplicatedElement := 2.5
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> sizeCollection [
	^ self newEmptyDict
		add: #B -> 3;
		add: #B -> 7;
		yourself
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> valueNotIn [
	" return a value not included in nonEmptyWithoutEqualValues "

	^ self elementNotIn
]

{ #category : #requirements }
ArrayMultiValuedDictionaryTest >> valueNotInNonEmpty [
	^ self elementNotIn
]
