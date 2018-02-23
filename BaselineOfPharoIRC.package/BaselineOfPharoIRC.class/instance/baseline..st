baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
				spec
					package: 'Pharo-IRC-Base';
					package: 'Pharo-IRC-GUI';
					package: 'Pharo-IRC-Tests';
					package: 'PharoIRC' with: [ spec requires: #('Pharo-IRC-Base'. 'Pharo-IRC-GUI'. 'Pharo-IRC-Tests') ].
				spec group: 'default' with: #('Pharo-IRC-Base'. 'Phari-IRC-GUI'. 'Phari-IRC-Tests') ].