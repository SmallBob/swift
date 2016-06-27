//
//  UITextFieldViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UITextFieldViewController: UIViewController,UITextFieldDelegate {

    //MARK: 单例
    //swift
    static let instance : UITextFieldViewController = UITextFieldViewController()
    class func shareVC() -> UITextFieldViewController{
        return instance
    }

    
    //oc
    static var onceToken :dispatch_once_t = 0
    static var instanceOC : UITextFieldViewController?
    class func shareViewController() -> UITextFieldViewController {

        dispatch_once(&onceToken) {
            ()->Void in
            instanceOC = UITextFieldViewController()
        }
        return instanceOC!
    }


    class Demo {
        var url : NSString = ""
        lazy var completeURL:NSString = {
            [unowned self] in
            if self.url.hasPrefix("http://"){
                return self.url
            }else{
                return "http://".stringByAppendingString(self.url as String)
            }
            }()
        init(url:NSString){
            self.url = url
        }
    }






    lazy var sampleTextField : UITextField = {
        [unowned self]  in

        let tempTextField = UITextField()

        tempTextField.font = UIFont.systemFontOfSize(12.0)
        tempTextField.textColor = UIColor.redColor()

        //设置默认字体属性,这个属性的设置会影响到全部字体的属性。
//        tempTextField.defaultTextAttributes = [NSForegroundColorAttributeName : UIColor.greenColor() , NSParagraphStyleAttributeName : NSParagraphStyle.defaultParagraphStyle() , NSFontAttributeName : UIFont.systemFontOfSize(10)]


        //设置是否在开始编辑时清空输入框内容
        tempTextField.clearsOnBeginEditing = true



        /*
         UITextBorderStyle.None：无边框
         UITextBorderStyle.Line：直线边框
         UITextBorderStyle.RoundedRect：圆角矩形边框
         UITextBorderStyle.Bezel：边线+阴影
         */
        tempTextField.borderStyle = .Line

        tempTextField.placeholder = "提示框" //提示框文本

        //通过AttributedString设置缺省字符串
//        tempTextField.attributedPlaceholder = NSAttributedString(string: tempTextField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.blueColor() , NSParagraphStyleAttributeName : NSParagraphStyle.defaultParagraphStyle() , NSFontAttributeName : UIFont.systemFontOfSize(10)])



        tempTextField.adjustsFontSizeToFitWidth = true //效果 参照 label属性测试
        tempTextField.minimumFontSize = 10

        tempTextField.textAlignment = .Center //对齐方式
        tempTextField.contentVerticalAlignment = .Center // 垂直对齐方式

        //tempTextField.background = UIImage(named: "home")

        tempTextField.clearButtonMode=UITextFieldViewMode.WhileEditing  //编辑时出现清除按钮
        tempTextField.clearButtonMode=UITextFieldViewMode.UnlessEditing  //编辑时不出现，编辑后才出现清除按钮
        tempTextField.clearButtonMode=UITextFieldViewMode.Always  //一直显示清除按钮

        /*
         Default：系统默认的虚拟键盘
         ASCII Capable：显示英文字母的虚拟键盘
         Numbers and Punctuation：显示数字和标点的虚拟键盘
         URL：显示便于输入数字的虚拟键盘
         Number Pad：显示便于输入数字的虚拟键盘
         Phone Pad：显示便于拨号呼叫的虚拟键盘
         Name Phone Pad：显示便于聊天拨号的虚拟键盘
         Email Address：显示便于输入Email的虚拟键盘
         Decimal Pad：显示用于输入数字和小数点的虚拟键盘
         Twitter：显示方便些Twitter的虚拟键盘
         Web Search：显示便于在网页上书写的虚拟键盘
         */

        tempTextField.keyboardType = .Default

        tempTextField.becomeFirstResponder()  //获取焦点 键盘弹起
        tempTextField.resignFirstResponder()  //失去焦点，键盘收回

        /*
         UIReturnKeyType.Done //表示完成输入
         UIReturnKeyType.Go //表示完成输入，同时会跳到另一页
         UIReturnKeyType.Search //表示搜索
         UIReturnKeyType.Join //表示注册用户或添加数据
         UIReturnKeyType.Next //表示继续下一步
         UIReturnKeyType.Send //表示发送
         */

        tempTextField.returnKeyType = .Done


        //设置禁用时的背景图片
//        tempTextField.disabledBackground


        /*
         是否正在编辑（只读属性）

         @property(nonatomic,readonly,getter=isEditing) BOOL editing;

         是否允许更改字符属性字典

         @property(nonatomic) BOOL allowsEditingTextAttributes；

         设置属性字典
         
         @property(nonatomic,copy) NSDictionary *typingAttributes；
         

         */


        //rightView   注意：要做初始化 要不rightView ＝ nil
        let rightImage = UIImageView(image: UIImage(named: "home"))
        rightImage.frame = CGRectMake(0, 0, 140, 40)
        tempTextField.rightView? = UIView()
        tempTextField.rightView = rightImage
        tempTextField.rightViewMode = .Always
        tempTextField.rightView?.frame = CGRectMake(0, 0, 40, 40)
        tempTextField.rightView?.backgroundColor = UIColor.redColor()

        tempTextField.addTarget(self , action: #selector(UITextFieldViewController.textFieldClicked(_:)), forControlEvents: .EditingChanged)



        return tempTextField
    }()


    //MARK: delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text)
        return true
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        //返回一个BOOL值，指定是否循序文本字段开始编辑
        return true
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        //开始编辑时触发，文本字段将成为first responder
    }

    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        //返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出first responder
        //要想在用户结束编辑时阻止文本字段消失，可以返回NO
        //这对一些文本字段必须始终保持活跃状态的程序很有用，比如即时消息
        return true
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        //当用户使用自动更正功能，把输入的文字修改为推荐的文字时，就会调用这个方法。
        //这对于想要加入撤销选项的应用程序特别有用
        //可以跟踪字段内所做的最后一次修改，也可以对所有编辑做日志记录,用作审计用途。
        //要防止文字被改变可以返回NO
        //这个方法的参数中有一个NSRange对象，指明了被改变文字的位置，建议修改的文本也在其中
        
        return true
    }

    func textFieldShouldClear(textField: UITextField) -> Bool {
        //返回一个BOOL值指明是否允许根据用户请求清除内容
        //可以设置在特定条件下才允许清除内容

        return true
    }



    override func viewDidLoad() {
        super.viewDidLoad()


        self.sampleTextField.frame = CGRectMake(100, 100, 200, 40)
        self.sampleTextField.delegate = self
        self.view.addSubview(self.sampleTextField)






        dispatch_async(dispatch_get_global_queue(0, 0)) { 
            [unowned self]()-> Void in
            self.view
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:action
    func textFieldClicked(sender : UITextField) -> () {
        //扩展  输入文本的长度在一定范围内（注意，不是字数）

        if let _ = sender.text {
            if let positionRange = sender.markedTextRange {
                if let _ = sender.positionFromPosition(positionRange.start, offset: 0) {
                    //正在使用拼音，不进行校验
                } else {
                    //不在使用拼音，进行校验
                    self.checkTextFieldLengthAndModify(sender)
                }
            } else {
                //不在使用拼音，进行校验
                self.checkTextFieldLengthAndModify(sender)
            }
        }

    }

    func checkTextFieldLengthAndModify(textField:UITextField) {
        if let text : NSString = textField.text {
            if self.checkTextFielLength(textField, str: text) {
                //长度正常，不处理
            } else {
                //超出长度，开始处理
                print("输入文字过长")

                let len = text.length
                let txt = text as NSString
                if len > 0 {
                    //进行截短，看是否超长，如果不超长，则继续截短，直到不超长为止
                    //Exp:
                    //apple
                    //appl
                    //app

                    for i in (0 ... (len - 1)) {

                        let txt_s = txt.substringToIndex(len - 1 - i)
                        //print("txt_s : \(txt_s)")
                        if self.checkTextFielLength(textField, str: txt_s) {
                            //就截取到这了
                            textField.text = txt_s
                            break
                        } else {
                            //继续截取
                        }

                    }

//                    for var i = len-1; i >= 0; i -= 1 {
//                        let txt_s = txt.substringToIndex(i)
//                        //print("txt_s : \(txt_s)")
//                        if self.checkTextFielLength(textField, str: txt_s) {
//                            //就截取到这了
//                            textField.text = txt_s
//                            break
//                        } else {
//                            //继续截取
//                        }
//                    }
                }
            }
        }
    }
   // 4、实现checkTextFielLength，判断文字是否超出输入框长度

    func checkTextFielLength(textField: UITextField, str: NSString) -> Bool {
        let rect = str.boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: textField.defaultTextAttributes, context: nil)
        
        if rect.width > textField.frame.size.width {
            return false
        } else {
            return true
        }
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
