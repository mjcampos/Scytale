//
//  ViewController.swift
//  Scytale
//
//  Created by Michael Campos on 10/24/14.
//  Copyright (c) 2014 Michael Campos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var message: UITextView!
    @IBOutlet var cipherIndex: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        message.text = "Welcome to Scytale. Got a message you want to hide or reveal? Write it down here, enter your cipher, and watch it transform!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Options for buttons
    @IBAction func Encode(sender: AnyObject) {
        var messageInString:String = message.text
        let cipherInIntForm:Int? = cipherIndex.text.toInt()
        
        if(cipherInIntForm != nil) {
            let encrypt = Encryption(insertedMessage: messageInString, cipher: cipherInIntForm!)
            message.text = encrypt.makeNewMessage()
        }
        else {
            return;
        }
    }
    
    @IBAction func Decode(sender: AnyObject) {
        var messageInString:String = message.text
        let cipherInIntForm:Int? = cipherIndex.text.toInt()
        
        if(cipherInIntForm != nil) {
            let decrypt = Decryption(insertedMessage: messageInString, cipher: cipherInIntForm!)
            message.text = decrypt.makeNewMessage()
        }
        else {
            return;
        }
    }
    
    @IBAction func Clear(sender: AnyObject) {
        message.text = ""
        cipherIndex.text = ""
    }
}
