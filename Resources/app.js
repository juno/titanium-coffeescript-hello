(function() {
  var loadTweets, log, populateTweetRow, tab1, tabGroup, win;
  log = function(obj) {
    return Ti.API.log(obj);
  };
  loadTweets = function(window) {
    var loader;
    loader = Ti.Network.createHTTPClient();
    loader.open('GET', 'http://search.twitter.com/search.json?q=%23titaniumjp');
    loader.onload = function() {
      var response, tableView;
      response = eval('(' + this.responseText + ')');
      tableView = Ti.UI.createTableView({
        backgroundColor: 'white',
        data: response.results.map(populateTweetRow)
      });
      return window.add(tableView);
    };
    return loader.send();
  };
  populateTweetRow = function(tweet) {
    var row;
    row = Ti.UI.createTableViewRow({
      selectedBackgroundColor: '#fff',
      height: 'auto'
    });
    row.add(Ti.UI.createImageView({
      image: tweet.profile_image_url,
      top: 5,
      left: 10,
      width: 48,
      height: 48
    }));
    row.add(Ti.UI.createLabel({
      color: '#576996',
      font: {
        fontSize: 16,
        fontWeight: 'bold',
        fontFamily: 'Arial'
      },
      left: 70,
      top: 0,
      height: 'auto',
      width: 220,
      text: tweet.from_user
    }));
    row.add(Ti.UI.createLabel({
      color: '#222',
      font: {
        fontSize: 14,
        fontWeight: 'normal',
        fontFamily: 'Arial'
      },
      left: 70,
      top: 21,
      bottom: 5,
      height: 'auto',
      width: 220,
      text: tweet.text
    }));
    return row;
  };
  Ti.UI.setBackgroundColor('#000');
  win = Ti.UI.createWindow({
    title: 'Tweets',
    backgroundColor: '#fff'
  });
  tabGroup = Ti.UI.createTabGroup();
  tab1 = Ti.UI.createTab({
    icon: 'KS_nav_views.png',
    title: '#titaniumjp',
    window: win
  });
  tabGroup.addTab(tab1);
  tabGroup.open();
  loadTweets(win);
}).call(this);
