//
//  ExerciseCollectionViewController.swift
//  FitChallenge
//
//  Created by Anton Makarov on 05.03.17.
//  Copyright © 2017 Anton Makarov. All rights reserved.
//

import UIKit


class ExerciseCollectionViewController: UICollectionViewController {
    
    let reuseIdentifier = "exerciseCell"
    var categories = [ExerciseCategory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let catArray = ["food" /*some categories*/]
        
        loadCategories(allCategories: catArray as NSArray)
    }
    
    
    func loadCategories(allCategories: NSArray) {
        for category in allCategories {
            let newCategory = ExerciseCategory(name: (category as? String)!, photos: (category as? String)!)
            self.categories.append(newCategory)
        }
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ExerciseCollectionCell
        
        let category = categories[indexPath.row]
        
        cell.categoryLabel.text = (category.name).capitalized
        cell.categoryImage.image = UIImage(named: "\(category.image).jpg")
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 180);
    }
}