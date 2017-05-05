var $kidsbookinput = $('input[name=kid_book]')
	console.log($kidsbookinput);
	// console.log(kidbooks);
var $kidbooksubmit = $('.create-update-form input[type=submit]')
	$kidbooksubmit.on('click', function(event){
		event.preventDefault();
		var newbook = $kidsbookinput.val();
		console.log(newbook);
	})
	console.log("here")
	$.get("/api/kids")
		.then(function(res) {
			console.log("hehehehe")
			console.log(res);
		})