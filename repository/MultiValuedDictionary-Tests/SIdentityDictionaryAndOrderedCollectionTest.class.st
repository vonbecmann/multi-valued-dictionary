"
dictionary: IdentityDictionary 
collection: OrderedCollection 

"
Class {
	#name : #SIdentityDictionaryAndOrderedCollectionTest,
	#superclass : #SimpleDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #accessing }
SIdentityDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #requirements }
SIdentityDictionaryAndOrderedCollectionTest >> valueCollectionClass [

	^ OrderedCollection
]
