//
//  Models.swift
//  BankAppTableView
//
//  Created by Minaya Yagubova on 03.02.23.
//

import Foundation
struct Category {
    let name: String
    let icon: String
}

struct Profile: Codable{
    let fullname     : String
    let email        : String
    let birthdate    : String
    let password     : String
    let phoneNumber  : String
    var cards        : [Card]?
    
}

struct Card: Codable {
    let number  : String
    let name    : String
    let expr    : String
    let cvv     : String
}

