//
//  ControllerWithMap.swift
//  Calanques
//
//  Created by Gary Luypaert on 03/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit
import MapKit

class ControllerWithMap: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var calanques: [Calanque] = CalanqueCollection().all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addAnnotations()
    }
    
    func addAnnotations() {
        for calanque in calanques {
            
            // Basic Annotation
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = calanque.coordinates
//            annotation.title = calanque.name
//            mapView.addAnnotation(annotation)
            
            let annotation = MonAnnotation(calanque)
            mapView.addAnnotation(annotation)
        }
    }
    
    func toDetail(calanque: Calanque) {
        performSegue(withIdentifier: "Detail", sender: calanque)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            if let controller = segue.destination as? DetailController {
                controller.calanqueReceveid = sender as? Calanque
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "reuseID"
            
        // Verify not position of user
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        if let anno = annotation as? MonAnnotation {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            if annotationView == nil {
                
//                annotationView = MKAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
//                annotationView?.image = UIImage(named: "placeholder")
//                annotationView?.canShowCallout = true
                
                // Override
//                annotationView = AnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
                
                annotationView = AnnotationView(controller: self, annotation: anno, reuseIdentifier: reuseIdentifier)
                
                return annotationView
            } else {
                return annotationView
            }
        }
        return nil
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
