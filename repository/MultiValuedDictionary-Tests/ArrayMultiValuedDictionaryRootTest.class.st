"
root test case for a multi-valued dictionary based on array.

"
Class {
	#name : #ArrayMultiValuedDictionaryRootTest,
	#superclass : #AbstractMultiValuedDictionaryRootTest,
	#traits : 'TIncludesTest + TDictionaryAddingTest + TDictionaryComparingTest + TDictionaryCopyingTest + TDictionaryEnumeratingTest + (TDictionaryPrintingTest - {#testPrintElementsOn. #testStoreOn}) + TDictionaryRemovingTest + (TPutBasicTest - {#testAtPutOutOfBounds}) + TAsStringCommaAndDelimiterTest + TPrintTest + TConvertTest + TConvertAsSortedTest + (TCopyTest - {#testCopyEmptyWithout. #testCopyNonEmptyWithout. #testCopyNonEmptyWithoutNotIncluded}) + TSetArithmetic + TDictionaryIncludesWithIdentityCheckTest + TDictionaryValueAccessTest + TDictionaryKeysValuesAssociationsAccess + TDictionaryKeyAccessTest + TDictionaryAssociationAccessTest + TStructuralEqualityTest + TOccurrencesForMultiplinessTest',
	#classTraits : 'TIncludesTest classTrait + TDictionaryAddingTest classTrait + TDictionaryComparingTest classTrait + TDictionaryCopyingTest classTrait + TDictionaryEnumeratingTest classTrait + TDictionaryPrintingTest classTrait + TDictionaryRemovingTest classTrait + TPutBasicTest classTrait + TAsStringCommaAndDelimiterTest classTrait + TPrintTest classTrait + TConvertTest classTrait + TConvertAsSortedTest classTrait + TCopyTest classTrait + TSetArithmetic classTrait + TDictionaryIncludesWithIdentityCheckTest classTrait + TDictionaryValueAccessTest classTrait + TDictionaryKeysValuesAssociationsAccess classTrait + TDictionaryKeyAccessTest classTrait + TDictionaryAssociationAccessTest classTrait + TStructuralEqualityTest classTrait + TOccurrencesForMultiplinessTest classTrait',
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
ArrayMultiValuedDictionaryRootTest class >> isAbstract [
	^ self name = #ArrayMultiValuedDictionaryRootTest
]

{ #category : #coverage }
ArrayMultiValuedDictionaryRootTest >> classToBeTested [
	^ ArrayMultiValuedDictionary
]

{ #category : #requirements }
ArrayMultiValuedDictionaryRootTest >> collection [
	^ self nonEmptyDict
]

{ #category : #requirements }
ArrayMultiValuedDictionaryRootTest >> collectionClass [
	" return the class to be used to create instances of the class tested"

	" it cannot be used"

	^ nil
]

{ #category : #requirements }
ArrayMultiValuedDictionaryRootTest >> dictionaryClass [
	^ self subclassResponsibility
]

{ #category : #requirements }
ArrayMultiValuedDictionaryRootTest >> empty [
	^ ArrayMultiValuedDictionary dictionary: self dictionaryClass
]

{ #category : #requirements }
ArrayMultiValuedDictionaryRootTest >> emptyDict [
	^ ArrayMultiValuedDictionary dictionary: self dictionaryClass
	
]

{ #category : #requirements }
ArrayMultiValuedDictionaryRootTest >> newEmptyDict [
	^ ArrayMultiValuedDictionary dictionary: self dictionaryClass
	
]

{ #category : #requirements }
ArrayMultiValuedDictionaryRootTest >> nonEmpty [
	^ self nonEmptyDict
]

{ #category : #'test - adding' }
ArrayMultiValuedDictionaryRootTest >> testAddAll [

	| collectionToAdd collection result oldSize |
	collection := self nonEmptyDict.
	oldSize := collection size.
	collectionToAdd := self newEmptyDict
		                   add: self associationWithKeyAlreadyInToAdd;
		                   add: self associationWithKeyNotInToAdd;
		                   yourself.

	result := collection addAll: collectionToAdd.
	self assert: result equals: collectionToAdd.
	self assert: collection size equals: oldSize + 2.

	result associationsDo: [ :assoc | 
		self assert: ((collection at: assoc key) includes: assoc value) ]
]

{ #category : #'test - adding' }
ArrayMultiValuedDictionaryRootTest >> testAddWithKeyAlreadyIn [

	| dictionary result association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyAlreadyInToAdd.
	result := dictionary add: association.
	self assert: result equals: association.
	self assert:
		((dictionary at: association key) includes: association value).
	self assert: dictionary size equals: oldSize + 1
]

{ #category : #'test - adding' }
ArrayMultiValuedDictionaryRootTest >> testAddWithKeyNotIn [

	| dictionary result association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyNotInToAdd.
	result := dictionary add: association.
	self assert: result equals: association.
	self assert:
		((dictionary at: association key) includes: association value).
	self assert: dictionary size equals: oldSize + 1
]

{ #category : #tests }
ArrayMultiValuedDictionaryRootTest >> testAnyOneWithEmptyDict [
	self should: [ self emptyDict anyOne ] raise: Error
]

{ #category : #'tests - as string comma delimiter sequenceable' }
ArrayMultiValuedDictionaryRootTest >> testAsStringOnDelimiterLastMore [

	| delim multiItemStream result last allElementsAsString tmp |
	delim := ', '.
	last := ' and '.
	result := ''.
	tmp := self nonEmpty collect: [ :each | each asString ].
	multiItemStream := ReadWriteStream on: result.
	self nonEmpty asStringOn: multiItemStream delimiter: delim last: last.
	result := multiItemStream contents.
	allElementsAsString := result findBetweenSubstrings: delim.
	tmp do: [ :each | 
		self
			assert: (tmp occurrencesOf: each)
			equals: (allElementsAsString occurrencesOf: each) ].
	self
		assert: (allElementsAsString at: allElementsAsString size - 1)
		equals: 'and'
]

{ #category : #'tests - as string comma delimiter sequenceable' }
ArrayMultiValuedDictionaryRootTest >> testAsStringOnDelimiterMore [

	| delim multiItemStream result allElementsAsString tmp |
	delim := ', '.
	result := ''.
	tmp := self nonEmpty collect: [ :each | each asString ].
	multiItemStream := ReadWriteStream on: result.
	self nonEmpty asStringOn: multiItemStream delimiter: delim.
	result := multiItemStream contents.
	allElementsAsString := result findBetweenSubstrings: delim.
	tmp do: [ :each | 
		self
			assert: (tmp occurrencesOf: each)
			equals: (allElementsAsString occurrencesOf: each) ]
]

{ #category : #'tests - dictionary assocition access' }
ArrayMultiValuedDictionaryRootTest >> testAssociationAtIfPresent [

	| collection keyIn result |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.

	result := collection associationAt: keyIn.
	self assert: result key equals: keyIn.
	self assert: result value equals: (collection at: keyIn).
	self
		assert:
		(collection associationAt: keyIn ifPresent: [ :assoc | assoc ])
		equals: result.
	self assert:
		(collection
			 associationAt: self keyNotIn
			 ifPresent: [ :assoc | assoc ]) isNil
]

{ #category : #'tests - Dictionary keys values associations access' }
ArrayMultiValuedDictionaryRootTest >> testAssociations [

	| collection result |
	collection := self nonEmpty.
	result := collection associations.
	self assert: result size equals: collection size.
	result do: [ :assoc | 
		self assert: ((collection at: assoc key) includes: assoc value) ]
	"keys do: [ :key | self assert: ( result at: key ) = ( collection at: key )] ."
]

{ #category : #'tests - dictionnary enumerating' }
ArrayMultiValuedDictionaryRootTest >> testAssociationsDo [

	| collection keys |
	collection := self nonEmptyDict .

	keys := OrderedCollection new.
	
	collection associationsDo: [ :assoc | 
		keys add: assoc key.
		self assert: ((collection at: assoc key) includes: assoc value).		
		].
	
	collection keys do: [:key | self assert: ( keys occurrencesOf: key ) >= (collection keys occurrencesOf: key)].
]

{ #category : #'tests - dictionnary enumerating' }
ArrayMultiValuedDictionaryRootTest >> testAssociationsSelect [

	| collection keys result |
	collection := self nonEmptyDict.
	keys := OrderedCollection new.
	result := collection associationsSelect: [ :assoc | 
		          keys add: assoc key.
		          true ].

	collection keys do: [ :key | 
		self assert:
			(collection keys occurrencesOf: key) <= (keys occurrencesOf: key) ].
	self assert: result equals: collection
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAt [
	"self run: #testAt"

	| collection association |
	collection := self nonEmpty.
	association := collection associations anyOne.
	self assert: ((collection at: association key) includes: association value).
	self should: [ collection at: self keyNotIn ] raise: Error
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtIfAbsent [

	"self run: #testAtIfAbsent"

	| collection association |
	collection := self nonEmpty.
	association := collection associations anyOne.
	self assert:
		((collection at: association key ifAbsent: [ Error signal ]) 
			 includes: association value).
	self
		assert: (collection at: self keyNotIn ifAbsent: [ self valueNotIn ])
		equals: self valueNotIn
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtIfAbsentPut [
	| collection association |
	collection := self nonEmpty .
	association := collection associations anyOne.
	
	collection at: association key ifAbsentPut: [ 888 ].
	self assert: ((collection at: association key) includes: association value).
	
	collection at: self keyNotIn  ifAbsentPut: [ 888 ].
	self assert: ((collection at: self keyNotIn) includes: 888).
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtIfAbsentPut02 [
	| collection association |
	collection := self emptyDict.
	association := #Key -> 888.

	collection at: association key ifAbsentPut: [ association value ].

	self assert: ((collection at: association key) includes: association value)
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtIfAbsentPut03 [
	| collection association |
	collection := self emptyDict.
	association := #Key -> 'a string value'.

	collection at: association key ifAbsentPut: [ association value ].

	self assert: ((collection at: association key) includes: association value)
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtIfAbsentPutAll02 [
	| collection association |
	collection := self emptyDict.
	association := #Key -> {888 . 889 . 890}.

	collection at: association key ifAbsentPutAll: [ association value ].

	self 
		assertCollection: (collection at: association key) 
		hasSameElements: association value
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtIfPresent [

	"self run: #testAtIfPresent"

	| collection association arg |
	collection := self nonEmpty.
	association := collection associations anyOne.
	arg := nil.
	self
		assert: (collection at: association key ifPresent: [ :value | 
				 arg := value.
				 #present ])
		equals: #present.
	self assert: (arg includes: association value).

	"ensure cull: is used to support blocks that take no args"
	self
		assert: (collection at: association key ifPresent: [ #present ])
		equals: #present.
	self assert:
		(collection at: self keyNotIn ifPresent: [ :value | Error signal ])
			isNil
]

{ #category : #tests }
ArrayMultiValuedDictionaryRootTest >> testAtIfPresentIfAbsent [
	"Test at:ifPresent:ifAbsent:"

	"to move to the corresponding trait?"

	| dict present absent |
	dict := self newEmptyDict.
	present := absent := false.
	dict at: #foo ifPresent: [ :v | present := true ] ifAbsent: [ absent := true ].
	self deny: present.
	self assert: absent.

	dict at: #foo put: #bar.
	present := absent := false.
	dict at: #foo ifPresent: [ :v | present := true ] ifAbsent: [ absent := true ].
	self assert: present.
	self deny: absent.

	present := absent := false.
	dict
		at: #foo
		ifPresent: [ :v | present := true. nil ]
		ifAbsent: [ absent := true ].
	self assert: present.
	self deny: absent
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtIfPresentIfAbsentPut [

	"self run: #testAtIfPresentIfAbsentPut"

	| collection association arg |
	collection := self nonEmpty.
	association := collection associations anyOne.
	arg := nil.
	self
		assert: (collection
				 at: association key
				 ifPresent: [ :value | 
					 arg := value.
					 #present ]
				 ifAbsentPut: [ Error signal ])
		equals: #present.
	self assert: (arg includes: association value).

	"ensure cull: is used to support blocks that take no args"
	self
		assert: (collection
				 at: association key
				 ifPresent: [ #present ]
				 ifAbsentPut: [ Error signal ])
		equals: #present.
	self assert: ((collection
			  at: self keyNotIn
			  ifPresent: [ :value | Error signal ]
			  ifAbsentPut: [ self valueNotIn ]) includes: self valueNotIn).
	self assert:
		((collection at: self keyNotIn) includes: self valueNotIn)
]

{ #category : #'tests - at put' }
ArrayMultiValuedDictionaryRootTest >> testAtPut [
	"self debug: #testAtPut"
	
	self nonEmpty at: self anIndex put: self aValue.
	self assert: ((self nonEmpty at: self anIndex) includes: self aValue).
	
]

{ #category : #'tests - at put' }
ArrayMultiValuedDictionaryRootTest >> testAtPutAll [
	self nonEmpty at: self keyNotInNonEmptyDict putAll: {51 . 53 . 73 . 87}.
	self
		assertCollection: (self nonEmpty at: self keyNotInNonEmptyDict)
		hasSameElements: {51 . 53 . 73 . 87}
]

{ #category : #'tests - at put' }
ArrayMultiValuedDictionaryRootTest >> testAtPutAllTwoCollections [
	self nonEmpty at: self keyNotInNonEmptyDict putAll: {51 . 53 . 73 . 87}.
	self nonEmpty at: self keyNotInNonEmptyDict putAll: {15 . 35 . 37 . 78}.
	self
		assertCollection: (self nonEmpty at: self keyNotInNonEmptyDict)
		hasSameElements: {51 . 53 . 73 . 87. 15 . 35 . 37 . 78}
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtPutDict [
	"self run: #testAtPutDict"
	"self debug: #testAtPutDict"
	
	| adictionary keyIn |
	adictionary := self nonEmpty .
	keyIn := adictionary keys anyOne.
	
	adictionary at: keyIn put: 'new'.
	self assert: ((adictionary at: keyIn ) includes: 'new').
	
	adictionary at: keyIn  put: 'newnew'.
	self assert: ((adictionary at: keyIn ) includes: 'newnew').
	
	adictionary at: self keyNotIn  put: 666.
	self assert: ((adictionary at: self keyNotIn) includes: 666).
]

{ #category : #'tests - DictionaryIndexAccessing' }
ArrayMultiValuedDictionaryRootTest >> testAtPutNil [

	"self run: #testAtPutNil"

	"self debug: #testAtPutNil"

	| aDictionary keyIn new |
	aDictionary := self nonEmpty.
	keyIn := aDictionary keys anyOne.

	new := 'new'.
	self assert: (aDictionary at: nil put: 'new') identicalTo: new.
	self supportsNilKey
		ifTrue: [ 
		self assert: ((aDictionary at: nil) identityIncludes: new) ]
		ifFalse: [ self deny: (aDictionary includesKey: nil) ].

	self assert: (aDictionary at: keyIn put: nil) isNil.
	self assert: ((aDictionary at: keyIn) identityIncludes: nil).

	self assert: (aDictionary at: self keyNotIn put: nil) isNil.
	self assert: ((aDictionary at: self keyNotIn) identityIncludes: nil).

	self assert: (aDictionary at: nil put: nil) isNil.
	self supportsNilKey
		ifTrue: [ 
		self assert: ((aDictionary at: nil) identityIncludes: nil) ]
		ifFalse: [ self deny: (aDictionary includesKey: nil) ]
]

{ #category : #'tests - at put' }
ArrayMultiValuedDictionaryRootTest >> testAtPutTwoValues [
	"self debug: #testAtPutTwoValues"
	
	self nonEmpty at: self anIndex put: self aValue.
	self nonEmpty at: self anIndex put: self anotherValue.
	self assert: ((self nonEmpty at: self anIndex) includes: self anotherValue).
]

{ #category : #tests }
ArrayMultiValuedDictionaryRootTest >> testCollectThenRejectOnEmptyDict [

	self assert: (self newEmptyDict collect: [ :e | self fail ] thenReject: [ :e | self fail ]) isEmpty
]

{ #category : #'test - adding' }
ArrayMultiValuedDictionaryRootTest >> testDeclareFrom [

	| newDict v dictionary keyIn associationKeyNotIn |
	dictionary := self nonEmptyDict.
	keyIn := dictionary keys anyOne.
	associationKeyNotIn := self associationWithKeyNotInToAdd.
	newDict := self newEmptyDict
		           add: associationKeyNotIn;
		           yourself.



	"if the key already exist, nothing changes"
	v := dictionary at: keyIn.
	dictionary declare: keyIn from: newDict.
	self assert: (dictionary at: keyIn) equals: v.
	self nonEmptyDict declare: associationKeyNotIn key from: newDict.
	self assert: ((dictionary at: associationKeyNotIn key) includes:
			 associationKeyNotIn value).
	self assert: newDict size equals: 0
]

{ #category : #'tests - dictionnary enumerating' }
ArrayMultiValuedDictionaryRootTest >> testDetectErrorNotFound [
	self should: [ self nonEmptyDict detect: [ :each | false ] ] raise: NotFound.
	self should: [ self emptyDict detect: [ :each | false ] ] raise: NotFound
]

{ #category : #'test - copying' }
ArrayMultiValuedDictionaryRootTest >> testDictionaryConcatenationWithCommonKeys [

	| dictionary1 dictionary2 result |
	dictionary1 := self nonEmptyDict.
	dictionary2 := self nonEmptyDict.
	result := dictionary1 , dictionary2.
	self assert: result size equals: dictionary1 size + dictionary2 size.

	dictionary2 associationsDo: [ :assoc | 
		self assert: ((result at: assoc key) includes: assoc value) ]
]

{ #category : #'test - copying' }
ArrayMultiValuedDictionaryRootTest >> testDictionaryConcatenationWithCommonKeysDifferentValues [

	| dictionary1 dictionary2 result value |
	dictionary1 := self nonEmptyDict.
	value := self nonEmptyDifferentFromNonEmptyDict values anyOne.
	dictionary2 := dictionary1 copy.
	dictionary2 keys do: [ :key | dictionary2 at: key put: value ].


	result := dictionary1 , dictionary2.
	self assert: result size equals: dictionary1 size + dictionary2 size.

	dictionary2 associationsDo: [ :assoc | 
		self assert: ((result at: assoc key) includes: assoc value) ]
]

{ #category : #'test - copying' }
ArrayMultiValuedDictionaryRootTest >> testDictionaryConcatenationWithoutCommonKeys [

	| dictionary1 dictionary2 result |
	dictionary1 := self nonEmptyDict.
	dictionary2 := self nonEmptyDifferentFromNonEmptyDict.
	result := dictionary1 , dictionary2.
	self assert: result size equals: dictionary1 size + dictionary2 size.
	dictionary1 associationsDo: [ :assoc | 
		self assert: ((result at: assoc key) includes: assoc value) ].
	dictionary2 associationsDo: [ :assoc | 
		self assert: ((result at: assoc key) includes: assoc value) ]
]

{ #category : #'tests - set arithmetic' }
ArrayMultiValuedDictionaryRootTest >> testDifferenceWithNonNullIntersection [
	"Answer the set theoretic difference of two collections."
	"self debug: #testDifferenceWithNonNullIntersection"
	"	#(1 2 3) difference: #(2 4) 
	->  #(1 3)"
	| res overlapping |
	overlapping := self newEmptyDict  
		add: self anotherElementOrAssociationNotIn;
		add: self anotherElementOrAssociationIn;
		yourself.
	res := self collection difference: overlapping.
	self deny: (res includes: self anotherElementOrAssociationIn).
	overlapping do: [ :each | self deny: (res includes: each) ]
]

{ #category : #'tests - set arithmetic' }
ArrayMultiValuedDictionaryRootTest >> testDifferenceWithSeparateCollection [
	"Answer the set theoretic difference of two collections."
	"self debug: #testDifferenceWithSeparateCollection"
	| res separateCol |
	
	separateCol := self newEmptyDict add: self anotherElementOrAssociationNotIn; yourself.
	res := self collectionWithoutEqualElements difference: separateCol.
	
	self deny: (res includes: self anotherElementOrAssociationNotIn).
	self assert: res size equals: self collectionWithoutEqualElements size.
	
	self collectionWithoutEqualElements do: [ :each|
		self assert: (res includes: each)].
	
	res := separateCol difference: self collection.
	self deny: (res includes: self collection anyOne).
	self assert: res equals: separateCol
]

{ #category : #'test - comparing' }
ArrayMultiValuedDictionaryRootTest >> testEquality [

	| nonEmptyDict2 |
	nonEmptyDict2 := self newEmptyDict.
	self nonEmpty keysAndValuesDo: [ :key :value | 
		nonEmptyDict2 at: key put: value ].
	self assert: self nonEmptyDict equals: nonEmptyDict2
]

{ #category : #'tests - set arithmetic' }
ArrayMultiValuedDictionaryRootTest >> testIntersectionBasic [
	"self debug: #testIntersectionBasic"
	| inter |
	inter := self collection intersection: (self newEmptyDict add: self anotherElementOrAssociationIn; yourself).
	self deny: inter isEmpty.
	self assert: (inter includes: self anotherElementOrAssociationIn value)
	
]

{ #category : #'tests - set arithmetic' }
ArrayMultiValuedDictionaryRootTest >> testIntersectionTwoSimilarElementsInIntersection [

	"self debug: #testIntersectionBasic"

	| inter |
	inter := self collection intersection: (self newEmptyDict
			          add: self anotherElementOrAssociationIn;
			          yourself).
	self
		assert:
		(self collection occurrencesOf: self anotherElementOrAssociationIn)
		equals: self numberOfSimilarElementsInIntersection.
	self assert:
		(inter includes: self anotherElementOrAssociationIn value)
]

{ #category : #tests }
ArrayMultiValuedDictionaryRootTest >> testIsCollection [
	self assert: self emptyDict isCollection
]

{ #category : #tests }
ArrayMultiValuedDictionaryRootTest >> testIsDictionary [
	self assert: self emptyDict isDictionary
]

{ #category : #'tests - dictionary key access' }
ArrayMultiValuedDictionaryRootTest >> testKeyAtIdentityValue [
	
	
	| dict value result |
	dict := self nonEmpty .
	value := dict values anyOne.
	
	result := dict keyAtIdentityValue: value.
	self assert: ((dict at: result) includes: value).
		
	self should: [dict keyAtIdentityValue: self valueNotIn ] raise: Error
	
	
]

{ #category : #'tests - dictionary key access' }
ArrayMultiValuedDictionaryRootTest >> testKeyAtIdentityValueIfAbsent [

	"self run: #testKeyAtValue"

	"self debug: #testKeyAtValue"

	| dict value result |
	dict := self nonEmpty.
	value := dict values anyOne.

	result := dict keyAtIdentityValue: value ifAbsent: [ nil ].
	self assert: ((dict at: result) includes: value).
	self
		assert: (dict keyAtIdentityValue: self valueNotIn ifAbsent: [ nil ])
		equals: nil
]

{ #category : #'tests - dictionary key access' }
ArrayMultiValuedDictionaryRootTest >> testKeyAtValue [
	"self run: #testKeyAtValue"
	"self debug: #testKeyAtValue"
	
	| dict value result |
	dict := self nonEmpty .
	value := dict values anyOne.
	
	result := dict keyAtValue: value.
	self assert: ((dict at: result) includes: value).
		
	self should: [dict keyAtValue: self valueNotIn ] raise: Error
	
	
]

{ #category : #'tests - dictionary key access' }
ArrayMultiValuedDictionaryRootTest >> testKeyAtValueIfAbsent [

	"self run: #testKeyAtValue"

	"self debug: #testKeyAtValue"

	| dict value result |
	dict := self nonEmpty.
	value := dict values anyOne.

	result := dict keyAtValue: value ifAbsent: [ nil ].
	self assert: ((dict at: result) includes: value).
	self
		assert: (dict keyAtValue: self valueNotIn ifAbsent: [ nil ])
		equals: nil
]

{ #category : #'tests - Dictionary keys values associations access' }
ArrayMultiValuedDictionaryRootTest >> testKeys [
	| collection result |
	collection := self nonEmpty.
	result := collection keys.
	result do: [ :key | collection at: key ].
	"self assert: result size = collection size. <- not true anymore in a multi dictionary"
	self should: [ result detect: [ :each | (result occurrencesOf: each) > 1 ] ] raise: Error
]

{ #category : #'tests - dictionnary enumerating' }
ArrayMultiValuedDictionaryRootTest >> testKeysAndValuesDo [

	
	| collection keys |
	collection := self nonEmptyDict .
	keys := OrderedCollection new.
	collection keysAndValuesDo: [ :key :value | 
		keys add: key.
		self assert: ((collection at: key) includes: value) ].
	
	collection keys do: [ :key | self assert: (collection keys occurrencesOf: key) <= (keys occurrencesOf: key)]
]

{ #category : #'test - removing' }
ArrayMultiValuedDictionaryRootTest >> testKeysAndValuesRemove [
	self
		should: [ self nonEmptyDict keysAndValuesRemove: [ :key :value | 'What ever here' ] ]
		raise: Error
]

{ #category : #'tests - Dictionary keys values associations access' }
ArrayMultiValuedDictionaryRootTest >> testKeysSortedSafely [
	| collection result |
	collection := self nonEmpty.
	result := collection keysSortedSafely.
	result do: [ :key | collection at: key ].
	"self assert: result size = collection size. <- not true anymore in a multi dictionary"
	self should: [ result detect: [ :each | (result occurrencesOf: each) > 1 ] ] raise: Error.
	self assert: result asArray isSorted
]

{ #category : #tests }
ArrayMultiValuedDictionaryRootTest >> testNew [
	self should: [ self targetClass new ] raise: Error
]

{ #category : #'tests - printing' }
ArrayMultiValuedDictionaryRootTest >> testPrintOnDelimiter [
	
	| result allElementsAsString tmp |
	
	result := String streamContents: [ :aStream |
		tmp := OrderedCollection new.
		self nonEmpty do: [:each | tmp add:(String streamContents: [:s | s print: each ])].
		self nonEmpty printOn: aStream delimiter: ', ' ].
	
	allElementsAsString := (result findBetweenSubstrings: ', ').
	
	1 to: allElementsAsString size do:
		[:i | 
		self assert: (tmp occurrencesOf:(allElementsAsString at:i)) equals: (allElementsAsString  occurrencesOf:(allElementsAsString at:i)) ].
]

{ #category : #tests }
ArrayMultiValuedDictionaryRootTest >> testRemoveAll [

	"Allows one to remove all elements of a collection"

	| dict1 dict2 s2 |
	dict1 := self newEmptyDict.
	dict1
		at: #a put: 1;
		at: #b put: 2.
	dict2 := dict1 copy.
	s2 := dict2 size.

	dict1 removeAll.
	self assert: dict1 size equals: 0.
	self
		assert: dict2 size = s2
		description: 'the copy has not been modified'
]

{ #category : #'test - removing' }
ArrayMultiValuedDictionaryRootTest >> testRemoveKey [

	"self debug: #testRemoveKey"

	| collection oldSize keyIn numberOfValues |
	collection := self nonEmptyDict.
	oldSize := collection size.
	keyIn := collection keys anyOne.
	numberOfValues := (collection at: keyIn) size.

	collection removeKey: keyIn.
	self assert: collection size equals: oldSize - numberOfValues.
	self should: [ collection at: keyIn ] raise: Error.

	self
		should: [ collection removeKey: self keyNotInNonEmptyDict ]
		raise: Error
]

{ #category : #'test - removing' }
ArrayMultiValuedDictionaryRootTest >> testRemoveKeyIfAbsent [

	| collection oldSize keyIn value numberOfValues result |
	collection := self nonEmptyDict.
	oldSize := collection size.
	keyIn := collection keys anyOne.
	value := collection at: keyIn.
	numberOfValues := value size.

	result := collection removeKey: keyIn ifAbsent: [ 888 ].
	self assert: result equals: value.
	self assert: collection size equals: oldSize - numberOfValues.
	self should: [ collection at: keyIn ] raise: Error.
	self
		assert:
		(collection removeKey: self keyNotInNonEmptyDict ifAbsent: [ 888 ])
		equals: 888
]
