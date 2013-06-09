var MessageView = function(id){
	console.log("Message View Created");
	var messageTemplate = _.template($("#message-template").html());
	$("#main").slideUp(500);
	$("#spinner").slideDown(500);

	return {
		newMessage: function(message){
			if (Application.type == 1){
				message.name = 'Samaritan';
			} else {
				message.name = 'Person in need';
			}
			$("#messages").prepend(messageTemplate(message));
		}
	}
}