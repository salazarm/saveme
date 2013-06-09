var SemanticAnalysis = function(){

	var buzzmatch = {
		'kill' : [
			'Consider <strong>alerting the authorities</strong> or <strong>emailing</strong> us <strong>report@saviour.herokuapp.com</strong>) immediately.',
			'Is this person going to harm someone? Help them <strong>consider the consequences</strong>. Ask them if they have <strong>family</strong>'
			],
		'maim' : [
			'Consider <strong>alerting the authorities</strong> or <strong>emailing</strong> us <strong>report@saviour.herokuapp.com</strong>) immediately.',
			'Is this person going to harm someone? Help them <strong>consider the consequences</strong>. Ask them if they have <strong>family</strong>'
			],
		'suicide' : [
			'Ask them how their death would <strong>affect their family<strong>',
			'Think about his <strong>children</strong> (if he has any)',
			'Ask him/her what\'s wrong. Maybe financial troubles?'
		],
		'died' : [
			'Tell them about a hardship of yours and how you <strong>overcame</strong> a similar situation',
			'Consider having a philosophial discussion about the meaning of life'
		],
		'die' : [
			'Tell them about a hardship of yours and how you <strong>overcame</strong> a similar situation',
			'Consider having a philosophial discussion about the meaning of life'
		]	}

	var analyze = function(text){
		var matches = [];
		console.log(buzzmatch);
		for( buzzword in buzzmatch ){
			console.log(buzzword);
			var queryPat = new RegExp( buzzword, "i" /* Ignore Case */);
			if (queryPat.exec(text)) {
				matches.push(buzzword);
			}
		}
		hints = [];
		_.each(matches, function(match){
				console.log("match for "+match)
			_.each(buzzmatch[match], function(hint){
				hints.push(hint);
				buzzmatch[match] = null;
			})
		});
		return hints;
	}

	return analyze;
}
