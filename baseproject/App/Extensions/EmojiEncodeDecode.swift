//
//  Currency.swift
//  baseproject
//
//  Created by sehosseini on 01/03/19.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation

//-------------------------------------
//MARK: - encoding and decoding Emoji extension
//-------------------------------------
extension String {
    func toEncoding() -> String {
        return EmojiEncodeDecode.encode(input: self)
    }
    
    func toDecoding() -> String {
        return EmojiEncodeDecode.decode(input: self)!
    }
}


//-------------------------------------
//MARK: - encode and decode Emoji func
//-------------------------------------
internal class EmojiEncodeDecode {
    
    class func encode(input: String) -> String {
        let data = input.data(using: .nonLossyASCII, allowLossyConversion: true)!
        return String(data: data, encoding: .utf8)!
    }
    
    class func decode(input: String) -> String? {
        let data = input.data(using: .utf8)!
        return String(data: data, encoding: .nonLossyASCII)
    }
}
