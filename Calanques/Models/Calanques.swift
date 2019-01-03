//
//  Calanques.swift
//  Calanques
//
//  Created by Gary Luypaert on 03/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit
import CoreLocation

class Calanque {
    private var _name: String
    private var _desc: String
    private var _longitude: Double
    private var _latitude: Double
    private var _image: UIImage?
    
    var name: String {
        return _name
    }
    
    var desc: String {
        return _desc
    }
    
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: _latitude, longitude: _longitude)
    }
    
    var image: UIImage? {
        return _image
    }
    
    init(name: String, desc: String, image: UIImage?, latitude: Double, longitude: Double  ) {
        _name = name
        _desc = desc
        _image = image
        _latitude = latitude
        _longitude = longitude
        

    }
    
}
