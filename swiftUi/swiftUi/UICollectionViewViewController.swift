//
//  UICollectionViewViewController.swift
//  swiftUi
//
//  Created by developer_k on 16/6/23.
//  Copyright © 2016年 developer_k. All rights reserved.
//

import UIKit


class PhotoCollectionViewCell: UICollectionViewCell {



   lazy var photoImageview : UIImageView = {
        let tempImageView  = UIImageView()
        tempImageView.clipsToBounds = true
        return tempImageView
    }()

    func setCornerRadious(radious : Int) {
        self.photoImageview.layer.cornerRadius = CGFloat(radious)
    }

    override func layoutSubviews() {
        self.photoImageview.frame = self.bounds
        self.contentView.addSubview(self.photoImageview)
    }
}

class UICollectionViewViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var collectionView : UICollectionView?
    var stepper : UIStepper?
    var  photoCornerRadious : Int = 0

    var photoList = [ "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6" ]



    override func viewDidLoad() {
        super.viewDidLoad()



        if self.respondsToSelector(Selector("edgesForExtendedLayout")) {
            self.edgesForExtendedLayout = UIRectEdge.None
        }

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.itemSize = CGSizeMake(73, 73)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.headerReferenceSize = CGSizeMake(20, 20)
        layout.footerReferenceSize = CGSizeMake(20, 20)

        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, self.view.frame.size.width, 300), collectionViewLayout: layout)
        //self.collectionView!.frame = self.view.bounds
        self.collectionView!.registerClass(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.collectionView!)

        self.stepper = UIStepper(frame: CGRectMake(0,300,100,40))
        self.stepper?.value = 0
        self.stepper?.minimumValue = 0
        self.stepper?.maximumValue = 100
        self.stepper?.stepValue = 5
        self.view.addSubview(self.stepper!)
        self.stepper?.addTarget(self, action: #selector(self.radiusStepperAction(_:)), forControlEvents: .ValueChanged)

        // Do any additional setup after loading the view.
    }

    func radiusStepperAction(sender : UIStepper) -> () {
        self.photoCornerRadious = Int(sender.value)
        self.collectionView?.reloadData()
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoList.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! PhotoCollectionViewCell
        cell.setCornerRadious(self.photoCornerRadious)
        cell.photoImageview.image = UIImage(named: self.photoList[indexPath.row])
        return cell


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
