# TagListView
When I tried to find something on github that displays words in their own cells, I couldn't find anything. This is why I made a view container for displaying tags. It serves a simple purpose so I elected not to let users implement delegate functions, insetad they can just call the built-in functions of the view container to add tags and reset the view. 

# Usage:
* Initialize the container with a frame for the container. Note that this is not the frame for an individual tag. 
``` 
let listView = TagListView(frame: CGRectMake(0,0,100,200))
```
* Add Tags and their corresponding selector
```
listView.addTag("YOLO", target: self, tapAction: "tap:", longPressAction: "longPress:",backgroundColor: UIColor.whiteColor(),textColor: UIColor.blackColor()) 
``` 
* Reset View
``` 
listView.reset() //Clears the screen
```

# Customization:
To customize the appearance of the label, you can just dive into the addTag() func to change however you want your UILabel to look like. 

# Known Issues:
This view container will be very laggy when there are more than 100 tags on screen. It is due to the expense of drawing UILabel. I don't see an use case where an iOS app would need to display 100 UILabels at same time so it shouldn't be a big deal.


#In Action:

[![](https://dl.dropboxusercontent.com/s/u4zhtf3lj31p7ti/Photo%20Oct%2028%2C%206%2037%2033%20PM.png
)](https://dl.dropboxusercontent.com/s/u4zhtf3lj31p7ti/Photo%20Oct%2028%2C%206%2037%2033%20PM.png
)

[![](https://dl.dropboxusercontent.com/s/dgrudpysyd70ta9/Simulator%20Screen%20Shot%20Oct%2028%2C%202015%2C%206.42.43%20PM.png)](https://dl.dropboxusercontent.com/s/dgrudpysyd70ta9/Simulator%20Screen%20Shot%20Oct%2028%2C%202015%2C%206.42.43%20PM.png)
