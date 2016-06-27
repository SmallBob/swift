//
//  UIButtonViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UIButtonViewController: UIViewController {

    //MARK:懒加载button
    lazy var sampleButton : UIButton = {
        let tempButton = UIButton(type:UIButtonType.Custom)



        tempButton.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        tempButton.adjustsImageWhenHighlighted = true
        tempButton.adjustsImageWhenDisabled = true
        tempButton.showsTouchWhenHighlighted = true

        tempButton.tintColor = UIColor.redColor()

        tempButton.setTitle("我是按钮", forState: .Normal)
        tempButton.setTitle("selected", forState: .Selected)
        tempButton.setTitle("highlighted", forState: .Highlighted)

        tempButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        tempButton.setTitleColor(UIColor.blueColor(), forState: .Selected)
        tempButton.setTitleColor(UIColor.greenColor(), forState: .Highlighted)

        tempButton.setTitleShadowColor(UIColor.orangeColor(), forState: .Normal)

        tempButton.titleLabel?.font = UIFont.systemFontOfSize(10)

        /*
         两者还是有一定区别的；
         首先setBackgroundImage，image会随着button的大小而改变，图片自动会拉伸来适应button的大小，这个时候任然可以设置button的title，image不会挡住title；
         相反的的setImage，图片不会进行拉伸，原比例的显示在button上，此时再设置title，title将无法显示，因此可以根据需求选中方法；
         */
        tempButton.setImage(UIImage.init(named: "home"), forState: .Normal)
        tempButton.setBackgroundImage(nil, forState: .Normal)

        //富文本
//        tempButton.setAttributedTitle(<#T##title: NSAttributedString?##NSAttributedString?#>, forState: <#T##UIControlState#>)

//        tempButton.titleForState(.Normal)
//        tempButton.titleColorForState(.Normal)
//        tempButton.titleShadowColorForState(.Normal)
//        tempButton.imageForState(.Normal)
//        tempButton.backgroundImageForState(.Normal)
//        tempButton.attributedTitleForState(.Normal)


        tempButton.addTarget(self, action: #selector(UIButtonViewController.tempButtonClicked(_:)), forControlEvents: .TouchUpInside)
        tempButton.addTarget(self, action: #selector(UIButtonViewController.temButtonClieckedNoAction), forControlEvents: .TouchUpInside)

        return tempButton
    }()

    func tempButtonClicked(sender:UIButton) -> () {
        print("有参数点击事件")
    }

    func temButtonClieckedNoAction() -> () {
        print("无参数点击事件")
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
