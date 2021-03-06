$(document).ready(function() {
	attachEventListeners();
});

function attachEventListeners() {
  clickKeyword()
}

var twtQueue = {
	active: null,
	running: false
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
			twtQueue.active = currentKeyword
			twtQueue[twtQueue.active] = res
			if (twtQueue.running == false) {
				twtQueue.running = true
				addTweetsToDOM(res)
			}
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
    // $(`#${thisTweetID}`).fadeIn(5000, function(){
		$("#" + thisTweetID).fadeIn(4200, function(){
			tweetsJSON = twtQueue[twtQueue.active]
      // Call fade in for next element
      addTweetsToDOM(tweetsJSON)
    })
  } else {
		twtQueue.running = false
	}
}

// function buildHtmlFor(tweet) {
// 	return `<div class="keyword-tweet new-tweet" id="${tweet.id}" style="display: none;">
// 		<div class="tweet-wrapper">
// 			<div class="timestamp">
//         <a href="https://twitter.com/dreamersurgeon1/status/${tweet.id_str}">${tweet.created_at}</a>
//       </div>
// 			<div class="tweet-text">${tweet.full_text}</div>
// 			<div class="by-line"> <a href="https://www.twitter.com/${tweet.user.screen_name}">${tweet.user.screen_name}</a> in ${tweet.user.location} </div>
// 		</div>
// 	</div>`
// }

function buildHtmlFor(tweet) {
	return "<div class ='keyword-tweet new-tweet' id='" + tweet.id + "' style='display: none;'><div class='tweet-wrapper'><div class='timestamp'><a href='https://twitter.com/dreamersurgeon1/status/" + tweet.id_str + "'>" + tweet.created_at + " </a> </div><div class='tweet-text'>"+tweet.full_text+"</div><div class='by-line'><a heref='https://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.user.screen_name + "</a> in " + tweet.user.location + "</div></div></div>"
}
