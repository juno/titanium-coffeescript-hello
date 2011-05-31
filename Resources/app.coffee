# Utility
log = (obj) -> Ti.API.log obj

# Load a search result JSON and create a table view
loadTweets = (tableView) ->
  loader = Ti.Network.createHTTPClient()
  loader.open 'GET', 'http://search.twitter.com/search.json?q=%23titaniumjp'
  loader.onload = ->
    response = eval '(' + @.responseText + ')'
    tableView.setData response.results.map populateTweetRow
  loader.send()

# Populate a tweet object as a row of table view
populateTweetRow = (tweet) ->
  row = Ti.UI.createTableViewRow
    selectedBackgroundColor: '#fff'
    height: 'auto'

  # avatar
  row.add Ti.UI.createImageView
    image: tweet.profile_image_url
    top: 5
    left: 10
    width: 48
    height: 48

  # username
  row.add Ti.UI.createLabel
    color: '#576996'
    font:
      fontSize: 16
      fontWeight: 'bold'
      fontFamily: 'Arial'
    left: 70
    top: 0
    height: 'auto'
    width: 220
    text: tweet.from_user

  # tweet
  row.add Ti.UI.createLabel
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
    text: tweet.text

  row

# Main
Ti.UI.setBackgroundColor '#000'

win = Ti.UI.createWindow
  title: 'Tweets'
  backgroundColor: '#fff'

tableView = Ti.UI.createTableView
  backgroundColor: 'white'
win.add tableView

tabGroup = Ti.UI.createTabGroup()
tabGroup.addTab Ti.UI.createTab
  icon: 'KS_nav_views.png'
  title: '#titaniumjp'
  window: win
tabGroup.open()

loadTweets tableView
