//
//  PopUpViewController.swift
//  Places
//
//  Created by Muhamed Alkhatib on 11/09/2020.
//

import UIKit
import RealmSwift
class PopUpViewController: UIViewController {
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descTextView: UITextView!
    
    
    @IBAction func saveConfirmed(_ sender: UIButton) {
        
        print ("Saving")
        dismiss(animated: true, completion: nil)

        
        let newLandmark=Landmark()
        newLandmark.name=nameTextField.text!
        newLandmark.desc=descTextView.text!
        newLandmark.lat=Places.shared.userLat
        newLandmark.lon=Places.shared.userLon

        
        try! realm.write {
            realm.add(newLandmark)
        }
        
        //Places.shared.landmarks.append(newLandmark)

        
        
        
    }
    
}
