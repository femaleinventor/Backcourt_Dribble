$(document).on("ready", function(){
  $(document).on("turbolinks:load", function(){
    $('#fifa').on("click", function(){
      $('.league-link').hide();
    });
  });
});


// When fifa link is clicked
  // hide all other links
  // show new list of links for fifa Teams
  // back navigation
