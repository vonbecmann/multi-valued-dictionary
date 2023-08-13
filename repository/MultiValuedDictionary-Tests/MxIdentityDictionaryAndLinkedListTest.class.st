"
dictionary: IdentityDictionary 
collection: LinkedList 


"
Class {
	#name : #MxIdentityDictionaryAndLinkedListTest,
	#superclass : #MixedDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
MxIdentityDictionaryAndLinkedListTest >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #requirements }
MxIdentityDictionaryAndLinkedListTest >> valueCollectionClass [

	^ LinkedList
]
