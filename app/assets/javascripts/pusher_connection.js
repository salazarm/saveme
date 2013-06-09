var PusherConnection = function(id, _view) {
	var pusher = new Pusher('9b7d7a30e65884a707d6');
	console.log("on ", {"channel: ": id })
	var channel = pusher.subscribe("client-"+id);
	var messageChannel;
	var messages = [];
	var _sendMessage;
	var other;
	var conferenceSession;
	var view = _view;
	var PC = this;

	$("#textsubmit").click(function(ev){
		ev.preventDefault();

		var text = $("#message-box").val();
		PC.sendMessage( text );
		view.newMessage( {message: text} );
		$("#message-box").val('');
		return false;
	})

	console.log("binded to private-token");
	channel.bind("private-token", function(data) {
		$("#spinner").hide();
		$("#messaging").slideDown(100);
		console.log({'got token: ': data.token});
		conferenceSession = data.token;
		messageChannel = pusher.subscribe('private-'+conferenceSession);
		
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

		console.log("added sendMessage");
		PC.sendMessage = function(message){
			console.log("message sent");
			messageChannel.trigger('client-message', { message: message });
		}
	});
}