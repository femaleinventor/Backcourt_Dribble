// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//
// require jquery - was here before fullpage
//= require jquery3
//= require jquery_ujs
//= require fullpage.parallax.min
//= require jquery.fullpage.extensions.min
//= require jquery.slick
//= require bootstrap
//= require_tree .

$(document).ready(function() {
	$('#fullpage').fullpage({
		// parallaxKey: 'YmFja2NvdXJ0ZHJpYmJsZS5jb21fanh6Y0dGeVlXeHNZWGc9ZDYx',
		// parallax: true,
		// parallaxOptions: {type: 'reveal', percentage: 62, property: 'translate'},
		sectionsColor: ['black', '#707070', 'black', '#707070','black', '#707070', 'black', '#707070','black', '#707070', 'black', '#707070','black', '#707070', 'black', '#707070','black', '#707070', 'black', '#707070', 'black', '#707070','black', '#707070', 'black', '#707070','black', '#707070','black', '#707070', 'black', '#707070']
	});
});
