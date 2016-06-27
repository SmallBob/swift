//
//  UIStepperViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UIStepperViewController: UIViewController {

    lazy var sampleStepper : UIStepper = {
        let tempStepper = UIStepper()
        tempStepper.maximumValue = 100
        tempStepper.minimumValue = 1
        tempStepper.value = 10

        tempStepper.stepValue = 1

        //设置stepper可以按住不放来连续更改值
        tempStepper.continuous = true

        //设置stepper是否循环（到最大值时再增加数值从最小值开始）
        tempStepper.wraps = true

        tempStepper.tintColor = UIColor.redColor()
        tempStepper.backgroundColor = UIColor.blueColor()

        tempStepper.addTarget(self, action: #selector(self.tempStepper(_:)), forControlEvents: .ValueChanged)


        //用自定义的图片替换“-”和“+”
//        stepper.setDecrementImage(UIImage(named: "sub.png"), forState: UIControlState.Normal)
//        stepper.setIncrementImage(UIImage(named: "add.png"), forState: UIControlState.Normal)

        return tempStepper
    }()

    func tempStepper(sender : UIStepper) -> () {
        print(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sampleStepper.frame = CGRectMake(10, 100, 100, 40)
        self.sampleStepper.center = self.view.center
        self.view.addSubview(self.sampleStepper)

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
