# TagListView
Simple Tag List View Container in Swift

# Usage:
* let listView = TagListView(frame: CGRectMake(0,0,100,200))
* 
* listView.addTag("YOLO", target: self, tapAction: "tap:", longPressAction: "longPress:",backgroundColor: UIColor.whiteColor(),textColor: UIColor.blackColor()) //add a tag and its corresponding action
* 
* listView.reset() //Clears the screen


# Known Issues:
This view container will be very laggy when there are more than 100 tags on screen. It is due to the expense of drawing UILabel. I don't see an use case where an iOS app would need to display 100 UILabels at same time so it shouldn't be a big deal.


#Screenshots

[![](https://dl.dropboxusercontent.com/s/u4zhtf3lj31p7ti/Photo%20Oct%2028%2C%206%2037%2033%20PM.png
)](https://dl.dropboxusercontent.com/s/u4zhtf3lj31p7ti/Photo%20Oct%2028%2C%206%2037%2033%20PM.png
)

[![](https://dl.dropboxusercontent.com/s/dgrudpysyd70ta9/Simulator%20Screen%20Shot%20Oct%2028%2C%202015%2C%206.42.43%20PM.png)](https://dl.dropboxusercontent.com/s/dgrudpysyd70ta9/Simulator%20Screen%20Shot%20Oct%2028%2C%202015%2C%206.42.43%20PM.png)
