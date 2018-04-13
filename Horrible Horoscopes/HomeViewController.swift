//
//  HomeViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever on 4/11/18.
//  Copyright © 2018 Sawyer Clever. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var zodiacCollectionView: UICollectionView!
    
    let sign = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio",
                "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    let signImage: [UIImage] = [
        UIImage(named: "aries")!,
        UIImage(named: "taurus")!,
        UIImage(named: "gemini")!,
        UIImage(named: "cancer")!,
        UIImage(named: "leo")!,
        UIImage(named: "virgo")!,
        UIImage(named: "libra")!,
        UIImage(named: "scorpio")!,
        UIImage(named: "sagittarius")!,
        UIImage(named: "capricorn")!,
        UIImage(named: "aquarius")!,
        UIImage(named: "pisces")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zodiacCollectionView.dataSource = self
        zodiacCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sign.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.signLabel.text = sign[indexPath.item]
        cell.signImageView.image = signImage[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
        selectedCell?.layer.borderColor = UIColor.red.cgColor
        selectedCell?.layer.borderWidth = 2
        
        let selection = sign[indexPath.item]
        print(selection)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectedCell = collectionView.cellForItem(at: indexPath)
        deselectedCell?.layer.borderColor = UIColor.white.cgColor
        deselectedCell?.layer.borderWidth = 0
    }
}
