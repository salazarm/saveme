var ApplicationView = function(id){
	console.log("Application View Created");
	messageView = new MessageView(id);
	$("#main").slideUp(500);
	$("#messaging").slideDown();
	return {
	 	newMessage: function(message){
	 		messagesView.append(message);
	 	},

	 	closeConnection: function(){
	 		// TODO: CHANGE VIEW
	 	}
	}
}