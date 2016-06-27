//
//  UIWebViewViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/23.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UIWebViewViewController: UIViewController ,UIWebViewDelegate{

    let urlString : String = "https://github.com"
    var myWebView : UIWebView!
    var mySpinner : UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(self.doneAction))

        self.myWebView = UIWebView()
        self.myWebView.frame = self.view.bounds
        self.myWebView.backgroundColor = UIColor.grayColor()
        self.myWebView.delegate = self
        self.myWebView.scalesPageToFit = true
        self.view.addSubview(self.myWebView)

        self.mySpinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        self.mySpinner.center = self.myWebView.center
        self.myWebView.addSubview(self.mySpinner)

        self.mySpinner.startAnimating()

        if let urlToBrowse = NSURL(string: self.urlString){
            let urlRequest = NSURLRequest(URL:urlToBrowse)
            self.myWebView.loadRequest(urlRequest)
        }


        // Do any additional setup after loading the view.
    }

    func doneAction() -> Void {
        self.mySpinner.startAnimating()
        self.myWebView.reload()
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        self.mySpinner.stopAnimating()
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
