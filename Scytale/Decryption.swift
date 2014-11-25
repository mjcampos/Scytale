//
//  Decryption.swift
//  Scytale
//
//  Created by Michael Campos on 10/24/14.
//  Copyright (c) 2014 Michael Campos. All rights reserved.
//

import Foundation

class Decryption {
    var insertedMessage:String
    let cipher:Int
    
    init(insertedMessage:String, cipher:Int){
        self.insertedMessage = insertedMessage
        self.cipher = cipher
    }
    
    func makeNewMessage() -> String {
        let filledMessage = fillEmptySpace(&insertedMessage, cipher: self.cipher)       //fill empty spaces in message to produce an even distribution of message to each row
        let plain = Array(filledMessage)        //Convert message string into an array of characters
        let numberOfRows = countElements(plain)/cipher      //returns the number of rows to be used
        var decoded:[Character] = []        //Create empty array
        
        //inserting scrambled message into array
        for(var i = 0; i < cipher; i++) {
            for(var j = 0; j < numberOfRows; j++){
                decoded.append(plain[i + j * cipher])
            }
        }
        
        //Remove excess spacing at the end of the array
        while(decoded[decoded.count - 1] == " ") {
            decoded.removeLast()
        }
        
        var decodedString = ""
        
        //Insert decoded array into newString string
        for eachCharacter in decoded {
            decodedString += String(eachCharacter)
        }
        
        return decodedString
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