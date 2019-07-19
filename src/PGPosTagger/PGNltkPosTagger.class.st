Class {
	#name : #PGNltkPosTagger,
	#superclass : #Object,
	#category : #PGPosTagger
}

{ #category : #'as yet unclassified' }
PGNltkPosTagger >> raw_parse: aString [
	|posTagString|
	
	Atlas sendMessage: 
'import nltk
tokens = nltk.word_tokenize("',aString,'")
postags = nltk.pos_tag(tokens)
'.
	posTagString := Atlas getValue: 'postags'.

	^posTagString
]
