//
//  UIGestureRecognizerViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/24.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit


class CustomGestureRecognizer: UIGestureRecognizer {
    var leftTop = false
    var rightDown = false

    override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }


     override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {

    }

     override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        let myTouch = touches.first! as UITouch
        let myLocation = myTouch.locationInView(self.view)
        if myLocation.x < 10 && myLocation.y < 10 {
            leftTop = true
        }

        if (myLocation.x + 10) > self.view?.bounds.width && (myLocation.y + 10) > self.view?.bounds.height {
            rightDown = true
        }

        if leftTop && rightDown {
            self.state = UIGestureRecognizerState.Ended
        }
        
    }
    
     override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        self.reset()
    }
}

class UIGestureRecognizerViewController: UIViewController {

    var imageView : UIImageView?




    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView = UIImageView()
        self.imageView?.frame = CGRectMake(0, 0, 200, 200)
        self.imageView?.center = self.view.center
        self.imageView?.image = UIImage(named: "img1")
        self.imageView?.backgroundColor = UIColor.grayColor()
        self.view.addSubview(self.imageView!)
        self.imageView?.userInteractionEnabled = true

        self.tapGestureDemo()
        self.pinchGestureDemo()
        self.swipeGestureDemo()
        self.rotationGestureDemo()
        self.panGestureDemo()
        self.LongPressGestureDemo()
        self.custonGestureDemo()


        // Do any additional setup after loading the view.
    }

    /**点击手势*/
    func tapGestureDemo() -> () {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(UIGestureRecognizerViewController.viewTap(_:) ))
        self.imageView?.addGestureRecognizer(gesture)
    }

    func viewTap(sender : UITapGestureRecognizer) -> () {
        print("viewTap。。。")
    }

    /**缩放手势*/
    func pinchGestureDemo() -> () {
        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(UIGestureRecognizerViewController.viewPich(_:)))
        self.imageView?.addGestureRecognizer(gesture)
    }

    func viewPich(sender : UIPinchGestureRecognizer) -> () {
        print("pinch...")
        let _width = self.imageView?.bounds.width
        let _height = self.imageView?.bounds.height
        self.imageView?.bounds.size = CGSize(width: _width! * sender.scale, height: _height! * sender.scale)
    }


    /**旋转手势*/
    func rotationGestureDemo() {
        //建立手势识别器
        let gesture = UIRotationGestureRecognizer(target: self, action: #selector(UIGestureRecognizerViewController.viewRotation(_:)))
        //附加识别器到视图
        self.imageView?.addGestureRecognizer(gesture)
    }

    /**滑动手势*/
    func swipeGestureDemo() {
        //建立手势识别器
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(UIGestureRecognizerViewController.viewSwipe(_:)))
        //附加识别器到视图
        self.imageView?.addGestureRecognizer(gesture)
    }

    /**平移手势*/
    func panGestureDemo() {
        //建立手势识别器
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(UIGestureRecognizerViewController.viewPan(_:)))
        //附加识别器到视图
        self.imageView?.addGestureRecognizer(gesture)
    }

    /**长按手势*/
    func LongPressGestureDemo() {
        //建立手势识别器
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(UIGestureRecognizerViewController.viewLongPress(_:)))
        //附加识别器到视图
        self.imageView?.addGestureRecognizer(gesture)
    }

    /**自定义手势*/
    func custonGestureDemo() {
        //建立手势识别器
        let gesture = CustomGestureRecognizer(target: self, action: #selector(UIGestureRecognizerViewController.viewCustom(_:)))
        //附加识别器到视图
        self.imageView?.addGestureRecognizer(gesture)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**旋转事件*/
    func viewRotation(sender: UIRotationGestureRecognizer) {
        self.imageView?.transform = CGAffineTransformMakeRotation(sender.rotation)
    }

    /**滑动事件*/
    var offsetX: CGFloat = 0
    func viewSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizerDirection.Right {
            //每次向右平移20
            offsetX += 20
            self.imageView?.transform = CGAffineTransformMakeTranslation(offsetX, 0)
        }
    }

    /**平移事件*/
    func viewPan(sender: UIPanGestureRecognizer) {
        let _transX = sender.translationInView(self.imageView).x
        let _transY = sender.translationInView(self.imageView).y

        self.imageView?.transform = CGAffineTransformMakeTranslation(_transX, _transY)
    }

    /**长按事件*/
    func viewLongPress(sender: UILongPressGestureRecognizer) {
        print("long pressed....")
    }
    
    func viewCustom(sender: CustomGestureRecognizer) {
        print("custom gesture...")
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
