Class {
	#name : #PGHiddenMarkovModel,
	#superclass : #Object,
	#instVars : [
		'emissionProbabilities',
		'transitionProbabilities',
		'states',
		'observations'
	],
	#category : #PGModels
}

{ #category : #'as yet unclassified' }
PGHiddenMarkovModel >> withTransitions: transitionProbs andEmissions: emissionProbs andStates: possibleStates andObservations: possibleObservations [
	transitionProbabilities := transitionProbs.
	emissionProbabilities := emissionProbs.
	states := possibleStates.
	observations := possibleObservations.
]
