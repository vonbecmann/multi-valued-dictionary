Class {
	#name : #MVSmallDictionaryAndOrderedCollectionTest,
	#superclass : #MultiValuedDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
MVSmallDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ SmallDictionary
]

{ #category : #requirements }
MVSmallDictionaryAndOrderedCollectionTest >> valueCollectionClass [

	^ OrderedCollection
]
