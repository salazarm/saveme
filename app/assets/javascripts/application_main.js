var Application = {

	applicationView: null,
	messageView: null,
	pusherConnection: null,

	init: function(person_id){
		console.log("--Application Init---");
		var id = person_id;
		var ip;

		function retrieveId(){
			console.log("--- Application retrieve Id ---")
			$.ajax({
				type: "POST",
				url: "/people",
				async: false,
				data: {
					person : {
						ip: ip,
						is_anon: true
					},
				},

				success: function(data){
					id = data.id;
				}
			});
		}

		function actualInit(id) {
			console.log("---Application Actual Init");
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
			console.log("SAVEE CLICK");
			$.ajax({
				url: "http://jsonip.appspot.com/", 
				success: function(data, status, jqXHR){
					console.log("GOT IP");
					ip = data.ip;
					retrieveId();
					actualInit(id);
				},
				error : function(){
					ip = "Get Ip failed";
					console.log("Get IP Failure");
					retrieveId();
					actualInit(id);
					//TODO: Handle error
				},

				async : false
			})
		});

		$("#saviour").click(function() {
			if(id != null) {
				actualInit(id);
			} else {
				retrieveId();
				actualInit(id);
			}
		});

	}
}