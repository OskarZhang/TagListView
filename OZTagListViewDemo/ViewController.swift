//
//  ViewController.swift
//  ListViewTest
//
//  Created by Oskar Zhang on 10/28/15.
//  Copyright © 2015 OZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var tagListView:TagListView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagListView = TagListView(frame: CGRect(x: 0, y: self.view.frame.height - 200, width: self.view.frame.width, height: 200))
        self.view.addSubview(tagListView)
        tagListView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        tagListView.layer.borderColor = UIColor.black.cgColor
        tagListView.layer.borderWidth = 0.2
        
        tagListView.rowHeight = 40
        tagListView.tagHorizontalPadding = 5.0
        tagListView.tagVerticalPadding = 5.0
        tagListView.tagCombinedMargin = 10.0
        
        
        let demoTags = ["friends","fashion","smile","like4like","instamood","family","nofilter","amazing","style","follow4follow","tbt","tflers","beach","followforfollow","lol","yolo","hair","iphoneonly","cool","girls","webstgram","funny","iphonesia","tweegram","my","instacool","igdaily","makeup","instagramhub","awesome","bored","instafollow","nice","eyes","look","throwback","look","home","instacollage"]
        for (index,i) in demoTags.enumerated()
        {
            let color:UIColor!
            if index%4 == 1
            {
                color = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1)
            }
            else if index%4 == 2
            {
                color = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
            }
            else if index%4 == 3
            {
                color = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            }
            else
            {
                color = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1)
            }
            tagListView.addTag(text: i, target: self, tapAction: Selector(("tap:")), longPressAction: Selector(("longPress:")),backgroundColor: color,textColor: UIColor.white)
        }
    }
    
    @IBAction func deleteMultipleTags(sender: AnyObject) {
        tagListView.removeMultipleTagsWithIndices(indexSet: [0,3,6,1,2,3,4,5,6,7,9,10,11])
    }
    
    @IBAction func deleteFirstTag(sender: AnyObject) {
        tagListView.removeTagWithIndex(index: 0)
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func addTag(sender: AnyObject) {
        if textField.text != nil
        {
            tagListView.addTag(text: textField.text!, target: self, tapAction: nil, longPressAction: nil, backgroundColor: UIColor.black, textColor: UIColor.white)
        }
        self.textField.resignFirstResponder()
        
    }
    func tap(sender:UIGestureRecognizer)
    {
        let label = (sender.view as! UILabel)
        print("tap from \(label.text!)")
    }
    func longPress(sender:UIGestureRecognizer)
    {
        let label = (sender.view as! UILabel)
        print("long press from \(label.text!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

