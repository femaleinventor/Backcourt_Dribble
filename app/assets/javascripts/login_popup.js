$(document).ready(function() {
  var checkboxes = $( "form [type=checkbox]"),
      checkboxArray = Array.from( checkboxes ),
      reasonTextArea = $( "#reason");


  if (!gon.current_user){
    reasonTextArea.on('click', function(){
      $('#loginModal').modal('show');
    });

    checkboxArray.forEach(function(checkbox) {
        checkbox.addEventListener('change', function(){
          $('#loginModal').modal('show');
        });
    });

  }

});
