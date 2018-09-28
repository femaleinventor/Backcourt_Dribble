$(document).ready(function() {
	// attachEventListeners();
	populateLibrary();
});

// function attachEventListeners() {
//   clickKeyword()
// }
//
// function clickKeyword() {
//   $('.keyword').on('click', function(e){
//     e.preventDefault()
//     var currentKeyword = $(this).attr('id')
//     console.log(currentKeyword)
//
//     $.ajax({
//       url: '/tweets',
//       method: 'POST',
//       data:{keyword: currentKeyword},
//     }).done(function(res) {
//       addTweetsToDOM(res)
//       console.log(res);
//     })
//   })
// }
//
// function addTweetsToDOM(tweetsJSON) {
//   // for (var i = 0; i < tweetsJSON.length; i++) {
//     // Create HTML for Tweet.
//   console.log(tweetsJSON)
//   if(tweetsJSON.length > 0){
//     var thisTweetJSON = tweetsJSON.shift()
//     var tweetHTML = buildHtmlFor(thisTweetJSON)
//     var thisTweetID = thisTweetJSON.id
//     // console.log(thisTweetID)
//     // Add HTML to DOM invisibly
//     $(".tweets-wall").prepend(tweetHTML)
//     // Pause for One Second
//     // $(`#${thisTweetID}`).fadeIn(5000, function(){
// 		$("#" + thisTweetID).fadeIn(4200, function(){
//
//       // Call fade in for next element
//       addTweetsToDOM(tweetsJSON)
//     })
//   }
// }

function addTweetToDom(keyword) {
	var thisTweetJSON = library[keyword].shift()
	var tweetHTML = buildHtmlFor(thisTweetJSON)
	var thisTweetID = thisTweetJSON.id
	$(".tweets-wall").prepend(tweetHTML)
}

// function buildHtmlFor(tweet) {
// 	return "<div class ='keyword-tweet new-tweet' id='" + tweet.id + "' style='display: none;'><div class='tweet-wrapper'><div class='timestamp'><a href='https://twitter.com/dreamersurgeon1/status/" + tweet.id_str + "'>" + tweet.created_at + " </a> </div><div class='tweet-text'>"+tweet.full_text+"</div><div class='by-line'><a heref='https://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.user.screen_name + "</a> in " + tweet.user.location + "</div></div></div>"
// }

// Collect keywords from page
// For each keyword, query Twitter API and save tweets in a collection
var library = {}
var activeKeyword = "WOSO"

function populateLibrary() {
	$(".keyword").each(function(index){
		keyword = ($(this).attr('id'))
		fetchTweets(keyword)
	})
}

function fetchTweets(keyword) {
	$.ajax({
		url: '/tweets',
		method: 'POST',
		data:{keyword: keyword},
	}).done(function(res) {
		library[keyword] = res
		setInterval(doStuff, 2000);
	})
}

function doStuff() {
	if (activeKeyword){
		addTweetToDom(activeKeyword)
	}
}
// setInterval(doStuff, 2000);
// Every x seconds, check active Keyword,


// if there is a keyword then pull tweet from that kewyords collection and add to page
// edgecase, sometimes there are no recents tweets for a keyword, looks like no one is tweeting about this keyword recently...
// check the length of the current keyword's collection
// if current keyword's length is 5 or less, pull new tweets for that keyword collection

// fetch tweets
//
