Class {
	#name : #PGTfIdfTest,
	#superclass : #TestCase,
	#instVars : [
		'documents',
		'tfidf'
	],
	#category : #'PGTF-IDF-Tests'
}

{ #category : #running }
PGTfIdfTest >> setUp [
	documents := #(
		(I am Sam)
		(Sam I am)
		(I 'don''t' like green eggs and ham)).
		
	tfidf := PGTfIdf new.
	tfidf corpus: documents .
]

{ #category : #tests }
PGTfIdfTest >> testBuildTFSingleDoc [
	|expected result|
	
	expected := OrderedDictionary newFrom: {#Sam->(1/3). #like->0. #am->(1/3) .'don''t'->0 . #and->0 . #green->0 . #eggs->0 . #I->(1/3) . #ham->0}.
	result := tfidf buildTfDoc: (documents at: 1).
	
	self assert: result equals: expected.
]

{ #category : #tests }
PGTfIdfTest >> testBuildVocab [
	| expectedVocab resultVocab |
	expectedVocab := #(I am Sam 'don''t' like green eggs and ham).
	
	resultVocab := tfidf buildVocab .
	self assert:( expectedVocab collect: [ :each | resultVocab includes: each ] ) equals: #(true true true true true true true true true)
]

{ #category : #tests }
PGTfIdfTest >> testInverseDocumentFrequencyOf [
	| words expected actual |
	words := #(I am Sam 'don''t' like green eggs and ham).
	
	expected := #(3 2 2 1 1 1 1 1 1) collect: [ :x | (3.0 / x) log ].
	actual := words collect: [ :w | tfidf inverseDocumentFrequencyOf: w ].
	
	self assert: actual equals: expected
]

{ #category : #tests }
PGTfIdfTest >> testNumberOfDocsWithWord [
	| words expectedCounts actualCounts |
	words := #(I am Sam 'don''t' like green eggs and ham).
	
	expectedCounts := #(3 2 2 1 1 1 1 1 1).
	actualCounts := words collect: [ :w | tfidf numberOfDocsWithWord: w ].
	
	self assert: actualCounts equals: expectedCounts
]
