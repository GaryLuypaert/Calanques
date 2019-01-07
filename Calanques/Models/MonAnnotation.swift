//
//  MonAnnotation.swift
//  Calanques
//
//  Created by Gary Luypaert on 06/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var calanque: Calanque
    var title: String?
    
    init(_ calanque: Calanque) {
        self.calanque = calanque
        coordinate = self.calanque.coordinates
        title = self.calanque.name
    }
}
