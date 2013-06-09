var PusherConnection = function(id, _view) {
	var pusher = new Pusher('15d403a27437d1df3be4');
	console.log("on ", {"channel: ": id })
	var channel = pusher.subscribe("client-"+id);
	var messageChannel;
	var messages = [];
	var messageView;
	var _sendMessage;
	var other;
	var conferenceSession;
	var view = _view;

	channel.bind("private-token", function(data) {
		console.log({'got token: ': data.token});
		conferenceSession = data.token;
		messageChannel = pusher.subscribe('client-'+conferenceSession);
		
		console.log("Binded to messages");
		messageChannel.bind('client-message', function(data){
			console.log("received message");
			view.newMessage(data);
		});

		console.log("Binded to disconnects");
		messageChannel.bind('client-disconnect', function(data){
			console.log("other person dc.")
			view.partnerDisconnected();
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
			console.log("message sent");
			messageChannel.trigger('client-message', { message: message });
		}
	});


	return {
		sendMessage : _sendMessage
	};
}