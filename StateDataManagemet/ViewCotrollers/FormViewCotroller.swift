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
    @IBOutlet weak var swtGender: UISwitch!
    
    private var gradientLayer: CAGradientLayer?
    var viewModel = FormViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
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
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnCreateAccount(_ sender: UIButton) {
        let data = FormData(firstName: txtFirstName.text ?? "", lastName: txtLastName.text ?? "", email: txtEmail.text ?? "", dob: txtDOB.text ?? "", gender: swtGender.title ?? "", nationality: txtNationality.text ?? "", countryOfResidence: txtCoutryOfResidence.text ?? "", mobileNoCoutryCode: txtMobileNoCoutryCode.text ?? "", mobileNo: txtMobileNo.text ?? "")
        var passed: Bool?
        var reason: String?
        (passed,reason) = viewModel.validate(data: data)
        
        if passed ?? false {
            
        } else {
            let dialogMessage = UIAlertController(title: "Error", message: reason, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                // Actions
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
}
