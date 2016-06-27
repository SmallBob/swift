//
//  IndexedTableViewViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/24.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit

class IndexedTableViewViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var fruitList : [String] = Array()

    var fruitListGrouped = NSDictionary() as! [String : [String]]

    var sectionTitleList = [String]()





    lazy var tableVew :UITableView = {

        //plain section会顶到顶部   grouped  整体随动    效果有区别
        let tempTableView = UITableView(frame: CGRectZero, style: .Plain)

//        let tempTableView = UITableView(frame: CGRectZero, style: .Grouped)

        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()
    


    // MARK: - Utility functions

    private func createData() {

        // fill up data
        self.fruitList  = [
            "Strawberry",
            "Apple", "Apricot", "Avocado",
            "Banana", "Blueberry",
            "Coconut", "Custard Apple",
            "Dates", "Durian",
            "Fig",
            "Gooseberry", "Grapes", "Guava",
            "Jackfruit",
            "Lemon", "Lime", "Longan", "Lychee",
            "Mango",
            "Orange",
            "Papaya", "Pear", "Pineapple", "Pomogranate",
            "Raspberry",
            "Watermelon"
        ]

        // sort the array  (Important)
        self.fruitList = self.fruitList.sort()
    }

    private func splitDataInToSection() {

        var sectionTitle : String = ""

        for i in 0..<self.fruitList.count {
            //拿到 单词
            let currentRecord = self.fruitList[i]

            //取出 单词 首字母  做索引
            let firstChar = currentRecord[currentRecord.startIndex]

            //单字符 －> 字符串
            let firstCharString = "\(firstChar)"

            //判定 进入的单词 section  是否与上一个 单词首字母是否相同
            if firstCharString != sectionTitle {
                sectionTitle = firstCharString
                self.fruitListGrouped[sectionTitle] = [String]()
                self.sectionTitleList.append(sectionTitle)
            }

            //同一首字母单词 加入同一字典中
            self.fruitListGrouped[firstCharString]?.append(currentRecord)



        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.respondsToSelector(Selector("edgesForExtendedLayout")) {
            //self.edgesForExtendedLayout = .None
        }

        self.createData()
        self.splitDataInToSection()

        self.tableVew.frame = self.view.bounds
        self.view.addSubview(self.tableVew)

        self.tableVew.registerClass(UITableViewCell.self, forCellReuseIdentifier: "mycell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:tabelViewDelegate
    // return the number of sections

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fruitListGrouped.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = self.sectionTitleList[section]
        let fruits = self.fruitListGrouped[sectionTitle]

        return fruits!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("mycell" )

        let sectionTitle = self.sectionTitleList[indexPath.section]

        let fruits = self.fruitListGrouped[sectionTitle]

        cell!.textLabel?.text = fruits![indexPath.row]
        return cell!
    }



    // return section header title  区标题
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitleList[section]
    }


    // return title list for section index  索引头
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.sectionTitleList
    }
    // return section for given section index title
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
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
