baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec package: 'PharoIRC'.
			spec group: 'default' with: #('Pharo-IRC-Base'. 'Phari-IRC-GUI'. 'Phari-IRC-Tests') ].