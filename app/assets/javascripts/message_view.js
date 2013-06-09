var MessageView = function(id){
	console.log("Message View Created");
	var messages = $("#messages");
	var messageTemplate = _.template($("#message_template"));
	$("#main").slideUp(500);
	$("#spinner").slideDown(500);

	return {
		newMessage: function(message){
			console.log("Appending Message")
			console.log(messages);
			messages.append(messageTemplate(message));
		}
	}
}