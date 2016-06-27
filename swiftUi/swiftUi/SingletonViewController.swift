//
//  SingletonViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/24.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit



class Singleton {
      var name = "111"
    class var shareInstance: Singleton {
        struct Static {
            static var onceTonken : dispatch_once_t = 0
            static var instance : Singleton? = nil
        }
        dispatch_once(&Static.onceTonken) { 
            Static.instance = Singleton()
        }
        return Static.instance!
    }
}


/*
 这种方法支持懒惰初始化因为swift lazy 初始化类常量（变量），是线程安全的定义让。
 在快速1.2中引入类常量。如果你需要支持较早版本的快捷，使用嵌套的结构方法下面或全局常数。
 */
class SingletonOne {
    var name = "111"
    static let instance = SingletonOne()
    private init(){
        print("creat singletonOne")
    }
}

/*
 在这里，我们使用一个嵌套的结构静定为类常量。这是一个快速1.1和早期类的静态常量的这个问题，还可以作为一个功能的静态常量和变量的不足的解决方法。
 */
class SingletonTwo {
    var name = "111"
    class var sharedInstance: SingletonTwo {
        struct Static {
            static let instance : SingletonTwo = SingletonTwo()
        }
        return Static.instance
    }
}



class SingletonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let s1 = SingletonOne.instance
        s1.name = "s1"

        let s2 = SingletonOne.instance
        s2.name = "s2"

        print("s1 : name:\(s1.name)   s2 : name :\(s2.name)")
        



        let s11 = Singleton.shareInstance
        s11.name = "s1"

        let s22 = Singleton.shareInstance
        s22.name = "s2"

        print("s11 : name:\(s11.name)   s22 : name :\(s22.name)")

        let s111 = SingletonTwo.sharedInstance
        s111.name = "s1"

        let s222 = SingletonTwo.sharedInstance
        s222.name = "s2"

        print("s111 : name:\(s111.name)   s222 : name :\(s222.name)")



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
