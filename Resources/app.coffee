log = (obj) -> Ti.API.log obj

Ti.UI.setBackgroundColor '#000'

win = Ti.UI.createWindow
  title: 'Tweets'
  backgroundColor: '#fff'
  barColor: '#385292'

populateTweetRow = (tweet) ->
  tweet_text = tweet.text
  tweet_user = tweet.from_user
  tweet_avatar = tweet.profile_image_url

  row = Ti.UI.createTableViewRow()
  row.selectedBackgroundColor = '#fff'
  row.height = 'auto'
  row.className = 'datarow'
  row.clickName = 'row'

  avatar = Ti.UI.createImageView
    image: tweet_avatar
    top: 5
    left: 10
    width: 48
    height: 48
  row.add avatar

  user = Ti.UI.createLabel
    color: '#576996'
    font:
      fontSize: 16
      fontWeight: 'bold'
      fontFamily: 'Arial'
    left: 70
    top: 0
    height: 'auto'
    width: 220
    text: tweet_user
  row.add user

  tweet = Ti.UI.createLabel
    color: '#222'
    font:
      fontSize: 14
      fontWeight: 'normal'
      fontFamily: 'Arial'
    left: 70
    top: 21
    bottom: 5
    height: 'auto'
    width: 220
    text: tweet_text
  row.add tweet
  row

loadTweets = ->
  url = 'http://search.twitter.com/search.json?q=%23titaniumjp'
  loader = Ti.Network.createHTTPClient()
  loader.open "GET", url
  loader.onload = ->
    response = eval '(' + this.responseText + ')'
    tableView = Ti.UI.createTableView
      data: response.results.map(populateTweetRow)
      filterAttribute: 'filter'
      backgroundColor: 'white'
    win.add tableView
  loader.send()

loadTweets()

tabGroup = Ti.UI.createTabGroup()
tab1 = Ti.UI.createTab
  icon:'KS_nav_views.png',
  title:'#titaniumjp',
  window:win
tabGroup.addTab tab1
tabGroup.open()
