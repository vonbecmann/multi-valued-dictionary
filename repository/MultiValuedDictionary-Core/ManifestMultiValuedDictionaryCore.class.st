"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMultiValuedDictionaryCore,
	#superclass : #PackageManifest,
	#category : 'MultiValuedDictionary-Core'
}

{ #category : #'code-critics' }
ManifestMultiValuedDictionaryCore class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MultiValuedDictionary #collect: #false)) #'2016-06-28T15:42:24.938187-03:00') #(#(#RGMethodDefinition #(#MultiValuedDictionary #reject: #false)) #'2016-06-28T15:42:24.938368-03:00') #(#(#RGMethodDefinition #(#MultiValuedDictionary #select: #false)) #'2016-06-28T15:42:24.938544-03:00') )
]

{ #category : #'code-critics' }
ManifestMultiValuedDictionaryCore class >> ruleUnaryAccessingMethodWithoutReturnRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MultiValuedDictionary #anyOne #false)) #'2016-09-03T19:25:05.773327-03:00') #(#(#RGMethodDefinition #(#ArrayMultiValuedDictionary #anyOne #false)) #'2016-09-03T19:25:05.77317-03:00') )
]
