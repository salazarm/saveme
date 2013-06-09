var Application = {

	applicationView: null,
	messageView: null,
	pusherConnection: null,

	init: function(person_id){
		var id = person_id;
		var ip;

		function retrieveId(){
			$.ajax({
				type: "POST",
				url: "/people",
				async: false,
				data: {
					person {
						ip: ip,
						is_anon: true
					},
				}
				success: function(data){
					id = data.id;
				}
			});
		}

		function actualInit(id) {
			ApplicationView = new ApplicationView(id);
			pusherConnection = new PusherConnection(id),

			this.partnerDisconnected = function() {
			// TODO: PARTNER DISCONNECT VIEW LOGIC
			//       Upload statistics
			},

			this.newMessage = function(message) {
				ApplicationView.newMessage(message);
			}
		}

		$("#savee").click(function() {
			// create an anonymous person
			$.get({
				url: "http://jsonip.appspot.com/", 
				success: function(data, status, jqXHR){
					ip = data.ip;
					retrieveId();
					actualInit(id);
				},
				error : function(){
					//TODO: Handle error
				}
				async : false
			});

		$("#saviour").click(function() {
			if(id != null) {
				actualInit(id);
			} else {
				retrieveId();
				actualInit(id);
			}
		})

	},


}