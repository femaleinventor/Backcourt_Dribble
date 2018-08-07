$(document).ready(function(){
  $('#sportSelectForm').submit(function(e){
    e.preventDefault;
    var selectedSport = $( "#sportSelect option:selected" ).text();
    console.log(selectedSport);
  })
});

// function getOption(){
//   var selectForm = $('#sportSelectForm');
//   var options = $('#sportSelect option');
//   console.log(options);
//   options.each(function(option){
//     $(option).click(function(){
      // var option = $(selectedOptions).find(":selected").text();
      // console.log(option);
      // selectForm.submit();
//     })
//   })
//
// }

// When the options form is clicked, take the option
//Save in variable
//Hide Option form
// display form to edit
