//
//  ListView.swift
//
//
//  Created by Oskar Zhang on 7/13/15.
//  Copyright (c) 2015 Oskar Zhang. All rights reserved.
//

import Foundation
import UIKit
class TagListView:UIScrollView
{
    var numberOfRows = 0
    var currentRow = 0
    var tags = [UILabel]()

    var hashtagsOffset:UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
    var rowHeight:CGFloat = 40 //height of rows
    var tagHorizontalPadding:CGFloat = 5.0 // padding between tags horizontally
    var tagVerticalPadding:CGFloat = 5.0 // padding between tags vertically
    var tagCombinedMargin:CGFloat = 10.0 // margin of left and right combined, text in tags are by default centered.
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        numberOfRows = Int(frame.height / rowHeight)
        self.showsVerticalScrollIndicator = false
        self.scrollEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addTag(text:String,target:AnyObject,tapAction:Selector,longPressAction:Selector,backgroundColor:UIColor,textColor:UIColor)
    {
        //instantiate label
        //you can customize your label here! but make sure everything fit. Default row height is 30.
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = backgroundColor
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFontOfSize(18)
        label.sizeToFit()
        label.textAlignment = NSTextAlignment.Center
        self.tags.append(label)
        label.layer.shouldRasterize = true
        label.layer.rasterizationScale = UIScreen.mainScreen().scale
        //process actions
        if tapAction != nil
        {
            let tap = UITapGestureRecognizer(target: target, action: tapAction)
            label.userInteractionEnabled = true
            label.addGestureRecognizer(tap)
        }
        
        if longPressAction != nil
        {
            let longPress = UILongPressGestureRecognizer(target: target, action: longPressAction)
            label.addGestureRecognizer(longPress)
        }
        
        //calculate frame
        label.frame = CGRectMake(label.frame.origin.x,label.frame.origin.y , label.frame.width + tagCombinedMargin, rowHeight - tagVerticalPadding)
        if self.tags.count == 0
        {
            label.frame = CGRectMake(hashtagsOffset.left, hashtagsOffset.top, label.frame.width, label.frame.height)
            self.addSubview(label)
            
        }
        else
        {
            label.frame = self.generateFrameAtIndex(tags.count-1, rowNumber: &currentRow)
            self.addSubview(label)
        }
    }
    
    
    
    private func isOutofBounds(newPoint:CGPoint,labelFrame:CGRect)
    {
        let bottomYLimit = newPoint.y + labelFrame.height
        if bottomYLimit > self.contentSize.height
        {
            self.contentSize = CGSizeMake(self.contentSize.width, self.contentSize.height + rowHeight - tagVerticalPadding)
        }
    }
    
    func getNextPosition() -> CGPoint
    {
        return getPositionForIndex(tags.count-1, rowNumber: self.currentRow)
    }
    
    func getPositionForIndex(index:Int,rowNumber:Int) -> CGPoint
    {
        if index == 0
        {
            return CGPointMake(hashtagsOffset.left, hashtagsOffset.top)
        }
        let y = CGFloat(rowNumber) * self.rowHeight + hashtagsOffset.top
        let lastTagFrame = tags[index-1].frame
        let x = lastTagFrame.origin.x + lastTagFrame.width + tagHorizontalPadding
        return CGPointMake(x, y)
    }
    
    func reset()
    {
        for tag in tags
        {
            tag.removeFromSuperview()
        }
        tags = []
        currentRow = 0
        numberOfRows = 0
    }
    
    func removeTagWithName(name:String)
    {
        for (index,tag) in tags.enumerate()
        {
            if tag.text! == name
            {
                removeTagWithIndex(index)
            }
        }
    }
    
    func removeTagWithIndex(index:Int)
    {
        if index > tags.count - 1
        {
            print("ERROR: Tag Index \(index) Out of Bounds")
            return
        }
        tags[index].removeFromSuperview()
        tags.removeAtIndex(index)
        layoutTagsFromIndex(index)
    }
    
    private func getRowNumber(index:Int) -> Int
    {
        return Int((tags[index].frame.origin.y - hashtagsOffset.top)/rowHeight)
    }
    
    private func layoutTagsFromIndex(index:Int,animated:Bool = true)
    {
        if tags.count == 0
        {
            return
        }
        let animation:()->() =
        {
            var rowNumber = self.getRowNumber(index)
            for i in index...self.tags.count - 1
            {
                self.tags[i].frame = self.generateFrameAtIndex(i, rowNumber: &rowNumber)
            }
        }
        UIView.animateWithDuration(0.3, animations: animation)
    }
    
    private func generateFrameAtIndex(index:Int,inout rowNumber: Int) -> CGRect
    {
        var newPoint = self.getPositionForIndex(index, rowNumber: rowNumber)
        if (newPoint.x + self.tags[index].frame.width) >= self.frame.width
        {
            rowNumber++
            newPoint = CGPointMake(self.hashtagsOffset.left, CGFloat(rowNumber) * rowHeight + self.hashtagsOffset.top)
        }
        self.isOutofBounds(newPoint,labelFrame: self.tags[index].frame)
        return CGRectMake(newPoint.x, newPoint.y, self.tags[index].frame.width, self.tags[index].frame.height)
    }
    
    func removeMultipleTagsWithIndices(indexSet:Set<Int>)
    {
        let sortedArray = Array(indexSet).sort()
        for index in sortedArray
        {
            if index > tags.count - 1
            {
                print("ERROR: Tag Index \(index) Out of Bounds")
                continue
            }
            tags[index].removeFromSuperview()
            tags.removeAtIndex(index)
        }
        layoutTagsFromIndex(sortedArray.first!)
    }
    
}

