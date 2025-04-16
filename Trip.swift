//
//  Trip.swift
//  StyleCast
//
//  Created by Franczeska Ferariza on 4/14/25.
//

import Foundation

import Foundation

struct Trip: Codable {
    let city: String
    let type: String
    let weather: String
    let outfit: String
    var isPinned: Bool = false 
}
