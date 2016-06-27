//
//  LabelViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/17.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

/*
    Swift IBDesignable/IBInspectable
 https://segmentfault.com/a/1190000003703119
 */

//MARK：UILabel 设置内边距
class UILabelPadding : UILabel {

    private var padding = UIEdgeInsetsZero

    @IBInspectable
    var paddingLeft: CGFloat {
        get { return padding.left }
        set { padding.left = newValue }
    }

    @IBInspectable
    var paddingRight: CGFloat {
        get { return padding.right }
        set { padding.right = newValue }
    }

    @IBInspectable
    var paddingTop: CGFloat {
        get { return padding.top }
        set { padding.top = newValue }
    }

    @IBInspectable
    var paddingBottom: CGFloat {
        get { return padding.bottom }
        set { padding.bottom = newValue }
    }

    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, padding))
    }

    override func textRectForBounds(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insets = self.padding
        var rect = super.textRectForBounds(UIEdgeInsetsInsetRect(bounds, insets), limitedToNumberOfLines: numberOfLines)
        rect.origin.x    -= insets.left
        rect.origin.y    -= insets.top
        rect.size.width  += (insets.left + insets.right)
        rect.size.height += (insets.top + insets.bottom)
        return rect
    }
    
}








class LabelViewController: UIViewController {

    @IBInspectable

    //懒加载
    lazy var label : UILabel = {

        // let  只创建一次  不能使用var
        let tempLabel = UILabel()
        tempLabel.tag = 0 //tag
        tempLabel.backgroundColor = UIColor.darkGrayColor()
        //字体
        tempLabel.font = UIFont.systemFontOfSize(15.0)
        //字体颜色
        tempLabel.textColor = UIColor.redColor()
        tempLabel.shadowColor = UIColor.grayColor() //灰色阴影
        tempLabel.shadowOffset = CGSizeMake(-5, 5)  //阴影的偏移
        tempLabel.textAlignment = .Center           //文本对齐方式

        /*
         UILineBreakModeWordWrap = 0,    以空格为边界，保留整个单词
         UILineBreakModeCharacterWrap,   保留整个字符
         UILineBreakModeClip,            到边界为止
         UILineBreakModeHeadTruncation,  省略开始，以……代替
         UILineBreakModeTailTruncation,  省略结尾，以……代替
         UILineBreakModeMiddleTruncation,省略中间，以……代替，多行时作用于最后一行
         
         case ByWordWrapping // Wrap at word boundaries, default
         case ByCharWrapping // Wrap at character boundaries
         case ByClipping // Simply clip
         case ByTruncatingHead // Truncate at head of line: "...wxyz"
         case ByTruncatingTail // Truncate at tail of line: "abcd..."
         case ByTruncatingMiddle // Truncate middle of line:  "ab...yz"

         */
        tempLabel.lineBreakMode = .ByTruncatingTail


        /*
         //当adjustsFontSizeToFitWidth=YES时候，如果文本font要缩小时
         //baselineAdjustment这个值控制文本的基线位置，只有文本行数为1是有效
         */
        tempLabel.adjustsFontSizeToFitWidth = false  //当文字超出标签宽度时，自动调整文字大小，使其不被截断

        //文本高亮
        tempLabel.highlighted = true
        tempLabel.highlightedTextColor = UIColor.blueColor()

        //是否能与用户交互
        tempLabel.userInteractionEnabled = false

        //文本是否可变
        tempLabel.enabled = true

        //文本最多行数，为0时没有最大行数限制
        tempLabel.numberOfLines = 0 //显示行数


        /*
         case AlignBaselines   默认值文本最上端于label中线对齐
         case AlignCenters      文本中线于label中线对齐
         case None              文本最低端与label中线对齐
         */
        tempLabel.baselineAdjustment = .AlignBaselines

        /*
         OS6.0之前：minimumFontSize
         iOS6.0之后：minimumScaleFactor
         最小字体大小，当字体小于这个最小值时无效，显示此属性值
         */
        tempLabel.minimumScaleFactor = 10.0


        /*
         这个属性是用来设置多行label的最大宽度的
         当自动布局的时候约束这个label的时候这个属性会起作用
         在自动布局添加约束中，若文本超过了指定的最大宽度的时候 文本会另起一行 从而增加了label的高度
         */
        tempLabel.allowsDefaultTighteningForTruncation = false
        tempLabel.preferredMaxLayoutWidth = 100




        /*
         UILabel经常用到的方法
         - (void)sizeToFit
         - (CGSize)sizeThatFits:(CGSize)size
         解释如下：
         sizeToFit会自动调用sizeThatFits方法；

         sizeToFit不应该在子类中被重写，应该重写sizeThatFits

         sizeThatFits传入的参数是receiver当前的size，返回一个适合的size

         sizeToFit可以被手动直接调用

         sizeToFit和sizeThatFits方法都没有递归，对subviews也不负责，只负责自己



         NSString  对label有用的方法，如下：
         Computing Metrics for a Single Line of Text（针对单行的文字）
         – sizeWithFont:
         – sizeWithFont:forWidth:lineBreakMode:
         – sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode:
         Computing Metrics for Multiple Lines of Text（针对多行的文字，这个常用）
         – sizeWithFont:constrainedToSize:
         – sizeWithFont:constrainedToSize:lineBreakMode:

         我们经常会根据label里面的文字的多少，来计算label的尺寸，例如做微博的cell的时候
         我们经常会用“sizeWithFont:constrainedToSize:”来获得size，以此改变label的尺寸
         其实，这个可以用label 的“sizeToFit”来替代，当label调用“sizeToFit”时，会自动改变label本身的尺寸，所以这个方法是没有返回值的。如果对“”的计算不满意，可以继承UILabel来自定义label，同时重写label的“sizeThatFits:”方法，这样自定义label的“sizeToFit”行为就会被改变。

         UILabel有两个接口是专门用来重写，以此来自定义自己的label，如下：
         Drawing and Positioning Overrides
         – textRectForBounds:limitedToNumberOfLines:
         – drawTextInRect:
         上面这两个方法不是用来调用的，只适合被UILabel子类重写
         
         – textRectForBounds:limitedToNumberOfLines:
         用来改变label里面文字展示窗口的大小，你可以自己根据文字的多少，来计算窗口的大小
         
         – drawTextInRect:
         在绘图环境实现文字的绘制，这个方法里面里面已经配置好了绘图环境，使用方式如下：
         1.直接获得当前绘图上下文，
         2.接着更改绘图环境设置
         3.在就是调用super方法来绘制即可
         */


        //FIXME:打开不做操作会崩溃  动态宽高
        /*
        var attributes = [NSFontAttributeName: tempLabel.font]
        var option = NSStringDrawingOptions.UsesLineFragmentOrigin

        var  stringTest : NSString = NSString(CString: (tempLabel.text?.cStringUsingEncoding(NSUTF8StringEncoding))!, encoding: NSUTF8StringEncoding)!
        stringTest.boundingRectWithSize(CGSizeMake(CGFloat.max, CGFloat.max), options: option, attributes: attributes, context: nil)
         */


        return tempLabel
    }()


    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK:mark
        /*
        宏定义 查看  taget－> Run Script
         http://blog.csdn.net/lengshengren/article/details/49129043
         */

