//
//  UIActivitylndicatorViewViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UIActivitylndicatorViewViewController: UIViewController {

    lazy var sampleActivity : UIActivityIndicatorView = {
        let tempActivity = UIActivityIndicatorView(activityIndicatorStyle: .Gray)


        tempActivity.hidesWhenStopped  = false


        return tempActivity
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sampleActivity.center = self.view.center
        self.playActivity()
        self.view.addSubview(self.sampleActivity)


        //单击监听
        let tapSingle=UITapGestureRecognizer(target:self,action:#selector(self.tagSingleClicked))
        tapSingle.numberOfTapsRequired=1
        tapSingle.numberOfTouchesRequired=1
        self.sampleActivity.addGestureRecognizer(tapSingle)
        self.view.addGestureRecognizer(tapSingle)

        // Do any additional setup after loading the view.
    }


    func tagSingleClicked() -> () {
        self.sampleActivity.stopAnimating()

        
    }


    func playActivity() -> () {
        self.sampleActivity.startAnimating()
    }

    func stopActivity() -> () {
        self.sampleActivity.stopAnimating()
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
