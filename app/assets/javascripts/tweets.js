$(document).ready(function() {
	attachEventListeners();
});


function attachEventListeners() {
  $('.keyword').on('click', function(e) {
    console.log("You click'n shit.");
    e.preventDefault();
    // console.log(this)
    // console.log($(this))
    var keyword = $(this).attr('id');
    console.log(keyword)
    $.ajax({
      url: '/tweets',
      method: 'POST',
      data: { keyword: keyword},
    }).done(function(res){
      console.log(res);
      // $(e.target).replaceWith(res);
    })
  });
}

// function keywordClick() {
//   console.log("You click'n shit.");
//   e.preventDefault();
//   let keyword = $(this).data("id");
//   $.ajax({
//     url: '/tweets/index',
//     method: 'GET',
//     data: { keyword: keyword }
//   }).done(function(res){
//     console.log(res);
//     // $(e.target).replaceWith(res);
//   })
// }

// click on a keyword
// fetch tweets for keyword
// clear tweet feed.
// for each tweet,
//   move previous tweet up
//   add new tweet to bottom
// end
// fetch more tweets!


// function searchWoSo() {

// 	});
// }

// function searchWoSo() {

// 	});
// }

// function searchWoSo() {

// 	});
// }
