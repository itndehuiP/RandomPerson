//
//  DiversityQuoteGenerator.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation

/**
 Loads diversity quotes
 */
struct DiversityQuoteGenerator {
    private let quotes: [String]
    
    init() {
        var quotes: [String] = []
        if quotes.load(plistName: "DiversityQuotes") {
            self.quotes = quotes
        } else {
            self.quotes = []
        }
    }
    
    var quote: String? {
        guard quotes.count > 0 else {
            return nil
        }
        let randomIndex = Int.random(in: 0..<quotes.count)
        return quotes[randomIndex]
    }
    
}
