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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var listView = TagListView(frame: CGRectMake(0, self.view.frame.height - 200, self.view.frame.width, 200))
        self.view.addSubview(listView)
        listView.backgroundColor = UIColor.blackColor()
        for i in 100000000...100000500
        {
        listView.addTag("\(i)", target: self, tapAction: "tap:", longPressAction: "longPress:",backgroundColor: UIColor.whiteColor(),textColor: UIColor.blackColor())
        }
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

