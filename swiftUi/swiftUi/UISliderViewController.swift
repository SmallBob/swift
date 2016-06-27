//
//  UISliderViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UISliderViewController: UIViewController {

    lazy var sampleSlider : UISlider = {
        let tempSlider = UISlider()
        tempSlider.maximumValue = 100
        tempSlider.minimumValue = 0
        tempSlider.value = 50

        //滑块后面槽线两侧添加图标
        tempSlider.minimumValueImage = UIImage(named: "Audio1")
        tempSlider.maximumValueImage = UIImage(named: "Audio2")

        tempSlider.continuous = false

        tempSlider.addTarget(self, action: #selector(UISliderViewController.tempSlider(_:)), forControlEvents: .ValueChanged)

        //滑块左右两边槽的颜色
        tempSlider.minimumTrackTintColor = UIColor.redColor() //左边槽的颜色
        tempSlider.maximumTrackTintColor = UIColor.blueColor()//右边槽的颜色

        tempSlider.setThumbImage(UIImage(named:"home"), forState: .Normal)



        /*
         //设置滑块右边部分的图片
         slider.setMaximumTrackImage(UIImage(named:"slider_max"),forState:UIControlState.Normal)
         //设置滑块左边部分的图片
         slider.setMinimumTrackImage(UIImage(named:"slider_min"),forState:UIControlState.Normal)
         //设置滑块的图片
         slider.setThumbImage(UIImage(named:"slider_thumb"),forState:UIControlState.Normal)

         //设置滑块右边部分的图片-使用三宫格缩放（左右14像素不变，中间缩放）
         let imgTrackRight = UIImage(named:"slider_max")
         let imgRight = imgTrackRight!.stretchableImageWithLeftCapWidth(14, topCapHeight:0)
         slider.setMaximumTrackImage(imgRight, forState:UIControlState.Normal)

         */


        return tempSlider
    }()


    func tempSlider(sender : UISlider) -> () {
        print(sender.value)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sampleSlider.frame = CGRectMake(10, 100, self.view.bounds.size.width-20, 40)
        self.sampleSlider.setValue(10, animated: true)

        self.view.addSubview(self.sampleSlider)

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
