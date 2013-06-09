var Application = {

	applicationView: null,
	messageView: null,
	pusherConnection: null,

	init: function(person_id) {
		console.log("--Application Init---");
		var id = window.person_id;
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

		function joinQueue(type) {
			$.ajax({
				url: "/joinqueue",
				type: "POST",
				data: {
					type: type				
				}
			});
		}

		function actualInit(id) {
			console.log("---Application Actual Init--");
			// join the queue
			applicationView = new ApplicationView(id);
			pusherConnection = new PusherConnection(id, applicationView)
		}

		$("#savee").click(function() {
			// create an anonymous person
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
			});
			joinQueue("savee");
		});

		$("#saviour").click(function() {
			joinQueue("saviour");
			if(id != null) {
				actualInit(id);
			} else {
				retrieveId();
				actualInit(id);
			}
		});

	}
}