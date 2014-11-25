//
//  Encryption.swift
//  Scytale
//
//  Created by Michael Campos on 10/24/14.
//  Copyright (c) 2014 Michael Campos. All rights reserved.
//

import Foundation

class Encryption {
    var insertedMessage:String
    let cipher:Int
    
    init(insertedMessage:String, cipher:Int){
        self.insertedMessage = insertedMessage
        self.cipher = cipher
    }
    
    func makeNewMessage() -> String {
        let filledMessage = fillEmptySpace(&insertedMessage, cipher: self.cipher)       //fill empty spaces in message to produce an even distribution of message to each row
        let plain = Array(filledMessage)        //Convert message string into an array of characters
        let numberOfRows = countElements(plain)/cipher     //returns the number of rows to be used
        var encoded:[Character] = []       //Create empty array
        
        //Insert scrambled message in array
        for(var i = 0; i < numberOfRows; i++) {
            for(var j = 0; j < cipher; j++){
                encoded.append(plain[i+j*numberOfRows])
            }
        }
        
        //Remove excess spacing at the end of the arrayw
        while(encoded[encoded.count - 1] == " ") {
            encoded.removeLast()
        }
        
        var encodedString = ""
        
        //Insert encoded array into newString string
        for eachCharacter in encoded {
            encodedString += String(eachCharacter)
        }
        
        return encodedString
    }
    
    func fillEmptySpace(inout updatedMessage:String, cipher:Int) -> String {
        var remainder = countElements(updatedMessage)%cipher
        
        while(remainder != 0) {
            updatedMessage += " "
            remainder = countElements(updatedMessage)%cipher
        }
        
        return updatedMessage
    }
}