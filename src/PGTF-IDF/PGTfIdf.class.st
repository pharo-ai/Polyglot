Class {
	#name : #PGTfIdf,
	#superclass : #Object,
	#instVars : [
		'corpus',
		'tfidfTable',
		'vocab',
		'idfVect',
		'corpusBagOfWords'
	],
	#category : #'PGTF-IDF'
}

{ #category : #'as yet unclassified' }
PGTfIdf >> BOW: doc [
	"Bag of Words of a Document"

	| bagofwords |
	bagofwords := Bag new.
	
	doc do: [ :each | bagofwords add: each ].
	
	^bagofwords
]

{ #category : #'as yet unclassified' }
PGTfIdf >> buildTfDoc: doc [
	"calculate Term frequencies of a single doc"
	| tokens len tfs |
	tokens := Bag new.
	len := 0.
	doc do: [ :each | tokens add: each.
							len := len + 1
		 ].
	tfs := OrderedDictionary new.
	vocab do: [ :each | tfs at: each put: ((tokens occurrencesOf: each)/len) ].
	^tfs
]

{ #category : #'as yet unclassified' }
PGTfIdf >> buildTfIdfTable [
	"Build TF-IDF Dataframe from tokenized corpus"
	
	| tftable tfVect |
	tfVect := OrderedCollection new.
	
	self buildVocab.
	corpus do: [ :each | tfVect add: (((self buildTfDoc: each) values)) . ].
	
	tfVect := tfVect asArray.
	vocab := vocab asArray.

	idfVect := vocab collect: [ :each | self inverseDocumentFrequencyOf: each ]. 
	tfVect := tfVect collect: [:each | each * idfVect ].
	
	tftable := DataFrame withRows: tfVect columnNames: vocab.
	^tftable
]

{ #category : #'as yet unclassified' }
PGTfIdf >> buildVocab [
	"Build Vocabulary from tokenized corpus"
	vocab := Set  new.
	corpus do: [ :each |	vocab := vocab union: (each asSet). ] .
	^vocab.
]

{ #category : #'as yet unclassified' }
PGTfIdf >> computeFullBagOfWords [
	corpusBagOfWords := corpus collect: [ :each | self BOW: each ].
]

{ #category : #accessing }
PGTfIdf >> corpus [
	^corpus
]

{ #category : #accessing }
PGTfIdf >> corpus: newCorpus [
	"pass corpus"

	corpus := newCorpus.
	self buildVocab.
	
]

{ #category : #'as yet unclassified' }
PGTfIdf >> inverseDocumentFrequencyOf: word [
	"calculate idf for a word"
	^ ((self corpus size) / (self numberOfDocsWithWord: word)) log.
]

{ #category : #'as yet unclassified' }
PGTfIdf >> numberOfDocsWithWord: word [
	| numOfDocsWithWord |
	numOfDocsWithWord := self corpus size.
	
	corpusBagOfWords ifNil: self computeFullBagOfWords.
	
	corpusBagOfWords do: [ :each | (each occurrencesOf: word) = 0 ifTrue: [ numOfDocsWithWord := numOfDocsWithWord-1]].
	
	^numOfDocsWithWord 
]
