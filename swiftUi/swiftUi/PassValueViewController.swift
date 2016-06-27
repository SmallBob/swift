//
//  PassValueViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/24.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit


//闭包

typealias sendValueClosure = (vController : PassValueViewController ,textLabel : String )->Void

//代理
protocol PassValueViewControllerDelegate {
    func passValue(viewController : PassValueViewController , textLabel : String) -> ()
}

class PassValueViewController: UIViewController {

    //代理
    var passValueDelegate : PassValueViewControllerDelegate?
    var delegate : PassValueViewControllerDelegate?

    //闭包
    var myClosure : sendValueClosure?

    func sendToFirst(closure : sendValueClosure ) -> () {
        self.myClosure = closure
    }




    
    lazy var sampleButton : UIButton = {

        var tempButton = UIButton.init(type: UIButtonType.Custom)
        tempButton.setTitle("button", forState: .Normal)
        tempButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        tempButton.backgroundColor = UIColor.blueColor()
        tempButton.addTarget(self , action: #selector(PassValueViewController.tempButtonClicked(_:)), forControlEvents: .TouchUpInside)
        return tempButton
    }()

    func tempButtonClicked(button : UIButton) -> () {
        
        //代理
        self.passValueDelegate?.passValue(self , textLabel: "passValue")
        self.navigationController?.popToRootViewControllerAnimated(true)

        //闭包
        if self.myClosure != nil {
            self.myClosure!(vController : self , textLabel: "myClosure")
        }


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sampleButton.frame = CGRectMake(100, 100, 100, 40)
        self.view.addSubview(self.sampleButton)

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
