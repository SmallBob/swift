//
//  UIBlurEffectViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/21.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UIBlurEffectViewController: UIViewController {

    var imageView : UIImageView?

    func insertBlurView(view : UIView , style : UIBlurEffectStyle) -> () {
        view.backgroundColor = UIColor.clearColor()

        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.insertSubview(blurEffectView, atIndex: 0)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView = UIImageView()
        self.imageView!.image = UIImage(named: "img1")
        self.imageView!.frame = CGRectMake(self.view.frame.size.width/2-100, 100, 200, 300)
        self.view.addSubview(self.imageView!)
        self.insertBlurView(self.imageView!, style: .Light)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
