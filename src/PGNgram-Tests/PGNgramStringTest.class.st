Class {
	#name : #PGNgramStringTest,
	#superclass : #TestCase,
	#instVars : [
		'text'
	],
	#category : #'PGNgram-Tests'
}

{ #category : #running }
PGNgramStringTest >> setUp [ 	
	super setUp.
	text := 'I do not like green eggs and ham'.
]

{ #category : #tests }
PGNgramStringTest >> testAsPGNgram [
	| str expected actual |
	str := 'hello'.
	expected := #(hello) asPGNgram.
	actual := str asPGNgram.
	self assert: actual equals: expected.
	
]

{ #category : #tests }
PGNgramStringTest >> testBigrams [
	| expected actual |
	
	expected := {
		#(I do) asPGNgram .
		#(do not) asPGNgram .
		#(not like) asPGNgram .
		#(like green) asPGNgram .
		#(green eggs) asPGNgram .
		#(eggs and) asPGNgram .
		#(and ham) asPGNgram }.
	
	actual := text bigrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testBigramsPadWith [
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
		
	actual := text bigramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testBigramsWithDefaultPadding [
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
		
	actual := text bigramsWithDefaultPadding.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testNgrams [
	| expected actual |
	
	expected := {
		#(I do not) asPGNgram .
		#(do not like) asPGNgram .
		#(not like green) asPGNgram .
		#(like green eggs) asPGNgram .
		#(green eggs and) asPGNgram .
		#(eggs and ham) asPGNgram }.
	
	actual := text ngrams: 3.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testNgramsPadWith [
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
		
	actual := text ngrams: 3 padWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testNgramsWithDefaultPadding [
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
		
	actual := text ngramsWithDefaultPadding: 3.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testPentagrams [
	| expected actual |
	
	expected := {
		#(I do not like green) asPGNgram .
		#(do not like green eggs) asPGNgram .
		#(not like green eggs and) asPGNgram .
		#(like green eggs and ham) asPGNgram }.
	
	actual := text pentagrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testPentagramsPadWith [
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
		
	actual := text pentagramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testPentagramsWithDefaultPadding [
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
		
	actual := text pentagramsWithDefaultPadding.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testTetragrams [
	| expected actual |
	
	expected := {
		#(I do not like) asPGNgram .
		#(do not like green) asPGNgram .
		#(not like green eggs) asPGNgram .
		#(like green eggs and) asPGNgram .
		#(green eggs and ham) asPGNgram }.
	
	actual := text tetragrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testTetragramsPadWith [
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
		
	actual := text tetragramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testTetragramsWithDefaultPadding [
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
		
	actual := text tetragramsWithDefaultPadding.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testTrigrams [
	| expected actual |
	
	expected := {
		#(I do not) asPGNgram .
		#(do not like) asPGNgram .
		#(not like green) asPGNgram .
		#(like green eggs) asPGNgram .
		#(green eggs and) asPGNgram .
		#(eggs and ham) asPGNgram }.
	
	actual := text trigrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testTrigramsPadWith [
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
		
	actual := text trigramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testTrigramsWithDefaultPadding [
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
		
	actual := text trigramsWithDefaultPadding.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testUnigrams [
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
	
	actual := text unigrams.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testUnigramsPadWith [
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
	
	actual := text unigramsPadWith: '##'.
	self assert: actual equals: expected.
]

{ #category : #tests }
PGNgramStringTest >> testUnigramsWithDefaultPadding [
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
	
	actual := text unigramsWithDefaultPadding.
	self assert: actual equals: expected.
]
