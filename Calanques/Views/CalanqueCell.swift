//
//  CalanqueCell.swift
//  Calanques
//
//  Created by Gary Luypaert on 05/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit

class CalanqueCell: UITableViewCell {

//    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgCalanque: imgCircle!
    @IBOutlet weak var labelCalanque: UILabel!
    
    var calanque: Calanque!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ calanque: Calanque) {
        self.calanque = calanque
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = UIColor.lightGray
        imgCalanque.image = self.calanque.image
        labelCalanque.text = self.calanque.name
    }

}
