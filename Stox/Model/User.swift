//
//  User.swift
//  Stox
//
//  Created by Devika Raja on 04/07/20.
//  Copyright © 2020 Devika Raja. All rights reserved.
//

import Foundation
struct User{
    let id:Int
    let userName:String
    let firstName:String
    let lastName:String
    let email:String
    var phoneNo:String?
    let userStock = Set<UserStock>()
    
    mutating func setPhoneNo(_ number:String){
        self.phoneNo = number
    }
    
}
