# this sets the background color of the master UIView (when there are no windows/tab groups on it)
Titanium.UI.setBackgroundColor '#000'

# create tab group
tabGroup = Titanium.UI.createTabGroup()


#
# create base UI tab and root window
#
win1 = Titanium.UI.createWindow
  title: 'Tab 1'
  backgroundColor: '#fff'

tab1 = Titanium.UI.createTab
  icon:'KS_nav_views.png',
  title:'Tab 1',
  window:win1

label1 = Titanium.UI.createLabel
  color: '#999'
  text: 'I am Window 1'
  font:
    fontSize: 20
    fontFamily: 'Helvetica Neue'
  textAlign: 'center'
  width: 'auto'

win1.add label1

#
# create controls tab and root window
#
win2 = Titanium.UI.createWindow
  title: 'Tab 2'
  backgroundColor: '#fff'

tab2 = Titanium.UI.createTab
  icon: 'KS_nav_ui.png'
  title: 'Tab 2'
  window: win2

label2 = Titanium.UI.createLabel
  color: '#999'
  text: 'I am Window 2'
  font:
    fontSize: 20
    fontFamily: 'Helvetica Neue'
  textAlign: 'center'
  width: 'auto'

win2.add label2


#
# add tabs
#
tabGroup.addTab tab1
tabGroup.addTab tab2

# open tab group
tabGroup.open()
