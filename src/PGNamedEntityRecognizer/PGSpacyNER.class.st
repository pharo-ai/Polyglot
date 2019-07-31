Class {
	#name : #PGSpacyNER,
	#superclass : #Object,
	#category : #PGNamedEntityRecognizer
}

{ #category : #'as yet unclassified' }
PGSpacyNER >> raw_parse: aString [
	|nerString|
	
	PGAtlasBridge sendMessage: 
'import spacy

nlp = spacy.load("en")
ents = []
doc = nlp("',aString,'")
for ent in doc.ents:
	pair = {}
	pair[ent.text] = ent.label_
	ents.append(pair)'.
	nerString := PGAtlasBridge getValue: 'ents'.

	^nerString
]
