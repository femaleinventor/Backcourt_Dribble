// Sorts 4th column of table
$(document).ready(function() {
    $('.soccer-tables').DataTable( {
        "order": [[ 3, "desc" ]],
        "paging": false,
        "columnDefs": [
          { className: "all", "targets": [ 0, 1, 2, 3 ] }
        ]
    } );
} );
