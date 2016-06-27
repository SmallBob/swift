//
//  UITableViewViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/23.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    var person = Person(){

        willSet {
            print("willset")
            person.name = person.name! + "+"
        }

        didSet {
            print("didset")
            person.name = person.name! + "_"
        }
    }

    lazy var label : UILabel = {
        let tempLabel = UILabel()
        return tempLabel
    }()

    override func layoutSubviews() {
        self.label.frame = CGRectMake(0, 0, 200, 20)
        self.label.textColor = UIColor.redColor()
        self.label.text = self.person.name! + String(self.person.age)
        self.contentView.addSubview(self.label)
    }

}

class Person: NSObject {
    var name : String? = ""
    var age : Int = 0

    override init() {

    }

    init(name : String? , age : Int) {
        self.name = name
        self.age = age
    }
}

class UITableViewViewController: UIViewController , UITableViewDataSource , UITableViewDelegate  {

    var dataArray : NSMutableArray? = nil

    var tableView : UITableView?


    override func viewDidLoad() {
        super.viewDidLoad()
        //self.dataArray = ["1","2","3","4","5","k","k","u","uu","1","2","3","4","5","k","k","u","uu"];

        let pera = Person(name: "lewei", age: 19)
        let perb = Person(name: "zhangwu", age: 22)

        self.dataArray = [pera,perb]


        self.tableView = UITableView(frame: CGRectMake(0, 100, self.view.bounds.size.width, 400), style: .Grouped)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.tableView!)

        self.tableView?.registerClass(CustomCell.self, forCellReuseIdentifier: "customcell")

        self.automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.min
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dataArray!.count
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{

        let cellIdentifier = "customcell"
        var cell : CustomCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CustomCell

        if cell == nil {
            cell = CustomCell(style: .Default, reuseIdentifier: cellIdentifier)
        }


        let per : Person = self.dataArray![indexPath.row] as! Person

        cell.person = per




        return cell!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

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
