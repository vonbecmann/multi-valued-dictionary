Class {
	#name : #AbstractMultiValuedDictionaryRootTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'nonEmptyDict',
		'duplicatedElement'
	],
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
AbstractMultiValuedDictionaryRootTest class >> isAbstract [

	^ self name = #AbstractMultiValuedDictionaryRootTest
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> aValue [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> anIndex [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> anotherElementNotIn [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> anotherElementOrAssociationIn [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> anotherElementOrAssociationNotIn [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> anotherValue [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> associationWithKeyAlreadyInToAdd [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> associationWithKeyNotInToAdd [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> collection [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> collectionNotIncluded [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> collectionWithElementsToRemove [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> collectionWithEqualElements [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> collectionWithSortableElements [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> collectionWithoutEqualElements [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> collectionWithoutNilElements [
" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"
	self explicitRequirement
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> dictionaryClass [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> elementNotIn [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> elementNotInForOccurrences [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> elementToAdd [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> elementTwiceIn [
	^ 1
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> elementTwiceInForOccurrences [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> empty [

	self explicitRequirement
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> emptyDict [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> integerCollectionWithoutEqualElements [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> keyNotIn [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> keyNotInNonEmpty [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> keyNotInNonEmptyDict [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> newEmptyDict [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> nonEmpty [

	^ self explicitRequirement
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> nonEmpty1Element [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> nonEmptyDict [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> nonEmptyDifferentFromNonEmptyDict [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> nonEmptyWithCopyNonIdentical [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> nonEmptyWithoutEqualsValues [
	^ self subclassResponsibility
]

{ #category : #'tests - set arithmetic' }
AbstractMultiValuedDictionaryRootTest >> numberOfSimilarElementsInIntersection [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> sizeCollection [
	"Answers a collection not empty"
	^ self explicitRequirement
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> supportsNilKey [
	^ true
]

{ #category : #'tests - fixture' }
AbstractMultiValuedDictionaryRootTest >> test0FixtureEmptyTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
AbstractMultiValuedDictionaryRootTest >> test0FixtureIterateTest [

	| res |
	self collectionWithoutNilElements.
	self
		assert: (self collectionWithoutNilElements occurrencesOf: nil)
		equals: 0.
	res := true.
	self collectionWithoutNilElements
		detect: [ :each |
		(self collectionWithoutNilElements occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self deny: res
]

{ #category : #'tests - fixture' }
AbstractMultiValuedDictionaryRootTest >> test0TSizeTest [
	self empty.
	self sizeCollection.
	self assertEmpty: self empty.
	self denyEmpty: self sizeCollection
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAddAll [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAddWithKeyAlreadyIn [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAddWithKeyNotIn [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testAllSatisfy [

	| element |
	" when all element  satisfy the condition, should return true : "
	self assert: ( self collectionWithoutNilElements  allSatisfy: [:each | (each notNil) ] ).

	" when all element don't satisfy the condition, should return false : "
	self deny: ( self collectionWithoutNilElements  allSatisfy: [:each | (each notNil) not ] ).

	" when only one element doesn't satisfy the condition' should return false'"
	element := self collectionWithoutNilElements anyOne.
	self deny: ( self collectionWithoutNilElements  allSatisfy: [:each | (each = element) not] )
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testAllSatisfyEmpty [

	self assert: ( self empty allSatisfy: [:each | false])
]

{ #category : #'tests - set arithmetic' }
AbstractMultiValuedDictionaryRootTest >> testAnyOneWithEmptyDict [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testAnySastify [

	| element |
	" when all elements satisty the condition, should return true :"
	self assert: ( self collectionWithoutNilElements anySatisfy: [:each | each notNil ]).

	" when only one element satisfy the condition, should return true :"
	element := self collectionWithoutNilElements anyOne.
	self assert: ( self collectionWithoutNilElements  anySatisfy: [:each | (each = element)  ]   ).

	" when all elements don't satisty the condition, should return false :"
	self deny: ( self collectionWithoutNilElements anySatisfy: [:each | (each notNil) not ])
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAsStringOnDelimiterLastMore [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAsStringOnDelimiterMore [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAssociationAtIfPresent [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAssociations [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAssociationsDo [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testAssociationsSelect [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAt [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAtIfAbsent [
	^ self subclassResponsibility
]

{ #category : #'tests - set arithmetic' }
AbstractMultiValuedDictionaryRootTest >> testAtIfAbsentPut [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAtIfAbsentPut02 [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testAtIfAbsentPut03 [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testAtIfAbsentPutAll02 [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAtIfPresent [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAtIfPresentIfAbsent [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAtIfPresentIfAbsentPut [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testAtPut [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAtPutAll [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testAtPutAllTwoCollections [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAtPutDict [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testAtPutNil [
	^ self subclassResponsibility
]

{ #category : #'tests - set arithmetic' }
AbstractMultiValuedDictionaryRootTest >> testAtPutTwoValues [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testBasicCollect [

	| res index |
	index := 0.
	res := self collectionWithoutNilElements collect: [ :each |
		       index := index + 1.
		       each ].

	res do: [ :each |
		self
			assert: (self collectionWithoutNilElements occurrencesOf: each)
			equals: (res occurrencesOf: each) ].
	self assert: index equals: self collectionWithoutNilElements size
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testBasicCollectEmpty [
	| res |
	res := self empty collect: [ :each | each class ].
	self assertEmpty: res
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testBasicCollectThenDo [

	| result index |
	index := 0.
	result := self collectionWithoutNilElements
		collect: [ :each | nil ]
		thenDo: [ :each |
			self assert: each isNil.
			index := index + 1]	.

	self assert: result equals: self collectionWithoutNilElements.
	self assert: index equals: self collectionWithoutNilElements size
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testCollectOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ])
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testCollectThenDoOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testCollectThenRejectOnEmptyDict [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testCollectThenSelectOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ] thenSelect: [ :e | self fail ])
]

{ #category : #'tests - set arithmetic' }
AbstractMultiValuedDictionaryRootTest >> testDeclareFrom [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testDetect [

	| res element |
	element := self collectionWithoutNilElements anyOne.

	res := self collectionWithoutNilElements detect: [ :each |
		       each = element ].
	self assert: res equals: element
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testDetectErrorNotFound [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testDetectIfNone [

	| res element |
	res := self collectionWithoutNilElements
		       detect: [ :each | each notNil not ]
		       ifNone: [ 100 ].
	self assert: res equals: 100.

	element := self collectionWithoutNilElements anyOne.
	res := self collectionWithoutNilElements
		       detect: [ :each | each = element ]
		       ifNone: [ 100 ].
	self assert: res equals: element
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testDictionaryConcatenationWithCommonKeys [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testDictionaryConcatenationWithCommonKeysDifferentValues [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testDictionaryConcatenationWithoutCommonKeys [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testDifferenceWithNonNullIntersection [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testDifferenceWithSeparateCollection [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testDo2 [

	"dc: Bad test, it assumes that a new instance of #speciesClass allows addition with #add:. This is not the case of Interval for which species is Array."

	"res := self speciesClass new.
	self collection do: [:each | res add: each class].
	self assert: res = self result. "

	| collection cptElementsViewed cptElementsIn |
	collection := self collectionWithoutNilElements.
	cptElementsViewed := 0.
	cptElementsIn := OrderedCollection new.
	collection do: [ :each |
		cptElementsViewed := cptElementsViewed + 1.
		" #do doesn't iterate with the same objects than those in the collection for FloatArray( I don' t know why ) . That's why I use #includes: and not #identityIncludes:  '"
		(collection includes: each) ifTrue: [ " the collection used doesn't include equal elements. Therefore each element viewed should not have been viewed before "
			(cptElementsIn includes: each) ifFalse: [ cptElementsIn add: each ] ] ].
	self assert: cptElementsViewed equals: collection size.
	self assert: cptElementsIn size equals: collection size
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testDoSeparatedBy [

	| actualString beforeFirst expectedString |
	actualString := String streamContents: [ :stream |
		                self collectionWithoutNilElements
			                do: [ :each | stream nextPutAll: each asString ]
			                separatedBy: [ stream nextPutAll: '|' ] ].

	beforeFirst := true.
	expectedString := String streamContents: [ :stream |
		                  self collectionWithoutNilElements do: [ :each |
			                  beforeFirst
				                  ifTrue: [ beforeFirst := false ]
				                  ifFalse: [ stream nextPutAll: '|' ].
			                  stream nextPutAll: each asString ] ].
	self assert: expectedString equals: actualString
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testDoWithout [

	| res element collection |
	collection := self collectionWithoutNilElements.
	res := OrderedCollection new.
	element := self collectionWithoutNilElements anyOne.
	collection do: [ :each | res add: each ] without: element.
	" verifying result :"
	self
		assert: res size
		equals: collection size - (collection occurrencesOf: element).
	res do: [ :each |
		self
			assert: (collection occurrencesOf: each)
			equals: (res occurrencesOf: each) ]
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testEquality [
	^ self subclassResponsibility
]

{ #category : #'tests - empty' }
AbstractMultiValuedDictionaryRootTest >> testIfEmpty [
	self nonEmpty ifEmpty: [ self assert: false ].
	self empty ifEmpty: [ self assert: true ]
]

{ #category : #'tests - empty' }
AbstractMultiValuedDictionaryRootTest >> testIfEmptyifNotEmpty [
	self assert: (self empty ifEmpty: [ true ] ifNotEmpty: [ false ]).
	self assert: (self nonEmpty ifEmpty: [ false ] ifNotEmpty: [ true ])
]

{ #category : #'tests - empty' }
AbstractMultiValuedDictionaryRootTest >> testIfNotEmpty [

	self empty ifNotEmpty: [ self assert: false ].
	self nonEmpty ifNotEmpty: [ self assert: true ].
	self
		assert: (self nonEmpty ifNotEmpty: [ :s | s ])
		equals: self nonEmpty
]

{ #category : #'tests - empty' }
AbstractMultiValuedDictionaryRootTest >> testIfNotEmptyifEmpty [
	self assert: (self empty ifNotEmpty: [ false ] ifEmpty: [ true ]).
	self assert: (self nonEmpty ifNotEmpty: [ true ] ifEmpty: [ false ])
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testInjectInto [

	| result |
	result := self collectionWithoutNilElements
		          inject: 0
		          into: [ :inj :ele | ele ifNotNil: [ inj + 1 ] ].
	self assert: self collectionWithoutNilElements size equals: result
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testIntersectionBasic [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testIntersectionTwoSimilarElementsInIntersection [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testIsCollection [
	^ self subclassResponsibility
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testIsDictionary [
	^ self subclassResponsibility
]

{ #category : #'tests - empty' }
AbstractMultiValuedDictionaryRootTest >> testIsEmpty [
	self assert: self empty isEmpty.
	self deny: self nonEmpty isEmpty
]

{ #category : #'tests - empty' }
AbstractMultiValuedDictionaryRootTest >> testIsEmptyOrNil [
	self assert: self empty isEmptyOrNil.
	self deny: self nonEmpty isEmptyOrNil
]

{ #category : #tests }
AbstractMultiValuedDictionaryRootTest >> testKeyAtIdentityValue [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testKeyAtIdentityValueIfAbsent [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testKeyAtValue [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testKeyAtValueIfAbsent [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testKeys [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testKeysAndValuesDo [
	^ self subclassResponsibility
]

{ #category : #'tests - set arithmetic' }
AbstractMultiValuedDictionaryRootTest >> testKeysAndValuesRemove [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testKeysSortedSafely [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testNoneSatisfy [

	| element |
	self assert: ( self collectionWithoutNilElements  noneSatisfy: [:each | each notNil not ] ).
	element := self collectionWithoutNilElements anyOne.
	self deny: ( self collectionWithoutNilElements  noneSatisfy: [:each | (each = element)not ] )
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testNoneSatisfyEmpty [

	self assert: ( self empty noneSatisfy: [:each | false])
]

{ #category : #'tests - empty' }
AbstractMultiValuedDictionaryRootTest >> testNotEmpty [
	self assert: self nonEmpty notEmpty.
	self deny: self empty notEmpty
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testPrintOnDelimiter [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testReject [

	| res element |
	res := self collectionWithoutNilElements reject: [ :each |
		       each notNil not ].
	self assert: res size equals: self collectionWithoutNilElements size.

	element := self collectionWithoutNilElements anyOne.
	res := self collectionWithoutNilElements reject: [ :each |
		       each = element ].
	self
		assert: res size
		equals: self collectionWithoutNilElements size - 1
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testRejectAllThenCollect [
	| result |
	result := self collectionWithoutNilElements reject: [ :each | each notNil ] thenCollect: [ :each | self fail ].

	self assertEmpty: result
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testRejectAllThenDo [
	| result |

	result := self collectionWithoutNilElements
		reject: [ :each | each notNil ]
		thenDo: [ :each | self fail ].

	self assert: result equals: self collectionWithoutNilElements
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testRejectEmpty [

	| res |
	res := self empty reject: [ :each | each odd ].
	self assert: res size equals: self empty size
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testRejectNoReject [

	| res |
	res := self collectionWithoutNilElements reject: [ :each |
		       each notNil not ].
	self assert: res size equals: self collectionWithoutNilElements size
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testRejectThenCollect [

	| result index selectIndex pivot |

	index := 0.
	selectIndex := 0.
	pivot := self collectionWithoutNilElements anyOne.

	result := self collectionWithoutNilElements
		reject: [ :each |
			selectIndex := selectIndex + 1.
			"reject the first element"
			selectIndex = 1 ]
		thenCollect: [ :each |
			self assert: each notNil.
			index := index + 1.
			pivot ].

	self assert: result ~= self collectionWithoutNilElements.
	self assert: selectIndex equals: self collectionWithoutNilElements size.
	self assert: index equals: self collectionWithoutNilElements size - 1.

	self assert: (self collectionWithoutNilElements occurrencesOf: pivot) equals: 1.
	"should be > 1 for standard collection and = 1 for those that do not allow exact duplicates"
	self assert: (result occurrencesOf: pivot) >= 1
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testRejectThenCollectEmpty [
	self assertEmpty: (self empty reject: [ :e | self fail ] thenCollect: [ :each | self fail ])
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testRejectThenDo [

	| result index rejectIndex |

	index := 0.
	rejectIndex := 0.

	result := self collectionWithoutNilElements
		reject: [ :each |
			rejectIndex := rejectIndex + 1.
			"reject the first element"
			rejectIndex = 1 ]
		thenDo: [ :each |
			self assert: each notNil.
			index := index + 1]	.

	self assert: result equals: self collectionWithoutNilElements.
	self assert: rejectIndex equals: self collectionWithoutNilElements size.
	self assert: index equals: self collectionWithoutNilElements size - 1
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testRejectThenDoOnEmpty [
	self assertEmpty: (self empty reject: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testRemoveAll [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testRemoveKey [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> testRemoveKeyIfAbsent [
	^ self subclassResponsibility
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSelect [

	| result element |
	result := self collectionWithoutNilElements select: [ :each | each notNil].
	self assert: result size equals: self collectionWithoutNilElements size.

	element := self collectionWithoutNilElements anyOne.
	result := self collectionWithoutNilElements select: [ :each | (each = element) not].
	self assert: result size equals: (self collectionWithoutNilElements size - 1)
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSelectNoneThenCollect [
	| result |
	result := self collectionWithoutNilElements select: [ :each | each isNil ] thenCollect: [ :each | self fail ].

	self assertEmpty: result
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSelectNoneThenDo [
	| result |

	result := self collectionWithoutNilElements
		select: [ :each | each isNil ]
		thenDo: [ self fail ].

	self assert: result equals: self collectionWithoutNilElements
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSelectOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ])
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSelectThenCollect [

	| result index selectIndex pivot |

	index := 0.
	selectIndex := 0.
	pivot := self collectionWithoutNilElements anyOne.

	result := self collectionWithoutNilElements
		select: [ :each |
			selectIndex := selectIndex + 1.
			"reject the first element"
			selectIndex > 1 ]
		thenCollect: [ :each |
			self assert: each notNil.
			index := index + 1.
			pivot ].

	self assert: result ~= self collectionWithoutNilElements.
	self assert: selectIndex equals: self collectionWithoutNilElements size.
	self assert: index equals: self collectionWithoutNilElements size - 1.

	self assert: (self collectionWithoutNilElements occurrencesOf: pivot) equals: 1.
	"should be > 1 for standard collection and = 1 for those that do not allow exact duplicates"
	self assert: (result occurrencesOf: pivot) >= 1
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSelectThenCollectOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ] thenCollect: [ self fail ])
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSelectThenDo [

	| result index selectIndex |

	index := 0.
	selectIndex := 0.

	result := self collectionWithoutNilElements
		select: [ :each |
			selectIndex := selectIndex + 1.
			"reject the first element"
			selectIndex > 1 ]
		thenDo: [ :each |
			self assert: each notNil.
			index := index + 1]	.

	self assert: result equals: self collectionWithoutNilElements.
	self assert: selectIndex equals: self collectionWithoutNilElements size.
	self assert: index equals: self collectionWithoutNilElements size - 1
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSelectThenDoOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #'tests - size capacity' }
AbstractMultiValuedDictionaryRootTest >> testSize [

	| size |
	self assert: self empty size equals: 0.
	size := 0.
	self sizeCollection do: [ :each | size := size + 1 ].
	self assert: self sizeCollection size equals: size
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testSumNumbers [

	| result |
	result := self collectionWithoutNilElements sumNumbers: [ :ele |
		          ele ifNotNil: [ 1 ] ifNil: [ 0 ] ].
	self assert: self collectionWithoutNilElements size equals: result
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> valueNotIn [
	^ self subclassResponsibility
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> valueNotInNonEmpty [
	^ self subclassResponsibility
]
