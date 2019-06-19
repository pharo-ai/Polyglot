Class {
	#name : #PGNgramSequenceableCollectionTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'PGNgram-Tests'
}

{ #category : #running }
PGNgramSequenceableCollectionTest >> setUp [ 
	super setUp.
	collection := #(I do not like green eggs and ham).
]

{ #category : #running }
PGNgramSequenceableCollectionTest >> testAsPGNgram [
	| ngram |
	ngram := collection asPGNgram.
	self assert: ngram order equals: 8.
	self assert: ngram history equals: #(I do not like green eggs and) asPGNgram.
	self assert: ngram last equals: 'ham'.
]

{ #category : #running }
PGNgramSequenceableCollectionTest >> testBigrams [
	| expected actual |
	
	expected := {
		#(I do) asPGNgram .
		#(do not) asPGNgram .
		#(not like) asPGNgram .
		#(like green) asPGNgram .
		#(green eggs) asPGNgram .
		#(eggs and) asPGNgram .
		#(and ham) asPGNgram }.
	
	actual := collection bigrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testBigramsPadWith [
	| expected actual |
	
	expected := {
		#('##' I) asPGNgram .
		#(I do) asPGNgram .
		#(do not) asPGNgram .
		#(not like) asPGNgram .
		#(like green) asPGNgram .
		#(green eggs) asPGNgram .
		#(eggs and) asPGNgram .
		#(and ham) asPGNgram .
		#(ham '##') asPGNgram }.
		
	actual := collection bigramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testBigramsWithDefaultPadding [
	| expected actual |
	
	expected := {
		#('<s>' I) asPGNgram .
		#(I do) asPGNgram .
		#(do not) asPGNgram .
		#(not like) asPGNgram .
		#(like green) asPGNgram .
		#(green eggs) asPGNgram .
		#(eggs and) asPGNgram .
		#(and ham) asPGNgram .
		#(ham '<s>') asPGNgram }.
		
	actual := collection bigramsWithDefaultPadding.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testNgrams [
	| expected actual |
	
	expected := {
		#(I do not) asPGNgram .
		#(do not like) asPGNgram .
		#(not like green) asPGNgram .
		#(like green eggs) asPGNgram .
		#(green eggs and) asPGNgram .
		#(eggs and ham) asPGNgram }.
	
	actual := collection ngrams: 3.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testNgramsPadWith [
	| expected actual |
	
	expected := {
		#('##' '##' I) asPGNgram .
		#('##' I do) asPGNgram .
		#(I do not) asPGNgram .
		#(do not like) asPGNgram .
		#(not like green) asPGNgram .
		#(like green eggs) asPGNgram .
		#(green eggs and) asPGNgram .
		#(eggs and ham) asPGNgram .
		#(and ham '##') asPGNgram .
		#(ham '##' '##') asPGNgram }.
		
	actual := collection ngrams: 3 padWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testNgramsWithDefaultPadding [
	| expected actual |
	
	expected := {
		#('<s>' '<s>' I) asPGNgram .
		#('<s>' I do) asPGNgram .
		#(I do not) asPGNgram .
		#(do not like) asPGNgram .
		#(not like green) asPGNgram .
		#(like green eggs) asPGNgram .
		#(green eggs and) asPGNgram .
		#(eggs and ham) asPGNgram .
		#(and ham '<s>') asPGNgram .
		#(ham '<s>' '<s>') asPGNgram }.
		
	actual := collection ngramsWithDefaultPadding: 3.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testPentagrams [
	| expected actual |
	
	expected := {
		#(I do not like green) asPGNgram .
		#(do not like green eggs) asPGNgram .
		#(not like green eggs and) asPGNgram .
		#(like green eggs and ham) asPGNgram }.
	
	actual := collection pentagrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testPentagramsPadWith [
	| expected actual |
	
	expected := {
		#('##' '##' '##' '##' I) asPGNgram .
		#('##' '##' '##' I do) asPGNgram .
		#('##' '##' I do not) asPGNgram .
		#('##' I do not like) asPGNgram .
		#(I do not like green) asPGNgram .
		#(do not like green eggs) asPGNgram .
		#(not like green eggs and) asPGNgram .
		#(like green eggs and ham) asPGNgram .
		#(green eggs and ham '##') asPGNgram .
		#(eggs and ham '##' '##') asPGNgram .
		#(and ham '##' '##' '##') asPGNgram .
		#(ham '##' '##' '##' '##') asPGNgram }.
		
	actual := collection pentagramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testPentagramsWithDefaultPadding [
	| expected actual |
	
	expected := {
		#('<s>' '<s>' '<s>' '<s>' I) asPGNgram .
		#('<s>' '<s>' '<s>' I do) asPGNgram .
		#('<s>' '<s>' I do not) asPGNgram .
		#('<s>' I do not like) asPGNgram .
		#(I do not like green) asPGNgram .
		#(do not like green eggs) asPGNgram .
		#(not like green eggs and) asPGNgram .
		#(like green eggs and ham) asPGNgram .
		#(green eggs and ham '<s>') asPGNgram .
		#(eggs and ham '<s>' '<s>') asPGNgram .
		#(and ham '<s>' '<s>' '<s>') asPGNgram .
		#(ham '<s>' '<s>' '<s>' '<s>') asPGNgram }.
		
	actual := collection pentagramsWithDefaultPadding.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testTetragrams [
	| expected actual |
	
	expected := {
		#(I do not like) asPGNgram .
		#(do not like green) asPGNgram .
		#(not like green eggs) asPGNgram .
		#(like green eggs and) asPGNgram .
		#(green eggs and ham) asPGNgram }.
	
	actual := collection tetragrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testTetragramsPadWith [
	| expected actual |
	
	expected := {
		#('##' '##' '##' I) asPGNgram .
		#('##' '##' I do) asPGNgram .
		#('##' I do not) asPGNgram .
		#(I do not like) asPGNgram .
		#(do not like green) asPGNgram .
		#(not like green eggs) asPGNgram .
		#(like green eggs and) asPGNgram .
		#(green eggs and ham) asPGNgram .
		#(eggs and ham '##') asPGNgram .
		#(and ham '##' '##') asPGNgram .
		#(ham '##' '##' '##') asPGNgram }.
		
	actual := collection tetragramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testTetragramsWithDefaultPadding [
	| expected actual |
	
	expected := {
		#('<s>' '<s>' '<s>' I) asPGNgram .
		#('<s>' '<s>' I do) asPGNgram .
		#('<s>' I do not) asPGNgram .
		#(I do not like) asPGNgram .
		#(do not like green) asPGNgram .
		#(not like green eggs) asPGNgram .
		#(like green eggs and) asPGNgram .
		#(green eggs and ham) asPGNgram .
		#(eggs and ham '<s>') asPGNgram .
		#(and ham '<s>' '<s>') asPGNgram .
		#(ham '<s>' '<s>' '<s>') asPGNgram }.
		
	actual := collection tetragramsWithDefaultPadding.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testTrigrams [
	| expected actual |
	
	expected := {
		#(I do not) asPGNgram .
		#(do not like) asPGNgram .
		#(not like green) asPGNgram .
		#(like green eggs) asPGNgram .
		#(green eggs and) asPGNgram .
		#(eggs and ham) asPGNgram }.
	
	actual := collection trigrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testTrigramsPadWith [
	| expected actual |
	
	expected := {
		#('##' '##' I) asPGNgram .
		#('##' I do) asPGNgram .
		#(I do not) asPGNgram .
		#(do not like) asPGNgram .
		#(not like green) asPGNgram .
		#(like green eggs) asPGNgram .
		#(green eggs and) asPGNgram .
		#(eggs and ham) asPGNgram .
		#(and ham '##') asPGNgram .
		#(ham '##' '##') asPGNgram }.
		
	actual := collection trigramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testTrigramsWithDefaultPadding [
	| expected actual |
	
	expected := {
		#('<s>' '<s>' I) asPGNgram .
		#('<s>' I do) asPGNgram .
		#(I do not) asPGNgram .
		#(do not like) asPGNgram .
		#(not like green) asPGNgram .
		#(like green eggs) asPGNgram .
		#(green eggs and) asPGNgram .
		#(eggs and ham) asPGNgram .
		#(and ham '<s>') asPGNgram .
		#(ham '<s>' '<s>') asPGNgram }.
		
	actual := collection trigramsWithDefaultPadding.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testUnigrams [
	| expected actual |
	
	expected := {
		#(I) asPGNgram .
		#(do) asPGNgram .
		#(not) asPGNgram .
		#(like) asPGNgram .
		#(green) asPGNgram .
		#(eggs) asPGNgram .
		#(and) asPGNgram .
		#(ham) asPGNgram }.
	
	actual := collection unigrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testUnigramsPadWith [
	| expected actual |
	
	expected := {
		#(I) asPGNgram .
		#(do) asPGNgram .
		#(not) asPGNgram .
		#(like) asPGNgram .
		#(green) asPGNgram .
		#(eggs) asPGNgram .
		#(and) asPGNgram .
		#(ham) asPGNgram }.
	
	actual := collection unigramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramSequenceableCollectionTest >> testUnigramsWithDefaultPadding [
	| expected actual |
	
	expected := {
		#(I) asPGNgram .
		#(do) asPGNgram .
		#(not) asPGNgram .
		#(like) asPGNgram .
		#(green) asPGNgram .
		#(eggs) asPGNgram .
		#(and) asPGNgram .
		#(ham) asPGNgram }.
	
	actual := collection unigramsWithDefaultPadding.
	self assert: actual equals: expected.
]
