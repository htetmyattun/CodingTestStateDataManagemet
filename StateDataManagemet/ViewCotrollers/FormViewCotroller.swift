//
//  FormViewCotroller.swift
//  StateDataManagemet
//
//  Created by Htet Myat Tun on 30/05/2023.
//

import Foundation
import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtNationality: UITextField!
    @IBOutlet weak var txtCoutryOfResidence: UITextField!
    @IBOutlet weak var txtMobileNoCoutryCode: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var btnCreateAccount: UIButton!
    
    @IBOutlet weak var uvBackground: UIView!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
    private var gradientLayer: CAGradientLayer?
    var viewModel = FormViewModel()
    var gender = "Female"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        self.hideKeyboardWhenTappedAround()
    }
    
    func prepareUI() {
        let startColor = UIColor(red: 7.0/255.0, green: 180.0/255.0, blue: 197.0/255.0, alpha: 1.0)
        let endColor = UIColor(red: 50.0/255.0, green: 114.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer?.locations = [0.0, 1.0]
        gradientLayer?.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer?.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer?.frame = CGRect(x: 0, y: 0, width: btnCreateAccount.bounds.width, height: btnCreateAccount.bounds.height)
        gradientLayer?.cornerRadius = 10
        
        btnCreateAccount.layer.insertSublayer(gradientLayer!, at: 0)
        btnCreateAccount.layer.cornerRadius = 10
        
        uvBackground.layer.cornerRadius = 20
        
        btnFemale.layer.cornerRadius = 20
        btnFemale.layer.borderWidth = 1
        btnFemale.layer.borderColor = UIColor.systemBlue.cgColor
        btnFemale.backgroundColor = UIColor.white
        btnFemale.titleLabel?.font = UIFont(name: "Chivo-Bold", size: 15)
        
        btnMale.backgroundColor = UIColor.clear
        btnMale.titleLabel?.font = UIFont(name: "Chivo-Regular", size: 15)
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnCreateAccount(_ sender: UIButton) {
        let data = FormData(firstName: txtFirstName.text ?? "", lastName: txtLastName.text ?? "", email: txtEmail.text ?? "", dob: txtDOB.text ?? "", gender: gender, nationality: txtNationality.text ?? "", countryOfResidence: txtCoutryOfResidence.text ?? "", mobileNoCoutryCode: txtMobileNoCoutryCode.text ?? "", mobileNo: txtMobileNo.text ?? "")
        var passed: Bool?
        var reason: String?
        (passed,reason) = viewModel.validate(data: data)
        
        if passed ?? false {
            // call fuction to create account
            let alert = UIAlertController(title: "Account Created!", message: "Your account is successfully created.", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                self.dismiss(animated: true)
            })
            alert.addAction(ok)
            
            viewModel.saveData(data: data)
            
            self.present(alert, animated: true, completion: nil)
            
        } else {
            let dialogMessage = UIAlertController(title: "Error", message: reason, preferredStyle: .alert)
            dialogMessage.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnToggle(_ sender: UIButton) {
        if sender == btnMale {
            btnMale.layer.cornerRadius = 20
            btnMale.layer.borderWidth = 1
            btnMale.layer.borderColor = UIColor.systemBlue.cgColor
            btnMale.backgroundColor = UIColor.white
            btnMale.titleLabel?.font = UIFont(name: "Chivo-Bold", size: 15)
            
            btnFemale.backgroundColor = UIColor.clear
            btnFemale.titleLabel?.font = UIFont(name: "Chivo-Regular", size: 15)
            btnFemale.layer.borderWidth = 0
            
            gender = "Male"
        } else {
            btnFemale.layer.cornerRadius = 20
            btnFemale.layer.borderWidth = 1
            btnFemale.layer.borderColor = UIColor.systemBlue.cgColor
            btnFemale.backgroundColor = UIColor.white
            btnFemale.titleLabel?.font = UIFont(name: "Chivo-Bold", size: 15)
            
            btnMale.backgroundColor = UIColor.clear
            btnMale.titleLabel?.font = UIFont(name: "Chivo-Regular", size: 15)
            btnMale.layer.borderWidth = 0
            
            gender = "Female"
        }
    }
}
