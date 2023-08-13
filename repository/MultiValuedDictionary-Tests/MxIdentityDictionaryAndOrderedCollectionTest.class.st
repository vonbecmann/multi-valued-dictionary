"
dictionary: IdentityDictionary 
collection: OrderedCollection 



"
Class {
	#name : #MxIdentityDictionaryAndOrderedCollectionTest,
	#superclass : #MixedDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
MxIdentityDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #requirements }
MxIdentityDictionaryAndOrderedCollectionTest >> valueCollectionClass [

	^ OrderedCollection
]
