// Interactiveness now

(function() {

	var clock = document.querySelector('digiclockID');
	// var clock = $('#digiclock');

	// But there is a little problem
	// we need to pad 0-9 with an extra
	// 0 on the left for hours, seconds, minutes

	var pad = function(x) {
		return x < 10 ? '0'+x : x;
	};

	var ticktock = function() {
		var d = new Date();

		var h = pad( d.getHours() );
		var m = pad( d.getMinutes() );
		var s = pad( d.getSeconds() );

		var current_time = [h,m,s].join(':');

		clock.innerHTML = current_time;

	};

	ticktock();

	// Calling ticktock() every 1 second
	setInterval(ticktock, 1000);

}());

/* ---------- Notifications ---------- */
	$('.noty').click(function(e){
		e.preventDefault();
		var options = $.parseJSON($(this).attr('data-noty-options'));
		noty(options);
	});

	function trigger_parse(){
		$.ajax({
			url: '/access/parse',
			type: 'get',
			data: {},
			success: function (data) {
				console.log(data);
				alert('success callback');
				$('#import_status').html('import running');
			},
			error: function(data){
				console.log('error');
				console.log(data);
			}
		});
	}


