**STATUS: DEPRECATED**
# TagListView
When I tried to find something on github that displays words in their own cells, I couldn't find anything. This is why I made a view container for displaying tags. It serves a simple purpose so I elected not to let users implement delegate functions, insetad they can just call the built-in functions of the view container to add tags and reset the view. 

# Usage:
* Initialize the container with a frame for the container. Note that this is not the frame for an individual tag. 
``` 
let listView = TagListView(frame: CGRectMake(0,0,100,200))
```

* Apperance 
``` 
listView.hashtagsOffset:UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
listView.rowHeight:CGFloat = 40 //height of rows
listView.tagHorizontalPadding:CGFloat = 5.0 // padding between tags horizontally
listView.tagVerticalPadding:CGFloat = 5.0 // padding between tags vertically
listView.tagCombinedMargin:CGFloat = 10.0 // margin of left and right combined, text in tags are by default centered.
```



* Add Tags and their corresponding selector
```
listView.addTag("YOLO", target: self, tapAction: "tap:", longPressAction: "longPress:",backgroundColor: UIColor.whiteColor(),textColor: UIColor.blackColor()) 
``` 
* Remove Tags
``` 
listView.removeTagWithIndex() //Remove tag at a given index
listView.removeTagWithName() //Remove tag with a name
listView.removeMultipleTagsWithIndices(indexSet:Set<Int>) //Bulk Remove with a set of Indices.
```

* Reset View
``` 
listView.reset() //Clears the screen
```



# Customization:
To customize the appearance of the label, you can just dive into the addTag() func to change however you want your UILabel to look like. 

# Known Issue:
This View Container still scrolls poorly when there are large volume of labels on screen, due to the fact that I did not implement some sort of a caching mechanism for the UIScrollView. 


#In Action:

[![](https://dl.dropboxusercontent.com/s/u4zhtf3lj31p7ti/Photo%20Oct%2028%2C%206%2037%2033%20PM.png
)](https://dl.dropboxusercontent.com/s/u4zhtf3lj31p7ti/Photo%20Oct%2028%2C%206%2037%2033%20PM.png
)

[![](https://dl.dropboxusercontent.com/s/dgrudpysyd70ta9/Simulator%20Screen%20Shot%20Oct%2028%2C%202015%2C%206.42.43%20PM.png)](https://dl.dropboxusercontent.com/s/dgrudpysyd70ta9/Simulator%20Screen%20Shot%20Oct%2028%2C%202015%2C%206.42.43%20PM.png)

# License:
MIT
