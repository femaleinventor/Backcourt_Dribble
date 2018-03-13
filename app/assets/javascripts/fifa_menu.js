  $(document).on("ready", function(){

    // Hides FIFA Team list on load
    $('.fifa-league-link').hide();

    // When FIFA link is clicked: Hide home league list and show FIFA team list
    $('#fifa').on("click", function(){
      $('.league-link').hide();
      $('.fifa-league-link').show();
    });
  });
