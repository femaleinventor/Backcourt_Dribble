$(document).ready(function() {
	$('#fullpage').fullpage({
		parallaxKey: 'YmFja2NvdXJ0ZHJpYmJsZS5jb21fanh6Y0dGeVlXeHNZWGc9ZDYx',
		parallax: true,
		parallaxOptions: {type: 'reveal', percentage: 62, property: 'translate'},
		// sectionsColor: ['#ccc', '#fff', 'blue', 'red']
		sectionsColor: [returnBlack(), '#707070', 'black', '#707070']
	});
});

function returnBlack(){
	return 'black';
};
