//
//  ControllerWithMap.swift
//  Calanques
//
//  Created by Gary Luypaert on 03/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit
import MapKit

class ControllerWithMap: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            break
        }
    }
    
    @IBAction func getPosition(_ sender: Any) {
    }
    
    

}
