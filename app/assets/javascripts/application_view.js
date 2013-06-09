var ApplicationView = function(id){
	console.log("Application View Created");
	messageView = new MessageView(id);
	$("#main").slideUp(500);
	$("#spinner").slideDown(500);
	return {
	 	newMessage: function(message){
	 		messageView.newMessage(message);
	 	},

	 	closeConnection: function(){
	 		// TODO: CHANGE VIEW
	 	}
	}
}