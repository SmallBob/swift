//
//  ViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/17.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PassValueViewControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:textField
    @IBAction func textField(sender: UIButton) {
        let vc = UITextFieldViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "TextField"
        self.navigationController?.pushViewController(vc , animated: true)

    }

    //MARK:textView
    @IBAction func textView(sender: UIButton) {
        let vc = UITextViewViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "TextView"
        self.navigationController?.pushViewController(vc, animated: true)

    }

    //MARK:slider
    @IBAction func sliderView(sender: UIButton) {
        let vc = UISliderViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "slider"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func `switch`(sender: UIButton) {
        let vc = UISwitchViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "switch"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func activitylndicator(sender: UIButton) {
        let vc = UIActivitylndicatorViewViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "activity"
        self.navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func progressView(sender: UIButton) {
        let vc = UIProgressViewViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "progress"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func stepper(sender: UIButton) {
        let vc = UIStepperViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "stepper"
        self.navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func blurEffect(sender: UIButton) {
        let vc = UIBlurEffectViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "UIBlurEffectView"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func scrollView(sender: UIButton) {
        let vc = UIScrollViewViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "scrollView"
        self.navigationController?.pushViewController(vc, animated: true)
    }



    
    @IBAction func alertViewContrller(sender: UIButton) {
        let vc = UIAlertViewControllerViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "alertViewContrller"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func webView(sender: UIButton) {
        let vc = UIWebViewViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "webView"
        self.navigationController?.pushViewController(vc, animated: true)
    }



    @IBAction func tableView(sender: UIButton) {
        let vc = UITableViewViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "tableView"
        self.navigationController?.pushViewController(vc, animated: true)

    }


    @IBAction func collectionView(sender: UIButton) {
        let vc = UICollectionViewViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "collectionView"
        self.navigationController?.pushViewController(vc, animated: true)

    }



    @IBAction func singleton(sender: UIButton) {
        let vc = SingletonViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "singleton"
        self.navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func gestureRecognizer(sender: UIButton) {
        let vc = UIGestureRecognizerViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "gestureRecognizer"
        self.navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func indexedTableVIew(sender: UIButton) {
        let vc = IndexedTableViewViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        vc.title = "indexedTableVIew"
        self.navigationController?.pushViewController(vc, animated: true)
    }




    @IBOutlet weak var passValueLabel: UILabel!


    @IBAction func passValue(sender: UIButton) {
        let vc = PassValueViewController()
        vc.view.backgroundColor = UIColor.whiteColor()
        //FIXME:代理需要打开
        //vc.passValueDelegate = self

        vc.sendToFirst(someFunctionThatClosure)

        vc.title = "passValue"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //MAKR: delegate
    func passValue(viewController: PassValueViewController, textLabel: String) {
        self.passValueLabel.text = textLabel
    }

    //闭包
    func someFunctionThatClosure(vController : PassValueViewController , textLable : String) -> Void {

        self.passValueLabel.text = textLable
    }
















    
}

