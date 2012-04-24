loadTweets = (tweets) ->
  text = ""; date = ""; results = []

  for tweet in tweets
    text = tweet.text
    date = tweet.created_at
    date = date.substring(0, date.indexOf(':')-3)
    results.push("<li class='tweet'><span class='tw-text'>#{text}</span><span class=tw-date>#{date}</span></li>")
  
  $(".tweets").html(results.join(''))

$.ajax({
     url: "https://api.twitter.com/1/statuses/user_timeline.json?&include_rts=true&screen_name=aberls&count=4"
     dataType: 'JSONP'
     success: (json) ->
        loadTweets(json)
     error: ->
        # handle error
})
