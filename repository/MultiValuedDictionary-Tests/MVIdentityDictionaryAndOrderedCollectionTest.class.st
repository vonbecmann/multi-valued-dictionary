Class {
	#name : #MVIdentityDictionaryAndOrderedCollectionTest,
	#superclass : #MultiValuedDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
MVIdentityDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #requirements }
MVIdentityDictionaryAndOrderedCollectionTest >> valueCollectionClass [

	^ OrderedCollection
]
