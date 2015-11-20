//
//  ListView.swift
//
//
//  Created by Oskar Zhang on 7/13/15.
//  Copyright (c) 2015 Oskar Zhang. All rights reserved.
//

import Foundation
import UIKit
class TagListView:UIScrollView,UIGestureRecognizerDelegate,UIScrollViewDelegate
{
    var numberOfRows = 0
    var currentRow = 0
    var tags = [UILabel]()
    
    var hashtagsOffset:UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
    var containerView:UIView!
    
    
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        numberOfRows = Int(Double(frame.height) / 30)
        containerView = UIView(frame: self.frame)

        self.addSubview(containerView)
        self.showsVerticalScrollIndicator = false
        self.scrollEnabled = true
        self.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    func addTag(text:String,target:AnyObject,tapAction:Selector,longPressAction:Selector,backgroundColor:UIColor,textColor:UIColor)
    {
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = backgroundColor
        label.text = text
        label.textColor = textColor
        label.sizeToFit()
        label.textAlignment = NSTextAlignment.Center
        
        if tapAction != nil
        {
            let tap = UITapGestureRecognizer(target: target, action: tapAction)
            label.userInteractionEnabled = true
            tap.delegate = self
            label.addGestureRecognizer(tap)
        }
        
        if longPressAction != nil
        {
            let longPress = UILongPressGestureRecognizer(target: target, action: longPressAction)
            longPress.delegate = self
            label.addGestureRecognizer(longPress)
        }
        
        label.frame = CGRectMake(label.frame.origin.x,label.frame.origin.y , label.frame.width + 10, 25)
            if self.tags.count == 0
                {
                    label.frame = CGRectMake(hashtagsOffset.left, hashtagsOffset.top, label.frame.width, label.frame.height)
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.addSubview(label)
                        self.setNeedsDisplay()
                    })
                    self.tags.append(label)
                }
                else
                {
                    var newPoint = self.getNextIndex()
                    if (newPoint.x + label.frame.width) >= self.frame.width
                    {
                        self.currentRow++
                        newPoint = CGPointMake(hashtagsOffset.left, CGFloat(self.currentRow*30) + hashtagsOffset.top)
                    }
                    isOutofBounds(newPoint,labelFrame: label.frame)
                    
                    
                    label.frame = CGRectMake(newPoint.x, newPoint.y, label.frame.width, label.frame.height)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.addSubview(label)
                        self.setNeedsDisplay()
                    })
                    self.tags.append(label)
                }
    }
    
    
    private func isOutofBounds(newPoint:CGPoint,labelFrame:CGRect)
    {
        let bottomYLimit = newPoint.y + labelFrame.height
        if bottomYLimit > self.contentSize.height
        {
            self.containerView.frame = CGRectMake(self.containerView.frame.origin.x, self.containerView.frame.origin.y, self.containerView.frame.width, self.containerView.frame.height + 25)
            self.contentSize = CGSizeMake(self.contentSize.width, self.contentSize.height+25)
        }
    }
    
    func getNextIndex() -> CGPoint
    {
        
        let y = CGFloat(currentRow * 30) + hashtagsOffset.top
        let lastTagFrame = tags[tags.count-1].frame
        let x = lastTagFrame.origin.x + lastTagFrame.width + 5
        
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
        tags[index].removeFromSuperview()
        
        reLayoutTagsFromIndex(index)
        tags.removeAtIndex(index)
    }
    
    private func reLayoutTagsFromIndex(index:Int)
    {
        let animation:()->() =
        {
            var previousFrame = self.tags[index].frame
            for i in index+1...self.tags.count - 1
            {
                let temp = self.tags[i].frame
                self.tags[i].frame = previousFrame
                previousFrame = temp
            }
        }
        UIView.animateWithDuration(0.3, animations: animation)
    }
    
    

    
    
    
}

