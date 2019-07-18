Class {
	#name : #PGSpacyDependencyParser,
	#superclass : #Object,
	#category : #PGDependencyParser
}

{ #category : #'as yet unclassified' }
PGSpacyDependencyParser >> raw_parse: aString [
	|dependencyParseString|
	
	Atlas sendMessage: 
'import spacy

nlp = spacy.load("en")
relations = []
doc = nlp("',aString,'")
for token in doc:
	pair = []
	pair.append(token.text)
	pair.append(token.dep_)
	pair.append(token.head.text)
	relations.append(pair)'.
	dependencyParseString := Atlas getValue: 'relations'.

	^dependencyParseString
]
