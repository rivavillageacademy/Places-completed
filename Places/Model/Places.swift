//
//  Places.swift
//  Places
//
//  Created by Muhamed Alkhatib on 11/09/2020.
//

import Foundation
import RealmSwift
class Places {
    static let shared = Places()
    var landmarks: Results<Landmark>!
    var userLat: Double=0.0
    var userLon: Double=0.0
    
    private init() {}
}
