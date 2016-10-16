//
//  Utility.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 16/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

class Utility: NSObject {
    static let sharedInstance = Utility()
    
    public func getUserName() -> String{
        
        if let name = UserDefaults.standard.value(forKey: "UserName") {
            return name as! String
        }
        return "Player"
    }
    
    public func setUserName(username: String){
        UserDefaults.standard.set(username, forKey: "UserName")
    }
}
