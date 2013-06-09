HintView = function(){
	showing = [];
	allHints = [];
	hintTemplate = _.template($("#hint-template").html());
	hintsDiv = $("#hints");

	return {
		addHints: function(hints){
			_.each(hints, function(hint){
				$("#tips").show();
				var	hint = $($.parseHTML(hintTemplate({content: hint})));
				showing.push(hint);
				allHints.push(hint);
				while(showing.length  >8 ){ 
					var last = showing.unshift();
					last.fadeOut(300); 
				}
					hintsDiv.prepend(hint);
					hint.hide(); 
					hint.slideDown();
			})		
		}
	}
}