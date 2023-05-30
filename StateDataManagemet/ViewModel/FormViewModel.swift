//
//  FormViewModel.swift
//  StateDataManagemet
//
//  Created by Htet Myat Tun on 30/05/2023.
//

import Foundation
import UIKit
import CryptoSwift

class FormViewModel {
    func validate(data: FormData) -> (Bool, String) {
        var passed = false
        var reason = "Something isn't right."
        
        (passed, reason) = isEmpty(firstName: data.firstName, lastName: data.lastName, email: data.email, dob: data.dob, natioality: data.nationality, coutryOfResidance: data.countryOfResidence)
        
        if !data.mobileNo.isEmpty && passed {
            (passed, reason) = simCheck(simNo: data.mobileNo)
        }
        
        if passed {
            (passed, reason) = emailCheck(email: data.email)
        }
        
        if passed {
            (passed, reason) = dobCheck(dob: data.dob)
        }
        
        return (passed, reason)
    }
    
    func isEmpty(firstName: String, lastName: String, email: String, dob: String, natioality: String, coutryOfResidance: String) -> (Bool, String) {
        var passed = true
        var reason = ""
        
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty || dob.isEmpty || natioality.isEmpty || coutryOfResidance.isEmpty {
            passed = false
            reason = "Required fields cannot be empty."
        }
        
        return (passed, reason)
    }
    
    func simCheck(simNo: String) -> (Bool, String) {
        var passed = true
        var reason = ""
        if simNo.count > 9 || simNo.count < 7 {
            passed = false
            reason = "Sim number should be between 7 and 9"
        }
        return (passed, reason)
    }
    
    func numberCheck(num: String) -> (Bool, String) {
        var passed = true
        var reason = ""
        
        if num.isNumber && Int(num)! > 0 {
            passed = true
            reason = ""
        } else {
            passed = false
            reason = "Please type valid amount to transfer."
        }
        
        return (passed, reason)
    }
    
    func emailCheck(email: String) -> (Bool, String) {
        
        var passed = true
        var reason = ""
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        if !email.isEmpty {
            if !emailTest.evaluate(with: email) {
                passed = false
                reason = "Please enter valid email address."
            }
        }
        
        return (passed, reason)
    }
    
    func dobCheck(dob: String) -> (Bool, String) {
        var passed = true
        var reason = ""
        
        var dobArray = dob.split(separator: "/")
        for i in 0..<dobArray.count {
            if !(String(dobArray[i]).isNumber) {
                passed = false
                reason = "Please enter valid date of birth."
            }
        }
        
        if passed {
            if !(Int(dobArray[0]) ?? 0 <= 31) {
                passed = false
                reason = "Please enter a valid day."
            }
            if !(Int(dobArray[1]) ?? 0 <= 12 ) {
                passed = false
                reason = "Please enter a valid month."
            }
            if !((Int(dobArray[2]) ?? 0 > 1923) && (Int(dobArray[2]) ?? 0 < 2013) ) {
                passed = false
                reason = "Please enter a valid year."
            }
        }
        
        return (passed, reason)
    }
    
    func saveData(data: FormData) {
        // usually use encryption for password, device indentifier, currecy related data and private info
        if let base64cipher = try? Rabbit(key: "1234567890123456"),
           let base64 = try? data.email.encryptToBase64(cipher: base64cipher) {
            print("encrypted base64: \(base64)")
            
            let decrypted = try? base64.decryptBase64ToString(cipher: base64cipher)
            print("decrypted base64: \(decrypted!)")
            
            //save data on local storage
        }
    }
}

extension String {
    
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

