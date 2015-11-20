//
//  ViewController.swift
//  ListViewTest
//
//  Created by Oskar Zhang on 10/28/15.
//  Copyright © 2015 OZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    var listView:TagListView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         listView = TagListView(frame: CGRectMake(0, self.view.frame.height - 200, self.view.frame.width, 200))
        self.view.addSubview(listView)
        listView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        listView.layer.borderColor = UIColor.blackColor().CGColor
        listView.layer.borderWidth = 0.2
        for i in 100000000...100000500
        {
            let color:UIColor!
            if i%3 == 1
            {
                color = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1)
            }
            else if i%3 == 2
            {
                color = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
            }
            else
            {
                color = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
            }
        listView.addTag("\(i)", target: self, tapAction: "tap:", longPressAction: "longPress:",backgroundColor: color,textColor: UIColor.whiteColor())
        }
    }
    
    
    @IBAction func deleteFirstTag(sender: AnyObject) {
        listView.removeTagWithIndex(0)
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

