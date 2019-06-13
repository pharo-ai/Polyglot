Class {
	#name : #PGNgramTest,
	#superclass : #TestCase,
	#category : #'PGNgram-Tests'
}

{ #category : #tests }
PGNgramTest >> testAsArray [
	| ngram expected actual |
	ngram := #(1 2 3) asPGNgram.
	expected := #(1 2 3).
	actual := ngram asArray.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramTest >> testEquality [
	| firstNgram secondNgram |
	firstNgram := #(lorem ipsum dolor) asPGNgram.
	secondNgram :=  #(lorem ipsum dolor) asPGNgram.
	
	self assert: firstNgram equals: secondNgram.
	self assert: firstNgram hash equals: secondNgram hash.
]

{ #category : #tests }
PGNgramTest >> testHistory [
	| ngram |
	ngram := #(lorem ipsum dolor) asPGNgram. 
	self assert: ngram history equals: #(lorem ipsum) asPGNgram.
]

{ #category : #tests }
PGNgramTest >> testInequalitySize [
	| firstNgram secondNgram |
	firstNgram := #(lorem ipsum) asPGNgram.
	secondNgram :=  #(lorem ipsum dolor) asPGNgram.
	
	self deny: firstNgram equals: secondNgram.
	self deny: firstNgram hash equals: secondNgram hash.
]

{ #category : #tests }
PGNgramTest >> testInequalityValues [
	| firstNgram secondNgram |
	firstNgram := #(lorem dolor dolor) asPGNgram.
	secondNgram :=  #(lorem ipsum dolor) asPGNgram.
	
	self deny: firstNgram equals: secondNgram.
	self deny: firstNgram hash equals: secondNgram hash.
]

{ #category : #tests }
PGNgramTest >> testLast [
	| ngram |
	ngram := #(lorem ipsum dolor) asPGNgram. 
	self assert: ngram last equals: 'dolor'.
]

{ #category : #tests }
PGNgramTest >> testNew [
	self should: [ PGNgram new ] raise: Error.
]

{ #category : #tests }
PGNgramTest >> testOrder [
	| ngram |
	ngram := #(lorem ipsum dolor sit) asPGNgram. 
	self assert: ngram order equals: 4.
]

{ #category : #tests }
PGNgramTest >> testPrintOn [
	| ngram stream expected actual |
	
	ngram := #(hello world) asPGNgram.
	stream := String new writeStream.
	ngram printOn: stream.
	
	expected := 'PGn-gram(hello world)'.
	actual := stream contents.
	
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramTest >> testWithElements [
	| ngram |
	ngram := PGNgram withElements: #(1 2 3).
	self assert: ngram order equals: 3.
]

{ #category : #tests }
PGNgramTest >> testWithElementsEmptyArray [
	| ngram |
	ngram := PGNgram withElements: #().
	self assert: ngram order equals: 0.
]

{ #category : #tests }
PGNgramTest >> testWithHistoryLast [
	| expected actual |
	expected := #(1 2 3) asPGNgram.
	actual := PGNgram withHistory: #(1 2) asPGNgram last: 3.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramTest >> testZerogram [
	| ngram |
	ngram := PGNgram zerogram. 
	self assert: ngram order equals: 0.
	self assert: ngram history isEmpty.
	self assert: ngram last isNil.
]
