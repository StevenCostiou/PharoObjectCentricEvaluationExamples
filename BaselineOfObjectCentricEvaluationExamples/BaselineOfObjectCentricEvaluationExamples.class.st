Class {
	#name : #BaselineOfObjectCentricEvaluationExamples,
	#superclass : #BaselineOf,
	#category : #BaselineOfObjectCentricEvaluationExamples
}

{ #category : #baselines }
BaselineOfObjectCentricEvaluationExamples >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Talents'
				with: [ spec repository: 'github://tesonep/pharo-talents/src' ].
			spec blessing: #baseline.
			spec
				repository: 'github://StevenCostiou/ObjectCentricEvaluationExamples'.
			spec
				description:
					'Evaluation scripts and examples for Pharo object-centric instrumentation'.
			spec package: 'ObjectCentricEvaluationExamples' ]
]