//
//  imgCircle.swift
//  Calanques
//
//  Created by Gary Luypaert on 05/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit

class imgCircle: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }

}
