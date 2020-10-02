//
//  PlacesViewController.swift
//  Places
//
//  Created by Muhamed Alkhatib on 11/09/2020.
//

import UIKit
import RealmSwift
import CoreLocation
import MapKit
class PlacesViewController: UIViewController {

    let realm = try! Realm()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
        
        print (Places.shared.landmarks)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let landmarks = realm.objects(Landmark.self)
        Places.shared.landmarks=landmarks
        
        
        tableView.dataSource=self
        tableView.delegate=self
        tableView.register(UINib(nibName: "PlaceCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")

        
    }
    

    @IBOutlet weak var tableView: UITableView!
    

}

extension PlacesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Places.shared.landmarks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        
        cell.name.text=Places.shared.landmarks[indexPath.row].name
        cell.desc.text=Places.shared.landmarks[indexPath.row].desc
        
        cell.time.text=DateFormatter.localizedString(from: Places.shared.landmarks[indexPath.row].time, dateStyle: .short, timeStyle: .short)
            

        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let landmark = Places.shared.landmarks[indexPath.row]
        
        try! realm.write {
            realm.delete(landmark)
        }
        tableView.reloadData()
        
        
        
    }
    
    
}

extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let latitude:CLLocationDegrees =  Places.shared.landmarks[indexPath.row].lat
        let longitude:CLLocationDegrees =  Places.shared.landmarks[indexPath.row].lon
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        //            mapItem.name = "\(self.venueName)"
        mapItem.openInMaps(launchOptions: options)
        
        
        
        
        
    }
}
