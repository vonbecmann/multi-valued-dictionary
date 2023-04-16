Class {
	#name : #AbstractMultiValuedDictionaryRootTest,
	#superclass : #ClassTestCase,
	#traits : 'TIterateTest + TEmptyTest + TSizeTest',
	#classTraits : 'TIterateTest classTrait + TEmptyTest classTrait + TSizeTest classTrait',
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #testing }
AbstractMultiValuedDictionaryRootTest class >> isAbstract [

	^ self name = #AbstractMultiValuedDictionaryRootTest
]

{ #category : #requirements }
AbstractMultiValuedDictionaryRootTest >> elementTwiceIn [
	^ 1 
]
