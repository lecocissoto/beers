//
//  BeerListCVC.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/21/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

private let reuseIdentifier = String(describing: BeerCVCell.self)

class BeerListCVC: UICollectionViewController {
    
    var beers: [Beer]  = [] {
        didSet{ self.collectionView?.reloadData() }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API(env: .production, version: .v2).beerService.beers(success: { (msg, beers) in
            self.beers = beers
            
        }) { (error, message) in
            let alert = UIAlertController(title: "Ops!", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return beers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BeerCVCell
        cell.configureCell(with: beers[indexPath.row])
    
        return cell
    }
    
}
