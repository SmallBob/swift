//
//  UIProgressViewViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UIProgressViewViewController: UIViewController {

    lazy var sampleProgress : UIProgressView = {
        let tempProgress = UIProgressView(progressViewStyle: .Bar)

        tempProgress.progress = 1.0

        tempProgress.tintColor = UIColor.redColor()
        tempProgress.trackTintColor = UIColor.blueColor()


        return tempProgress

    }()

    deinit {
        print("deinit")

    }


    var button : UIButton!
    var progressView : UIProgressView!
    var timer : NSTimer!
    var remainTime = 100
    var messageLabel :UILabel!

    var center : Double{
        get {
            print("get")
            return 10.0 + Double(remainTime)

        }
        set {
            print("set")
            self.center = newValue - 10.0 
        }
    }




    override func viewDidLoad() {
        super.viewDidLoad()

        print(center)

        self.sampleProgress.frame = CGRectMake(10, 100, 200, 40)
        //self.view.addSubview(self.sampleProgress)


        button = UIButton(type: .System)
        button.frame = CGRectMake(self.view.frame.width/2-50, 150, 100, 50)
        button.setTitle("开始", forState: .Normal)
        button.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)

        progressView = UIProgressView(progressViewStyle: .Bar)
        progressView.frame = CGRectMake(self.view.frame.width/2 - 50, 200, 100, 100)

        progressView.progress = 1.0
        progressView.progressTintColor = UIColor.blueColor()
        progressView.trackTintColor = UIColor.greenColor()

        messageLabel = UILabel()
        messageLabel.frame = CGRectMake(self.view.frame.width/2 - 50, 300, 100, 40)
        messageLabel.textColor = UIColor.redColor()


        self.view.addSubview(messageLabel)
        self.view.addSubview(button)
        self.view.addSubview(progressView)



        // Do any additional setup after loading the view.
    }



    //MARK:buttonClicked
    func buttonClicked(sender : UIButton) -> () {
        button.enabled = false
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        timer.fire()
    }

    func timerAction() {
        if remainTime <= 0 {
            //计时结束
            timer.invalidate()
            messageLabel.text = "结束"
        }else {
            print(remainTime)
            remainTime = remainTime-1
            let progressValue = Float(remainTime)/100
            progressView.setProgress(progressValue, animated: true)

            messageLabel.text = String(remainTime)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        timer?.invalidate()
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
