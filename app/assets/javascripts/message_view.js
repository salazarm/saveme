var MessageView = function(id){
	console.log("Message View Created");
	var messageTemplate = _.template($("#message-template").html());
	$("#main").slideUp(500);
	$("#spinner").slideDown(500);

	return {
		newMessage: function(message){
			console.log("Appending Message")
			console.log(messageTemplate(message));
			$("#messages").append(messageTemplate(message));
		}
	}
}