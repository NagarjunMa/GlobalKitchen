//
//  User.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 10/04/24.
//

import Foundation


struct User : Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}



extension User {
    static var MOCK_User = User(id: NSUUID().uuidString, fullName: "Kobe Bryant", email: "test@gmail.com")
}
