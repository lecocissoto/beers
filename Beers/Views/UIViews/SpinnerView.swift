//
//  spinnerView.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/21/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

@IBDesignable class SpinnerView: UIView {

    @IBInspectable var borderRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = borderRadius
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }


}
