$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'session'

$config = Session.new

$config.ignore_properties 'contentStretch', 'simulatedStatusBarMetrics', 'simulatedOrientationMetrics'
$config.ignore_classes 'IBProxyObject'

# To get another creation call than standard
# Ti.UI.create#{name}
# give a array as value: 'IBUIWindow' => ['Window', 'myWindowCall']
$config.classes 'IBUIWindow' => 'Window',
        'IBUIView' => 'View',
        'IBUILabel' => 'Label',  
        'IBUIButton' => 'Button',
        'IBUITextField' => 'TextField',
        'IBUIImageView' => 'ImageView',
        'IBUIScrollView' => 'ScrollView',
        'IBUITableView' => 'TableView',
        'IBUITextView' => 'TextView',
        'IBUIWebView' => 'WebView'    

# Available types: 
# val(:output)
# bool(:output) # Where '0' gives {:output => false} and '1' gives {:output => true}
# lookup(:output, {'yes' => true, 'no' => false})
# color(:output)
# font(:output)
# vextor(:x, :y) # Where '{1, 2}' => {:x => 1, :y => 2}
# properties 'backgroundColor' => color(:backgroundColor),
$config.properties 'font' => $config.font(:font),
           'frameOrigin' => $config.vector(:top, :bottom),
           'frameSize' => $config.vector(:height, :width),
           'text' => $config.val(:text)
           #'textColor' => color(:color)
