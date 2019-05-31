Class {
	#name : #BaselineOfPolyglot,
	#superclass : #BaselineOf,
	#category : #BaselineOfPolyglot
}

{ #category : #baselines }
BaselineOfPolyglot >> baseline: spec [
	<baseline>
	spec for: #common do: [			
		"Packages"
		spec 
			package: 'PGTokenizer';
			package: 'PGTokenizer-Tests' with: [ spec requires: #('PGTokenizer') ] ].
]
