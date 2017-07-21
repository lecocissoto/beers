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
    
    @IBOutlet var spinnerView: SpinnerView!
    
    // Properties
    var isLoading      = false {
        didSet{
            self.toggleSpinner(isVisible: self.isLoading)
        }
    }
    
    var beers: [Beer]  = [] {
        didSet{ self.collectionView?.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestForBeers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func requestForBeers(){
        isLoading = true
        API(env: .production, version: .v2).beerService.beers(success: { (msg, beers) in
            self.beers = beers
            self.isLoading = false
            
        }) { (error, message) in
            self.isLoading = false
            
            let alert        = UIAlertController(title: "Ops!", message: message, preferredStyle: .alert)
            let action       = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let refresAction = UIAlertAction(title: "Refresh", style: .default, handler: { (action) in
                self.requestForBeers()
            })
            
            alert.addAction(action)
            alert.addAction(refresAction)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "beerDetailsSegue"{
            let nextVC = segue.destination as! BeerDetailsVC
            let indexPath = collectionView!.indexPathsForSelectedItems![0]
            
            nextVC.beer = beers[indexPath.row]
        }
    }
    
    // MARK: Spinner Helper
    // TODO: Extract this to a ViewControllerExtension ;)
    func displaySpinner(){
        spinnerView.layer.opacity = 0.0
        view.addSubview(spinnerView)
        spinnerView.center = view.center
                                    
        UIView.animate(withDuration: 0.20) {
            self.spinnerView.layer.opacity = 0.5
        }
    }
    
    func hideSpinner(){
        UIView.animate(withDuration: 0.20, animations: {
            self.spinnerView.layer.opacity = 1
        }) { (completion) in
            self.spinnerView.removeFromSuperview()
        }
    }
    
    func toggleSpinner(isVisible: Bool){
        (isVisible) ? displaySpinner() : hideSpinner()
    }
}

// MARK: UICollectionViewDataSource

extension BeerListCVC {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BeerCVCell
        cell.configureCell(with: beers[indexPath.row])
        
        return cell
    }
}

//MARK: Scrollview Flow Layout
extension BeerListCVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellDivider: CGFloat =  2.0
        
        let size = CGSize(width: self.view.frame.width / 2 - 11, height: view.frame.size.height / cellDivider + 5)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
}


