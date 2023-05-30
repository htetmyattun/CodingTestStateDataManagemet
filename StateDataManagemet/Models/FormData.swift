//
//  FormData.swift
//  StateDataManagemet
//
//  Created by Htet Myat Tun on 30/05/2023.
//

import Foundation

class FormData {
    var firstName: String
    var lastName: String
    var email: String
    var dob: String
    var gender: String
    var nationality: String
    var countryOfResidence: String
    var mobileNoCoutryCode: String
    var mobileNo: String
    
    init(firstName: String, lastName: String, email: String, dob: String, gender: String, nationality: String, countryOfResidence: String, mobileNoCoutryCode: String, mobileNo: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dob = dob
        self.gender = gender
        self.nationality = nationality
        self.countryOfResidence = countryOfResidence
        self.mobileNoCoutryCode = mobileNoCoutryCode
        self.mobileNo = mobileNo
    }
}
