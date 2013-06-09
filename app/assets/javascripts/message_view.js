var MessageView = function(id){

	var messages = $("#messages");
	var messageTemplate = _.template($("#message_template"));

	return {
		newMessage: function(message){
			messages.append(messageTemplate(message));
		}
	}
}