//
//  MapViewController.swift
//  Places
//
//  Created by Muhamed Alkhatib on 11/09/2020.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate=self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    

    
    @IBOutlet weak var map: MKMapView!
    
}


extension MapViewController: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location=locations.last
        //print (location)
        
        Places.shared.userLat=location?.coordinate.latitude ?? 0.0
        Places.shared.userLon=location?.coordinate.longitude ?? 0.0
        
        let center = CLLocationCoordinate2D (latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        map.setRegion(region, animated: true)
        map.showsUserLocation=true
        
        
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}
