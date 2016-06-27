//
//  UIScrollViewViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/22.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class UIScrollViewViewController: UIViewController,UIScrollViewDelegate {

    var sampleScroll : UIScrollView = {
        let tempScrll  = UIScrollView()
        //修改滑动条的样式
        tempScrll.indicatorStyle = .Black

        //decelerationRate: 手指滑动后抬起，页面的减速速率。可以使用UIScrollViewDecelerationRateNormal和UIScrollViewDecelerationRateFast常量值来设置合理的减速速率。
        tempScrll.decelerationRate = UIScrollViewDecelerationRateNormal

        //初始状态 位置
        /*
         描述了内容视图相对于scrollView窗口的位置(当然是向上向左的偏移量咯)。默认值是CGPointZero，也就是(0,0)。当视图被拖动时，系统会不断修改该值。也可以通过setContentOffset:animated:方法让图片到达某个指定的位置。
         监控目前滚动的位置

         */
        tempScrll.contentOffset = CGPointZero


        //滚动范围大小
        //tempScrll.contentSize = CGSizeMake(100, 200)

        //视图在scrollview 中的位置
//        tempScrll.contentInset 


        /*
         指定控件是否只能在一个方向上滚动
         控制控件遇到边框是否反弹
         控制垂直方向遇到边框是否反弹
         控制水平方向遇到边框是否反弹
         */
        tempScrll.directionalLockEnabled = false
        tempScrll.bounces = true
        tempScrll.alwaysBounceVertical = false
        tempScrll.alwaysBounceHorizontal = false

        //控制控件是否整页翻动
        tempScrll.pagingEnabled = false

        //控制控件是否能滚动
        tempScrll.scrollEnabled = true

        //是否显示水平和垂直方向滚动条
        tempScrll.showsVerticalScrollIndicator = true
        tempScrll.showsHorizontalScrollIndicator = true

        //指定滚动条在scrollerView中的位置
//        tempScrll.scrollIndicatorInsets

        /*
         loat decelerationRate	改变scrollerView的减速点位置
         BOOL tracking	监控当前目标是否正在被跟踪
         BOOL dragging	监控当前目标是否正在被拖拽
         BOOL decelerating	监控当前目标是否正在减速
         BOOL delaysContentTouches	控制视图是否延时调用开始滚动的方法
         BOOL canCancelContentTouches	控制控件是否接触取消touch的事件
         float minimumZoomScale	缩小的最小比例
         float maximumZoomScale	放大的最大比例
         float zoomScale	设置变化比例
         BOOL bouncesZoom	控制缩放的时候是否会反弹
         BOOL zooming	判断控件的大小是否正在改变
         BOOL zoomBouncing	判断是否正在进行缩放反弹
         BOOL scrollsToTop	控制控件滚动到顶部
         */



        return tempScrll
    }()

    lazy var imageView : UIImageView = {
        let tempImageView = UIImageView()
        tempImageView.image = UIImage(named: "img1")
        return tempImageView
    }()
    override func viewDidLoad() {

        self.imageView.frame = CGRectMake(0, 0, 1000, 1000)

        self.sampleScroll = UIScrollView(frame: self.view.bounds)
        self.sampleScroll.backgroundColor = UIColor.blackColor()
        self.sampleScroll.contentSize = self.imageView.bounds.size
        self.sampleScroll.autoresizingMask = [UIViewAutoresizing.FlexibleWidth , UIViewAutoresizing.FlexibleHeight]
        self.sampleScroll.addSubview(self.imageView)
        self.view.addSubview(self.sampleScroll)

        self.sampleScroll.contentOffset = CGPoint(x: 100, y: 200)

        self.sampleScroll.delegate = self
        //self.sampleScroll.minimumZoomScale = 0.1
        //self.sampleScroll.maximumZoomScale = 0.4
        //self.sampleScroll.zoomScale = 1.0

        self.setZoomScale()

        self.setGestureRecognizer()
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    //自定义缩放
    func setZoomScale()
    {
        let imageViewSize = self.imageView.bounds.size
        let scrollViewSize = self.sampleScroll.bounds.size
        let widScale  = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        self.sampleScroll.minimumZoomScale = min(widScale, heightScale)
        self.sampleScroll.zoomScale = 1.0
    }

    override func viewWillLayoutSubviews() {
        self.setZoomScale()
    }

    //MARK:双击缩放
    func setGestureRecognizer() -> Void {
        let doubleTap = UITapGestureRecognizer(target: self , action: #selector(self.hundleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        self.sampleScroll.addGestureRecognizer(doubleTap)
    }

    func hundleDoubleTap(sender : UITapGestureRecognizer) -> Void {
        if self.sampleScroll.zoomScale > self.sampleScroll.minimumZoomScale {
            self.sampleScroll.setZoomScale(self.sampleScroll.minimumZoomScale, animated: true)
        }else {
            self.sampleScroll.setZoomScale(self.sampleScroll.maximumZoomScale, animated: true)
        }

    }
    //MARK: delegate
    /*
     scrollView双手滑动缩放的时候调用词方法
     我们一首先图片缩放来看下他的用法
     当我们双手滑动缩小的时候 我们希望图片缩小，当双手滑动张开的时候 我们希望图片放大
     图片最小能缩小到原始的一半 最大能放到到原图的两倍
     首先设置图片最大最小倍数
     */
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    //滑动scrollView过程中只要图片在动就一直执行
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        print("滑动中")
    }

    //手指拖拽完成离开图片执行此方法
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("didEndDragging")
        print("停止拖拽")
    }

    //图片停止移动还有执行此方法（如果是快速滑动的话手指一开之后图片还会继续滑动一点距离，注意他和手指离开两个代理方法的区别）
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("didEndDecelerating")
        print("停止滑动")
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
