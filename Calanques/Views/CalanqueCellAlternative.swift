//
//  CalanqueCellAlternative.swift
//  Calanques
//
//  Created by Gary Luypaert on 05/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit

class CalanqueCellAlternative: UITableViewCell {
    
    @IBOutlet weak var imgCalanque: UIImageView!
    @IBOutlet weak var nameCalanque: UILabel!
    
    var calanque: Calanque? {
        didSet {
            if calanque != nil {
                imgCalanque.image = calanque!.image
                nameCalanque.text = calanque!.name
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
