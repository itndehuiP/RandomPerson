//
//  PersonResponseInfo.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation

struct PersonResponseInfo: Codable {
    let seed: String?
    let results: Int?
    let page: Int?
    let version: String?
}
