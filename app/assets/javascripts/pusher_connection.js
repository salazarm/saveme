var PusherConnection = function(id) {
	var pusher = new Pusher('15d403a27437d1df3be4');
	var channel = pusher.subscribe("private-"+id);
	var messageChannel;
	var messages = [];
	var messageView;
	var _sendMessage;
	var other;
	var conferenceSession;

	channel.bind("private-"+id, function(data) {
		messageChannel = pusher.subscribe(data.token);
		
		messageChannel.bind('client-message', function(data){
			Application.newMessage(data);
		});

		messageChannel.bind('client-disconnect', function(data){
			Application.partnerDisconnected();
		});

		// Handle user disconnecting
		window.onbeforeunload = function(e){
				messageChannel.trigger('client-disconnect', function(d){})

				//TODO: ADD RATE SAVIOUR RATING MODAL AND ALERT
				if(e){
					e.returnValue = '';
				}
				return 'a';
			}

		_sendMessage = function(message){
			messageChannel.trigger('client-message', { message: message });
		}
	});


	return {
		sendMessage : _sendMessage
	};
}