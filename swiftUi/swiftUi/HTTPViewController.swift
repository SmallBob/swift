//
//  HTTPViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/24.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit



typealias CompletionHandle = (response : String) -> ()

class HTTPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    func connection(connection : NSURLConnection! , didReceiveData data : NSData) -> () {
        var returnString : NSString?
        returnString = NSString(data: data,encoding: NSUTF8StringEncoding)


        do{
           let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            print(jsonData)
        }catch{
            print(error)
        }

        print(returnString)


    }


    func post(completinoHandle : CompletionHandle){
        let request = NSMutableURLRequest(URL: NSURL(string: "http://myserverip/myfile.php")!)
        request.HTTPMethod = "POST"
        let postString = "data=xxxxxxx"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                print("error=\(error)")
                return
            }
            print("response = \(response)")

            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            completinoHandle(response:String(responseString))

            print("responseString = \(responseString!)")

        }

        task.resume()
        
        
        

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
