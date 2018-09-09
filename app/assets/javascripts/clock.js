$(document).ready(function(){
  $('[data-countdown]').each(function() {
    var $this = $(this), finalDate = $(this).data('countdown');
    console.log(finalDate)
    $this.countdown(finalDate, function(event) {
      $this.html(event.strftime('%D days, %H hours %M minutes %S seconds'));
    });
  });

});
