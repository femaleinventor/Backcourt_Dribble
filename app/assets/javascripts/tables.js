// Sorts 4th column of table
$(document).ready(function() {
    $('#soccer-table').DataTable( {
        "order": [[ 3, "desc" ]],
        "paging": false
    } );
} );
