//
//  UISegmentControlViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/20.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit


/*
 初始化方法：传入的数组可以是字符串也可以是UIImage对象的图片数组

 - (instancetype)initWithItems:(NSArray *)items;

 设置控件风格：

 @property(nonatomic) UISegmentedControlStyle segmentedControlStyle

 注意：这个属性已经废弃，不再起任何作用，它的枚举如下：

 typedef NS_ENUM(NSInteger, UISegmentedControlStyle) {
 UISegmentedControlStylePlain,     // large plain
 UISegmentedControlStyleBordered,  // large bordered
 UISegmentedControlStyleBar,       // small button/nav bar style. tintable
 UISegmentedControlStyleBezeled,   // DEPRECATED. Do not use this style.
 } NS_DEPRECATED_IOS(2_0, 7_0, "The segmentedControlStyle property no longer has any effect");
 设置是否保持选中状态：

 @property(nonatomic,getter=isMomentary) BOOL momentary;

 注意：如果设置为YES，点击结束后，将不保持选中状态，默认为NO

 获取标签个数：(只读)

 @property(nonatomic,readonly) NSUInteger numberOfSegments;

 设置标签宽度是否随内容自适应：

 @property(nonatomic) BOOL apportionsSegmentWidthsByContent；

 注意：如果设置为NO，则所有标签宽度一致，为最大宽度。

 插入文字标签在index位置：

 - (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated

 插入图片标签在index位置

 - (void)insertSegmentWithImage:(UIImage *)image  atIndex:(NSUInteger)segment animated:(BOOL)animated

 根据索引删除标签

 - (void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated;

 删除所有标签

 - (void)removeAllSegments;

 重设标签标题

 - (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)segment;

 获取标签标题

 - (NSString *)titleForSegmentAtIndex:(NSUInteger)segment;

 设置标签图片

 - (void)setImage:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment;

 获取标签图片

 - (UIImage *)imageForSegmentAtIndex:(NSUInteger)segment;

 注意：标题的图片只能设置一个

 根据索引设置相应标签宽度

 - (void)setWidth:(CGFloat)width forSegmentAtIndex:(NSUInteger)segment;
 注意：如果设置为0.0，则为自适应，默认为此设置。

 根据索引获取标签宽度

 - (CGFloat)widthForSegmentAtIndex:(NSUInteger)segment;

 设置标签内容的偏移量

 - (void)setContentOffset:(CGSize)offset forSegmentAtIndex:(NSUInteger)segment;

 注意：这个偏移量指的是标签的文字或者图片

 根据索引获取变标签内容的偏移量

 - (CGSize)contentOffsetForSegmentAtIndex:(NSUInteger)segment;

 根据所以设置标签是否有效(默认有效)

 - (void)setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment;

 根据索引获取当前标签是否有效

 - (BOOL)isEnabledForSegmentAtIndex:(NSUInteger)segment;

 设置和获取当前选中的标签索引

 @property(nonatomic) NSInteger selectedSegmentIndex;

 设置标签风格颜色

 @property(nonatomic,retain) UIColor *tintColor;

 注意：这个风格颜色会影响标签的文字和图片

 设置特定状态下segment的背景图案

 - (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics

 注意：UIBarMetrics是一个枚举，如下：(defaulf风格会充满背景)

 typedef NS_ENUM(NSInteger, UIBarMetrics) {
 UIBarMetricsDefault,
 UIBarMetricsCompact,
 UIBarMetricsDefaultPrompt = 101, // Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar
 UIBarMetricsCompactPrompt,

 UIBarMetricsLandscapePhone NS_ENUM_DEPRECATED_IOS(5_0, 8_0, "Use UIBarMetricsCompact instead") = UIBarMetricsCompact,
 UIBarMetricsLandscapePhonePrompt NS_ENUM_DEPRECATED_IOS(7_0, 8_0, "Use UIBarMetricsCompactPrompt") = UIBarMetricsCompactPrompt,
 };
 获取背景图案

 - (UIImage *)backgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics

 设置标签之间分割线的图案

 - (void)setDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics

 获取标签之间分割线的图案

 - (UIImage *)dividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics

 通过Attribute字符串属性字典设置标签标题

 - (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state

 获取Attribute字符串属性字典

 - (NSDictionary *)titleTextAttributesForState:(UIControlState)state

 自行设置标签内容的偏移量

 - (void)setContentPositionAdjustment:(UIOffset)adjustment forSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics

 注意：UIOffset为偏移量，这个结构体中又两个浮点数，分别表示水平量和竖直量；UISegmentedControlSegment类型参数是一个枚举，如下：

 typedef NS_ENUM(NSInteger, UISegmentedControlSegment) {
 UISegmentedControlSegmentAny = 0,//所有标签都受影响
 UISegmentedControlSegmentLeft = 1,  //只有左边部分受到影响
 UISegmentedControlSegmentCenter = 2, // 只有中间部分受到影响
 UISegmentedControlSegmentRight = 3,  // 只有右边部分受到影响
 UISegmentedControlSegmentAlone = 4,  // 在只有一个标签的时候生效
 };
 获取自定义偏移量

 - (UIOffset)contentPositionAdjustmentForSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics

 添加点击事件


 */
class UISegmentControlViewController: UIViewController {

    lazy var sampleSegment : UISegmentedControl = {

        let itemsArray  = ["1","2",UIImage(named : "home")!] as [AnyObject]
        let tempSegment  = UISegmentedControl.init(items: itemsArray)

        tempSegment.momentary = false  //点击回退效果

//        tempSegment.numberOfSegments    get
        tempSegment.addTarget(self, action: #selector(UISegmentControlViewController.tempSegmentClicked(_:)), forControlEvents: .ValueChanged)


        /*
         设置标签宽度是否随内容自适应：
         注意：如果设置为NO，则所有标签宽度一致，为最大宽度。
         */
        tempSegment.apportionsSegmentWidthsByContent = false

        tempSegment.insertSegmentWithTitle("insert1", atIndex: 3, animated: true)
        tempSegment.insertSegmentWithImage(UIImage(named:"home"), atIndex: 3, animated: true)
        tempSegment.removeSegmentAtIndex(3, animated: true)
//        tempSegment.removeAllSegments()

        tempSegment.setTitle("setTitle", forSegmentAtIndex: 0)
//        tempSegment.setImage("home", forSegmentAtIndex: 11)

        tempSegment.tintColor = UIColor.redColor()

        tempSegment.setBackgroundImage(UIImage(named:"banner"), forState: .Normal, barMetrics: .Default)

        return tempSegment

    }()

    //MARK: action
    func tempSegmentClicked(sender : UISegmentedControl) -> () {
         print("sampleSegment: \(self.sampleSegment.numberOfSegments)" )
        let segmentSelect = sender.selectedSegmentIndex
        switch segmentSelect {
        case 0:
            print("0")
             sender.insertSegmentWithTitle("insert1", atIndex: 3, animated: true)
        case 1:
            print("1")
            sender.insertSegmentWithImage(UIImage(named:"home"), atIndex: 3, animated: true)
        case 2:
            print("2")
            sender.removeSegmentAtIndex(3, animated: true)
            let image  = sender.imageForSegmentAtIndex(2)
            print(image)
        case 3:
            sender.isEnabledForSegmentAtIndex(3) ? print("true") : print("false")
        default:
            print("default")
        }





    }


    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sampleSegment.frame = CGRectMake(10, 100, self.view.bounds.size.width-20, 40)
        self.view.addSubview(self.sampleSegment)


        



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