        //FIXME: 有bug
        //TODO: 今天睡觉
        self.label.text = "a;slkdjfl;asjd;lfjasl;kdjflkasjdfks;dfjlka;sdjf结尾"
        self.label.frame = CGRectMake(100, 100, 100, 40)
        self.view.addSubview(self.label)

        //扩展
        /*
         label 点击事件
         */

        self.touchLabel()

        /*
        设置内边距
         */
        self.padLabel()




        // Do any additional setup after loading the view.
    }

    //MARK: - 点击
    func touchLabel() -> () {
        let touchLable : UILabel = UILabel.init(frame: CGRectMake(100, 150, 100, 40))
        touchLable.text = "点我"
        touchLable.textColor = UIColor.grayColor()
        touchLable.textAlignment = .Center
        touchLable.backgroundColor = UIColor.redColor()


        //touchLable.highlighted = true
        touchLable.highlightedTextColor = UIColor.blueColor()


        //打开交互
        touchLable.userInteractionEnabled = true
        //添加点击事件
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(LabelViewController.tapLabel(_:)))
        touchLable.addGestureRecognizer(tap)
        self.view.addSubview(touchLable)

    }

    func tapLabel(sender : UITapGestureRecognizer) -> () {
        print("点我")
    }


    //MARK: 内边距
    func padLabel() -> () {
        let  pad : UILabelPadding = UILabelPadding()
        pad.textRectForBounds(CGRectMake(100, 200, 40, 20), limitedToNumberOfLines: 2)
        pad.text = "asd;lkjfa;lskdjfl;kajs;dlfjl;as结尾"
        pad.frame = CGRectMake(100, 200, 100, 40)
        pad.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(pad)

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
