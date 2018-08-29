$(document).ready(function() {
	attachEventListeners();
});


// function attachEventListeners() {
//   $('.keyword').on('click', function(e) {
//     console.log("You click'n shit.");
//     e.preventDefault();
//     var keyword = $(this).attr('id');
//     // console.log(this)
//     console.log($(this))
//     // console.log($(this).attr('id'));
//     console.log(keyword)
    // $.ajax({
    //   url: '/tweets',
    //   method: 'POST',
    //   data: { keyword: keyword},
    // }).done(function(res){
		// 	console.log(res);
//
// 			// for(i = 0 ; i < res.length; i++) {
// 			// 	console.log(res[i])
// 			// 	$(".tweets-wall").prepend(buildHtmlFor(res[i]))
// 			// 	$(".new-tweet").fadeOut({duration: "slow"})
// 			// 	$(".new-tweet").removeClass(".new-tweet")
// 			// }
//       // res.forEach(
// 			// function(tweet) {
// 			// 	console.log(tweet)
// 			// 	$(".tweets-wall").prepend(buildHtmlFor(tweet))
// 			// 	$(".new-tweet").fadeOut({duration: "slow"})
// 			// 	$(".new-tweet").removeClass(".new-tweet")
// 			// })
//     })
//   });
// }

function attachEventListeners() {
  clickKeyword()
}

function clickKeyword() {
  $('.keyword').on('click', function(e){
    e.preventDefault()
    var currentKeyword = $(this).attr('id')
    console.log(currentKeyword)

    $.ajax({
      url: '/tweets',
      method: 'POST',
      data:{keyword: currentKeyword},
    }).done(function(res) {
      addTweetsToDOM(res)
      console.log(res);
    })
  })
}

function addTweetsToDOM(tweetsJSON) {
  // for (var i = 0; i < tweetsJSON.length; i++) {
    // Create HTML for Tweet.
  console.log(tweetsJSON)
  if(tweetsJSON.length > 0){
    var thisTweetJSON = tweetsJSON.shift()
    var tweetHTML = buildHtmlFor(thisTweetJSON)
    var thisTweetID = thisTweetJSON.id
    // console.log(thisTweetID)
    // Add HTML to DOM invisibly
    $(".tweets-wall").prepend(tweetHTML)
    // Pause for One Second
    $(`#${thisTweetID}`).fadeIn(5000, function(){
      // Call fade in for next element
      addTweetsToDOM(tweetsJSON)
    })
  }
}

function buildHtmlFor(tweet) {
	return `<div class="keyword-tweet new-tweet" id="${tweet.id}" style="display: none;">
		<div class="tweet-wrapper">
			<div class="timestamp">
        <a href="https://twitter.com/dreamersurgeon1/status/${tweet.id_str}">${tweet.created_at}</a>
      </div>
			<div class="tweet-text">${tweet.full_text}</div>
			<div class="by-line"> <a href="https://www.twitter.com/${tweet.user.screen_name}">${tweet.user.screen_name}</a> in ${tweet.user.location} </div>
		</div>
	</div>`
}


// $(document).ready(function() {
// 	attachEventListeners();
// });
//
//
// function attachEventListeners() {
//   $('.keyword').on('click', function(e) {
//     // console.log("You click'n shit.");
//     e.preventDefault();
//     // console.log(this)
//     // console.log($(this))
//     var keyword = $(this).attr('id');
//     // console.log($(this).attr('id'))
//     console.log(keyword)
//
//     $.ajax({
//       url: '/tweets',
//       method: 'POST',
//       data: { keyword: keyword},
//     }).done(function(res){
// 			// console.log(res);
//
// 			for(i = 0 ; i < res.length; i += 1) {
// 				console.log(res[i])
// 				$(".tweets-wall").prepend(buildHtmlFor(res[i]));
// 				$(".tweet-wrapper").hide();
// 				$(".tweet-wrapper").show(3000);
// 			}
//     })
//   });
// }
//
// function buildHtmlFor(tweet) {
// 	return `<div class="keyword-tweet new-tweet">
// 		<div class="tweet-wrapper">
// 			<div class="timestamp">${tweet.created_at}</div>
// 			<div class="tweet-text">${tweet.full_text}</div>
// 			<div class="by-line">  </div>
// 		</div>
// 	</div>`
// }
//
//


// $(document).ready(function() {
// 	attachEventListeners();
// });


// function attachEventListeners() {
//   searchWoSo();
//   searchUSWNT();
//   searchNWSL();
// }

// function searchWoSo() {
//     // on click make a call to twitter and return a hash
//     // parse the hash
//     // return parsed hash to dom
// 	});
// }

// function searchWoSo() {
//     // on click make a call to twitter and return a hash
//     // parse the hash
//     // return parsed hash to dom
// 	});
// }

// function searchWoSo() {
//     // on click make a call to twitter and return a hash
//     // parse the hash
//     // return parsed hash to dom
// 	});
// }


// make method to parse the hash
// Parse the hash to
// screen_name
// location
// text




// Parsing best-practices
// Twitter JSON is encoded using UTF-8 characters.
// Parsers should tolerate variance in the ordering of fields with ease. It should be assumed that Tweet JSON is served as an unordered hash of data.
// Parsers should tolerate the addition of 'new' fields. The Twitter platform has continually evolved since 2006, so there is a long history of new metadata being added to Tweets.
// JSON parsers must be tolerant of ‘missing’ fields, since not all fields appear in all contexts.
// It is generally safe to consider a nulled field, an empty set, and the absence of a field as the same thing
