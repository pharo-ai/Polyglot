Class {
	#name : #PGNltkPosTagger,
	#superclass : #Object,
	#category : #PGPosTagger
}

{ #category : #'as yet unclassified' }
PGNltkPosTagger >> raw_parse: aString [
	|posTagString|
	
	PGAtlasBridge sendMessage: 
'import nltk
tokens = nltk.word_tokenize("',aString,'")
postags = nltk.pos_tag(tokens)
'.
	posTagString := PGAtlasBridge getValue: 'postags'.

	^posTagString
]
