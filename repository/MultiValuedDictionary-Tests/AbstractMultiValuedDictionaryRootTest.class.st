Class {
	#name : #AbstractMultiValuedDictionaryRootTest,
	#superclass : #ClassTestCase,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
AbstractMultiValuedDictionaryRootTest class >> isAbstract [

	^ self name = #AbstractMultiValuedDictionaryRootTest
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> collectionWithoutNilElements [
" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"
	self explicitRequirement
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> elementTwiceIn [
	^ 1
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> empty [

	self explicitRequirement
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> nonEmpty [

	^ self explicitRequirement
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

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testCollectThenSelectOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ] thenSelect: [ :e | self fail ])
]

{ #category : #'tests - iterating' }
AbstractMultiValuedDictionaryRootTest >> testDetect [

	| res element |
	element := self collectionWithoutNilElements anyOne.

	res := self collectionWithoutNilElements detect: [ :each |
		       each = element ].
	self assert: res equals: element
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

	| string expectedString beforeFirst |
	string := ''.
	self collectionWithoutNilElements
		do: [ :each | string := string , each asString ]
		separatedBy: [ string := string , '|' ].

	expectedString := ''.
	beforeFirst := true.
	self collectionWithoutNilElements do: [ :each |
		beforeFirst
			ifTrue: [ beforeFirst := false ]
			ifFalse: [ expectedString := expectedString , '|' ].
		expectedString := expectedString , each asString ].
	self assert: expectedString equals: string
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
		          into: [ :inj :ele | ele notNil ifTrue: [ inj + 1 ] ].
	self assert: self collectionWithoutNilElements size equals: result
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
		          ele notNil
			          ifTrue: [ 1 ]
			          ifFalse: [ 0 ] ].
	self assert: self collectionWithoutNilElements size equals: result
]
