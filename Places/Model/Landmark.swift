//
//  Landmark.swift
//  Places
//
//  Created by Muhamed Alkhatib on 11/09/2020.
//

import Foundation
import RealmSwift
class Landmark: Object {
    @objc dynamic var name: String=""
    @objc dynamic var desc: String=""
    @objc dynamic var lat: Double=0.0
    @objc dynamic var lon: Double=0.0
    @objc dynamic var time: Date=Date()
}
