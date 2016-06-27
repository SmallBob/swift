//
//  UIAlertViewControllerViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/23.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UIAlertViewControllerViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .Custom)
        button.backgroundColor = UIColor.blueColor()
        button.setTitleColor(UIColor.redColor(), forState: .Normal)
        button.tag = 50
        button.setTitle("alert", forState: .Normal)
        button.frame = CGRectMake(100, 100, 100, 40)
        button.addTarget(self, action: #selector(UIAlertViewControllerViewController.alertShow(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)

        let buttonAction = UIButton(type: .Custom)
        buttonAction.backgroundColor = UIColor.blueColor()
        buttonAction.setTitleColor(UIColor.redColor(), forState: .Normal)
        buttonAction.tag = 100
        buttonAction.setTitle("alertSheet", forState: .Normal)
        buttonAction.frame = CGRectMake(100, 200, 100, 40)
        buttonAction.addTarget(self, action: #selector(UIAlertViewControllerViewController.alertShow(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonAction)
        // Do any additional setup after loading the view.
    }

    func alertShow(sender : UIButton) -> Void {
        switch sender.tag {
        case 50:
            self.creatAlert()
            break

        case 100:
            self.creatAlertSheet()
            break

        default:
            print("nil")
        }
    }

    func creatAlert() -> Void {

        let alert = UIAlertController(title: "alert", message: "Alert Demo", preferredStyle: .Alert)

        let okAction = UIAlertAction(title: "ok", style: .Default) { (alertAciton : UIAlertAction) in
            print("okAction")
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .Default) { (alertAciton : UIAlertAction) in
            print("cancleAction")
        }

        alert.addTextFieldWithConfigurationHandler { (textField : UITextField)  in

            textField.placeholder = "text"
            textField.delegate = self
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        print("开始编辑")
    }

    func creatAlertSheet() -> Void {
        let alertSheet = UIAlertController(title: "alertSheet", message: "AlertSheet Demo", preferredStyle: .ActionSheet)
        let okAction = UIAlertAction(title: "ok", style: .Default) { (alertAction : UIAlertAction) in
            print("okSheet")

            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .Default) { (alertAction : UIAlertAction) in
            print("cancelSheet")
        }
        alertSheet.addAction(okAction)
        alertSheet.addAction(cancelAction)

        self.presentViewController(alertSheet, animated: true, completion: nil)
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
