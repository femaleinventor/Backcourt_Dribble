$(document).ready(function() {
  var checkboxes = $( "form [type=checkbox]"),
      checkboxArray = Array.from( checkboxes );


  checkboxArray.forEach(function(checkbox) {
      checkbox.addEventListener('change', function(){
        $('#loginModal').modal('show');
      });
    });
});

// Get all checkboxes
// If any of the checkboxes are checked:
  // Render a popup
