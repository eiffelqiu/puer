var view1 = Ti.UI.createView({
	bottom:0,
	height:487,
	top:0,
	width:576
});

var label1 = Ti.UI.createLabel({
	bottom:298,
	height:42,
	text:'Label',
	top:205,
	width:21
});

view1.add(label1);

var button1 = Ti.UI.createButton({
	bottom:164,
	height:73,
	top:181,
	width:44
});

view1.add(button1);

var textfield1 = Ti.UI.createTextField({
	bottom:354,
	height:97,
	text:'',
	top:150,
	width:30
});

view1.add(textfield1);

var tableview1 = Ti.UI.createTableView({
	bottom:189,
	height:244,
	top:111,
	width:288
});

view1.add(tableview1);

var imageview1 = Ti.UI.createImageView({
	bottom:361,
	height:240,
	top:159,
	width:128
});

view1.add(imageview1);

var textview1 = Ti.UI.createTextView({
	bottom:245,
	height:240,
	text:'Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.',
	top:46,
	width:128
});

view1.add(textview1);

var webview1 = Ti.UI.createWebView({
	bottom:33,
	height:240,
	top:106,
	width:128
});

view1.add(webview1);