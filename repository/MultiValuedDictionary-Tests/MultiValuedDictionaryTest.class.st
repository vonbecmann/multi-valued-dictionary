"
unit tests for multi-valued dictionaries

each association is  like 
	key -> value where value is a collection of values 
 
	
"
Class {
	#name : #MultiValuedDictionaryTest,
	#superclass : #MultiValuedDictionaryRootTest,
	#instVars : [
		'nonEmptyDict',
		'duplicatedElement'
	],
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
MultiValuedDictionaryTest class >> isAbstract [
	^ self name = #MultiValuedDictionaryTest
]

{ #category : #requirements }
MultiValuedDictionaryTest >> aValue [
	^ 37
]

{ #category : #requirements }
MultiValuedDictionaryTest >> anIndex [
	^ #GG
]

{ #category : #requirements }
MultiValuedDictionaryTest >> anotherElementNotIn [
	^ 42
	
]

{ #category : #requirements }
MultiValuedDictionaryTest >> anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "

	^ self collection associations anyOne
]

{ #category : #requirements }
MultiValuedDictionaryTest >> anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "

	^ #z -> 666
]

{ #category : #requirements }
MultiValuedDictionaryTest >> anotherValue [
	^ 63
]

{ #category : #requirements }
MultiValuedDictionaryTest >> associationWithKeyAlreadyInToAdd [
	^ #e -> 'eleven'
]

{ #category : #requirements }
MultiValuedDictionaryTest >> associationWithKeyNotInToAdd [
	^ #z -> 666
]

{ #category : #requirements }
MultiValuedDictionaryTest >> collectionNotIncluded [
	^ {701 . 703}
]

{ #category : #requirements }
MultiValuedDictionaryTest >> collectionWithElementsToRemove [
	^ {8}
]

{ #category : #requirements }
MultiValuedDictionaryTest >> collectionWithEqualElements [
	" return a collection including atLeast two elements equal"

	^ (self newEmptyDict)
		add: #A -> duplicatedElement;
		add: #B -> 3.5;
		add: #C -> duplicatedElement;
		yourself
]

{ #category : #requirements }
MultiValuedDictionaryTest >> collectionWithSortableElements [
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
MultiValuedDictionaryTest >> collectionWithoutEqualElements [
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
MultiValuedDictionaryTest >> collectionWithoutNilElements [
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
MultiValuedDictionaryTest >> elementNotIn [
	^ 666
]

{ #category : #requirements }
MultiValuedDictionaryTest >> elementNotInForOccurrences [
	" return an element notIncluded in #collectionWithoutEqualElements"
	^ 715
]

{ #category : #requirements }
MultiValuedDictionaryTest >> elementToAdd [
	^ #u -> 901
]

{ #category : #requirements }
MultiValuedDictionaryTest >> elementTwiceInForOccurrences [
	" return an element included exactly two time in # collectionWithEqualElements"

	^ duplicatedElement
]

{ #category : #requirements }
MultiValuedDictionaryTest >> integerCollectionWithoutEqualElements [
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
MultiValuedDictionaryTest >> keyNotIn [
	^ #z
]

{ #category : #requirements }
MultiValuedDictionaryTest >> keyNotInNonEmpty [
	^ #z
]

{ #category : #requirements }
MultiValuedDictionaryTest >> keyNotInNonEmptyDict [
	^ #z
]

{ #category : #requirements }
MultiValuedDictionaryTest >> nonEmpty1Element [
	^ (self newEmptyDict)
		add: #a -> 5;
		yourself
]

{ #category : #requirements }
MultiValuedDictionaryTest >> nonEmptyDict [
	^ nonEmptyDict
]

{ #category : #requirements }
MultiValuedDictionaryTest >> nonEmptyDifferentFromNonEmptyDict [
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
MultiValuedDictionaryTest >> nonEmptyWithCopyNonIdentical [
	" return a collection including elements for which copy is not identical to the initial element ( this is not the case of Integer )"

	^ self newEmptyDict
		add: #A -> 'foo';
		add: #A -> 'foo2';
		add: #b -> 'bar';
		add: #b -> 'baz';
		yourself
]

{ #category : #requirements }
MultiValuedDictionaryTest >> nonEmptyWithoutEqualsValues [
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

{ #category : #initialization }
MultiValuedDictionaryTest >> setUp [
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
MultiValuedDictionaryTest >> sizeCollection [
	^ (self newEmptyDict)
		add: #B -> 3;
		add: #B -> 7;
		yourself
]

{ #category : #requirements }
MultiValuedDictionaryTest >> valueNotIn [
	" return a value not included in nonEmptyWithoutEqualValues "

	^ self elementNotIn
]

{ #category : #requirements }
MultiValuedDictionaryTest >> valueNotInNonEmpty [
	^ self elementNotIn
]
