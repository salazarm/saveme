var ApplicationView = function(id){

	messageView = new MessageView(id);

	return {
	 	newMessage: function(message){
	 		messagesView.append(message);
	 	},

	 	closeConnection: function(){
	 		// TODO: CHANGE VIEW
	 	}
	}
}