$(document).ready(function(){
  $('[data-countdown]').each(function() {
    var $this = $(this), finalDate = $(this).data('countdown');
    $this.countdown(finalDate, function(event) {
      $this.html(event.strftime('%D days %H:%M:%S'));
    });
  });

});
