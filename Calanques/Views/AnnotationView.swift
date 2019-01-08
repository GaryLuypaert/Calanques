//
//  AnnotationView.swift
//  Calanques
//
//  Created by Gary Luypaert on 07/01/2019.
//  Copyright © 2019 Gary Luypaert. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {
    
    var controller: ControllerWithMap?
    
    init(controller: ControllerWithMap ,annotation: MKAnnotation?, reuseIdentifier: String?) {
        self.controller = controller
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupAnnotation()
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupAnnotation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAnnotation()
    }
    
    func setupAnnotation() {
        image = UIImage(named: "placeholder")
        canShowCallout = true
        leftCalloutAccessoryView = setupLeftBtn()
        rightCalloutAccessoryView = setupRightBtn()
        detailCalloutAccessoryView = setupCenterBtn()
    }
    
    func setupLeftBtn() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "distance"), for: .normal)
        button.addTarget(self, action: #selector(distance), for: .touchUpInside)
        return button
    }
    
    func setupRightBtn() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "detail"), for: .normal)
        button.addTarget(self, action: #selector(detail), for: .touchUpInside)
        return button
    }
    
    func setupCenterBtn() -> UIView? {
        guard let anno = annotation as? MonAnnotation else { return nil }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 125))
        
        view.translatesAutoresizingMaskIntoConstraints = true
        view.widthAnchor.constraint(equalToConstant: 125).isActive = true
        view.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = anno.calanque.image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        return view
    }
    
    @objc func distance() {
        guard let anno = annotation as? MonAnnotation else { return }
        let placemark = MKPlacemark(coordinate: anno.coordinate)
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        let map = MKMapItem(placemark: placemark)
        map.openInMaps(launchOptions: options)
        
    }
    
    @objc func detail() {
        guard let anno = annotation as? MonAnnotation else { return }
        
        controller?.toDetail(calanque: anno.calanque)
        
        // Get infos by NotificationCenter
//        NotificationCenter.default.post(name: Notification.Name("detail"), object: anno.calanque)
    }
}
