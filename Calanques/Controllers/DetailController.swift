//
//  DetailController.swift
//  Calanques
//
//  Created by Gary Luypaert on 05/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var imgDetail: imgCircle!
    @IBOutlet weak var descDetail: UITextView!
    
    var calanqueReceveid: Calanque?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let calanque = calanqueReceveid else { return }
        
        imgDetail.image = calanque.image
        
        let mutable = NSMutableAttributedString(string: calanque.name + "\n",
                                                attributes: [
                                                    .font: UIFont.boldSystemFont(ofSize: 20),
                                                    .foregroundColor: UIColor.red
                                                ])
        mutable.append(NSAttributedString(string: calanque.desc,
                                          attributes: [
                                            .font: UIFont.systemFont(ofSize: 17),
                                            .foregroundColor: UIColor.darkGray
                                          ]))
        descDetail.attributedText = mutable
        // Do any additional setup after loading the view.
    }

}
