//
//  UITextViewViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UITextViewViewController: UIViewController,UITextViewDelegate {

    lazy var sampleTextView : UITextView = {
        //循环引用问题， weak  释放 nil  unowened  必有值  释放会产生野指针
        [unowned self] in

        let tempTextView = UITextView()
        tempTextView.text = "13891315778 3?再引导学生看图：小女孩的头部像ａ的形，小女孩张大嘴巴发的就是ａ的音。教儿歌，帮助学生记忆ａ的音和形。4?学生反复练习发ａ的音。教师巡视指导纠正，单个练习（开小火车，指名读）。(三)学习单韵母ｏ(方法同上) 注意教发ｏ音时，讲要领，做示范。发“o”音时，嘴半开半闭，嘴唇圆拢，舌尖向后缩，舌面后部隆起。发音方法，把“喔喔”的音拉长，口形舌位不变，接着呼气发音，就能发出正确的字母音了。拢圆嘴巴o o o(四)学习单韵母ｅ(方法同上)注意教发音时，讲要领，做示范。这韵母不是鹅的音，是第一声“e”，鹅是第二声。发音时，口形要变扁，半开半闭，舌头后缩，舌根稍微抬高一些，嘴角边咧开，露出牙齿。嘴巴扁小e ee。(五)小结"

        tempTextView.font = UIFont.systemFontOfSize(10)
        tempTextView.textColor = UIColor.redColor()
        tempTextView.textAlignment = .Center

        tempTextView.selectedRange = NSMakeRange(4, 10)
        tempTextView.editable = true //是否可编辑
        tempTextView.scrollEnabled = true //内容是否可选


        /*
         给文字中的电话号码和网址自动加链接

         PhoneNumber: UIDataDetectorTypes { get } // Phone number detection
         Link: UIDataDetectorTypes { get } // URL detection
         @available(iOS 4.0, *)
         var Address: UIDataDetectorTypes { get } // Street address detection
         @available(iOS 4.0, *)
         CalendarEvent: UIDataDetectorTypes { get } // Event detection

         None: UIDataDetectorTypes { get } // No detection at all
         All: UIDataDetectorTypes { get } // All types

         */
        tempTextView.dataDetectorTypes = .All

        //UITextView 在长按下是否可以选择不同的文字样式
        tempTextView.allowsEditingTextAttributes = false

//        UITextView 的文本容器边界
//        tempTextView.textContainerInset 

        //UITextView 是否点击编辑时把旧内容全选
        tempTextView.clearsOnInsertion = true


        return tempTextView

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sampleTextView.frame = CGRectMake(10, 100, self.view.bounds.size.width - 20, 100)
        self.sampleTextView.delegate = self


        //自定义选择内容后的菜单,我们在看新闻或小说的时候，常常在点选文字后会弹出菜单进行选择，复制等操作。我们可以在这个菜单上添加一些其他内容，如加上“邮件”“微信”等按钮选项
        let  mail = UIMenuItem(title: "邮件", action: #selector(UITextViewViewController.onMail))
        let weixin = UIMenuItem(title: "微信", action: #selector(UITextViewViewController.onWeiXin))
        let menu : UIMenuController? = UIMenuController()
        menu!.menuItems = [mail,weixin]


        self.view.addSubview(self.sampleTextView)



        // Do any additional setup after loading the view.
    }


    func onMail(){
        print("onMail")
    }
    func onWeiXin(){
        print("onWeiXin")
    }

    //MARK:textViewDelegate
    // 1.该方法是用来设置 UITextView 是否可以编辑
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        print("正在开始编辑")
        return true
    }

    // 2.该方法是用来设置 UITextView 是否可以结束编辑
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        print("正在结束编辑")
        return true
    }

    // 3.该方法是用来设置 UITextView 在开始编辑时调用
    func textViewDidBeginEditing(textView: UITextView) {
        print("开始编辑")
    }

    // 4.该方法是用来设置 UITextView 在结束编辑时调用
    func textViewDidEndEditing(textView: UITextView) {
        print("结束编辑")
    }

    // 5.该方法是用来设置 UITextView 内容是否可更改
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        print("正在更改内容")
        return true
    }

    // 6.该方法是用来设置 UITextView 内容更改后时调用
    func textViewDidChange(textView: UITextView) {
        print("内容已经改变")
    }

    // 7.该方法是用来选择需要更改内容的 UITextView
    func textViewDidChangeSelection(textView: UITextView) {
        print("已经选择要更改内容的文本框")
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
