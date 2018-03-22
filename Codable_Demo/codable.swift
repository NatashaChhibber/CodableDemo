//
//  codable.swift
//  Codable_Demo
//
//  Created by Appinventiv on 22/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

struct codableStruct: Codable{
    
    let actors:[actors]?
}

struct actors : Codable {
    
    let name: String?
    let dob: String?
    let country: String?
    let imageUrl: URL?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case dob
        case country
        case imageUrl = "image"
        
}

}
