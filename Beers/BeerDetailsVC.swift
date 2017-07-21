//
//  BeerDetailsVC.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/21/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

class BeerDetailsVC: UIViewController {
    // Outlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var tagLineLbl: UILabel!
    @IBOutlet var abvLbl: UILabel!
    @IBOutlet var ibuLbl: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    
    // Properties
    var beer: Beer?
    
    //Load methods
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let beer = beer else{
            let alert        = UIAlertController(title: "Ops!", message: "Nenh", preferredStyle: .alert)
            let returnAction = UIAlertAction(title: "Ok!", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            })
            alert.addAction(returnAction)
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        navigationItem.title = beer.name
            
        photoImageView.kf.setImage(with: beer.imageURL)
        nameLbl.text             = beer.name
        tagLineLbl.text          = beer.tagline
        abvLbl.text              = "ABV \(beer.abv)%"
        ibuLbl.text              = "IBU \(beer.ibu)"
        descriptionTextView.text = beer.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
