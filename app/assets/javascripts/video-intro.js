$(document).on('turbolinks:load', function() {
	console.log('video-intro')
	const btnd = document.querySelector('#try-click');
	if (btnd != null) {
		btnd.click()
	}
	
})