var $kidsbookinput = $('input[name=kid_book]')
	console.log($kidsbookinput);
var $kidbooksubmit = $('.create-update-form input[type=submit]')
	$kidbooksubmit.on('click', function(event){
		event.preventDefault();
		var newbook = $kidsbookinput.val();
		console.log(newbook);
	})