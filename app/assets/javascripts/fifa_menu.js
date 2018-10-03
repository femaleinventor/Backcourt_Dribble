  $(document).ready(function(){

    if ($('.league-link').length > 1) {
      // Hides FIFA Team list on load
      $('.fifa_team_link').hide();

      // When FIFA link is clicked: Hide home league list and show FIFA team list
      $('#fifa').on("click", function(){
        $('.league-link').hide();
        $('.league_menu').height(500);
        $('.fifa_team_link').show();
      });

    } else {
      $('.fifa-league-link').show();
      $('.league_menu').height(500);
    }
  });
