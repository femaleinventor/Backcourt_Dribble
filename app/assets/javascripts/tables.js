// Sorts 4th column of table
$(document).ready(function() {
    $('.soccer-tables').DataTable( {
        "order": [[ 3, "desc" ]],
        "paging": false,
        "columnDefs": [
          { className: "all", "targets": [ 0, 1, 2, 3 ] }
        ],
        "columns": [
          { "data": "rank", defaultContent: ''},
          { "data": "username" },
          { "data": "predictions" },
          { "data": "correct" }
        ],
        drawCallback: function () {
          api = this.api();
          var arr = api.columns(3).data()[0];  //get array of column 3 (extn)
          // console.log(arr);
          var sorted = arr.slice().sort(function(a,b){return b-a});
          var ranks = arr.slice().map(function(v){ return sorted.indexOf(v)+1 });
          // console.log(sorted);
          // console.log(ranks);
          // interate through each row
          api.rows().every( function ( rowIdx, tableLoop, rowLoop ) {
            var data = this.data();
            // console.log(data.username, data.correct, ranks[arr.indexOf(data.correct)]);
            // console.log(data.rank)
            data.rank = ranks[arr.indexOf(data.correct)].toString();  //set the rank column = the array index of the extn in the ranked array
            this.data(data);
          } );
        api.rows().invalidate();
      }
  });
});
