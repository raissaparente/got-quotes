//
//  remoteQuote.swift
//  gotQuotes
//
//  Created by Raissa Parente on 04/10/23.
//

import Foundation

struct Quote: Decodable {
    let sentence: String
    let character: Character
    
    struct Character: Decodable {
        let name:String
    }
}
