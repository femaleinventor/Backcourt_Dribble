  $(document).on("ready", function(){

    // Hides FIFA Team list on load
    $('.fifa-league-link').hide();

    // When FIFA link is clicked: Hide home league list and show FIFA team list
    $('#fifa').on("click", function(){
      $('.league-link').hide();
      $('.league_menu').height(2340);
      $('.fifa-league-link').show();
    });
  });


// on click extend height of fifa menu class list to 3040px;
// when returning to leagues shrink it to ~700px
