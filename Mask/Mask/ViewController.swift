//
//  ViewController.swift
//  Mask
//
//  Created by Edward Price on 27/07/2017.
//  Copyright © 2017 Edward Price. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var _overlay: UIView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Map"
        view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let mapView = MKMapView()
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 60
        let mapWidth:CGFloat = view.frame.size.width
        let mapHeight:CGFloat = view.frame.size.height
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        let coordinate = CLLocationCoordinate2D(latitude: 51.5085, longitude: -0.1249)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.centerCoordinate = coordinate
        
        mapView.center = view.center
        
        let span = MKCoordinateSpanMake(0.0275, 0.0275)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        view.addSubview(mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        _overlay = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        _overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        view.addSubview(_overlay)
        
        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2), radius: 80, startAngle: 0.0, endAngle: 2 * 3.14, clockwise: false)
        path.addRect(CGRect(x: 0, y: 0, width: _overlay.frame.width, height: _overlay.frame.height))
        
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.path = path;
        maskLayer.fillRule = kCAFillRuleEvenOdd
        
        // Release the path since it's not covered by ARC.
        _overlay.layer.mask = maskLayer
        _overlay.clipsToBounds = true
        
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont.init(name: "NunitoSans-ExtraBold", size: 10)
        button.isEnabled = true
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Dismiss mask view", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        button.addTarget(self, action: #selector(handleDismissMaskVIew), for: .touchUpInside)
        
        _overlay.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    
    func handleDismissMaskVIew()
    {
        _overlay.removeFromSuperview()
    }

}

