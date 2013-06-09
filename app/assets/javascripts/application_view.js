var ApplicationView = function(id){
	console.log("Application View Created");
	var messageView = new MessageView(id);
	var semanticAnalysis = new SemanticAnalysis();
	var hintView;
	if (Application.type == 2){
		hintView = new HintView();
	} else {
    $('#requester_hints').show();
    $('#requester_tips').show();
  }
	$("#main").slideUp(500);
	$("#spinner").slideDown(500);
	return {
	 	newMessage: function(message){
	 		messageView.newMessage(message);
	 		if (Application.type == 2){
	 			if (!message.self){
	 				console.log("Checking da message");
		 			hintView.addHints(semanticAnalysis(message.message));
		 		}
	 		}	
	 	},

	 	closeConnection: function(){
	 		// TODO: CHANGE VIEW
	 	}
	}
}
