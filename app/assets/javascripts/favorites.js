$(document).ready(function(){

  var sportCards = $('.sport-card');
  var sportCardsArray = sportCards.toArray();

  toggleSelected(sportCardsArray);

})

//Adds selected class to card when clicked
function toggleSelected(array) {
    array.forEach(function(elem){
      $(elem).click(function(){
        $(elem).toggleClass('selected');
      })
    })
  }
