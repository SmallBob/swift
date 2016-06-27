//
//  UISwitchViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UISwitchViewController: UIViewController {

    lazy var sampleSwitch : UISwitch = {
        [unowned self] in
        let tempSwitch = UISwitch()
        tempSwitch.onTintColor = UIColor.redColor()
        tempSwitch.tintColor = UIColor.blueColor()

        tempSwitch.thumbTintColor = UIColor.greenColor()

        tempSwitch.onImage = UIImage(named : "home")

        tempSwitch.offImage = UIImage(named: "home")

        tempSwitch.on = true

        tempSwitch.addTarget(self, action: #selector(UISwitchViewController.switchValueChanged(_:)), forControlEvents: .ValueChanged)


        return tempSwitch

        }()

    func switchValueChanged(sender : UISwitch) -> () {
        //sender.setOn(!sender.on, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.sampleSwitch.frame = CGRectMake(10, 100, 100, 40)
        self.view.addSubview(self.sampleSwitch)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
