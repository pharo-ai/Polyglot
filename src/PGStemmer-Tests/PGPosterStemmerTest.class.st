Class {
	#name : #PGPosterStemmerTest,
	#superclass : #TestCase,
	#instVars : [
		'stemmer'
	],
	#category : #'PGStemmer-Tests'
}

{ #category : #running }
PGPosterStemmerTest >> setUp [
	super setUp.
]

{ #category : #tests }
PGPosterStemmerTest >> testStemOf [

	self assert: (PGPorterStemmer stemOf: $a) equals: $a .
	self assert: (PGPorterStemmer stemOf: String empty) equals: String empty.
	self assert: (PGPorterStemmer stemOf: 'caresses') equals: 'caress'.
	self assert: (PGPorterStemmer stemOf: #('sky' 'happy' 'a')) equals: #('sky' 'happi' 'a').
	self assert: (PGPorterStemmer stemOf: 'Working with one of the best') equals: #('sky' 'happi' 'a').
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1a_1 [
	|result expected|
	expected := 'caress'.
	
	stemmer := PGPorterStemmer for: 'caresses'.
	result := stemmer preprocessing; setMarks; step1a; string.
				
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1a_2 [
	|result expected|
	expected := 'poni'.
	
	stemmer := PGPorterStemmer for: 'ponies'.
	result := stemmer preprocessing; setMarks; step1a; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1a_3 [
	|result expected|
	expected := 'ti'.
	
	stemmer := PGPorterStemmer for: 'ties'.
	result := stemmer preprocessing; setMarks; step1a; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1a_4 [
	|result expected|
	expected := 'cat'.
	
	stemmer := PGPorterStemmer for: 'cats'.
	result := stemmer preprocessing; setMarks; step1a; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1b_1 [
	|result expected|
	expected := 'feed'.
	
	stemmer := PGPorterStemmer for: 'feed'.
	result := stemmer preprocessing; setMarks; step1a; step1b; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1b_2 [
	|result expected|
	expected := 'agree'.
	
	stemmer := PGPorterStemmer for: 'agreed'.
	result := stemmer preprocessing; setMarks; step1a; step1b; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1b_3 [
	|result expected|
	expected := 'plaster'.
	
	stemmer := PGPorterStemmer for: 'plastered'.
	result := stemmer preprocessing; setMarks; step1a; step1b; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1b_4 [
	|result expected|
	expected := 'motor'.
	
	stemmer := PGPorterStemmer for: 'motoring'.
	result := stemmer preprocessing; setMarks; step1a; step1b; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1b_5 [
	|result expected|
	expected := 'bled'.
	
	stemmer := PGPorterStemmer for: 'bled'.
	result := stemmer preprocessing; setMarks; step1a; step1b; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1b_6 [
	|result expected|
	expected := 'conflate'.
	
	stemmer := PGPorterStemmer for: 'conflated'.
	result := stemmer preprocessing; setMarks; step1a; step1b; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1b_7 [
	|result expected|
	expected := 'size'.
	
	stemmer := PGPorterStemmer for: 'sized'.
	result := stemmer preprocessing; setMarks; step1a; step1b; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1b_8 [
	|result expected|
	expected := 'trouble'.
	
	stemmer := PGPorterStemmer for: 'troubled'.
	result := stemmer preprocessing; setMarks; step1a; step1b; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1c_1 [
	|result expected|
	expected := 'happi'.
	
	stemmer := PGPorterStemmer for: 'happy'.
	result := stemmer preprocessing; setMarks; step1a; step1b; step1c; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep1c_2 [
	|result expected|
	expected := 'sky'.
	
	stemmer := PGPorterStemmer for: 'sky'.
	result := stemmer preprocessing; setMarks; step1a; step1b; step1c; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep2_1 [
	|result expected|
	expected := 'valence'.
	
	stemmer := PGPorterStemmer for: 'valenci'.
	result := stemmer preprocessing; setMarks; step1a; step1b; step1c; step2; string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep3_1 [
	|result expected|
	expected := 'triplic'.
	
	stemmer := PGPorterStemmer for: 'triplicate'.
	result := stemmer preprocessing; setMarks; step1a; step1b; step1c; step2; step3;string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep4_1 [
	|result expected|
	expected := 'reviv'.
	
	stemmer := PGPorterStemmer for: 'revival'.
	result := stemmer preprocessing; setMarks; step4;string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep5a_1 [
	|result expected|
	expected := 'probat'.
	
	stemmer := PGPorterStemmer for: 'probate'.
	result := stemmer preprocessing; setMarks;step5a;string.
	self assert: result equals: expected .
]

{ #category : #tests }
PGPosterStemmerTest >> testStep5b_1 [
	|result expected|
	expected := 'control'.
	
	stemmer := PGPorterStemmer for: 'controll'.
	result := stemmer preprocessing; setMarks;step5b;string.
	self assert: result equals: expected .
]
