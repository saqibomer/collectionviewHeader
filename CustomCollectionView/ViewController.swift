//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Saqib Omer on 11/16/15.
//  Copyright © 2015 KaboomLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    //Properties
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARL: - CollectionView DataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return 9
    }
   
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("customCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.counterLabel.text = "\(indexPath.item)"
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView =
            collectionView.dequeueReusableSupplementaryViewOfKind(kind,withReuseIdentifier: "headerCell", forIndexPath: indexPath) as! HeaderCollectionViewCell
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    //MARK: -  CollectionViewFlow Delegate
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: myCollectionView.frame.width / 3, height:  myCollectionView.frame.width / 3)
    }
}

