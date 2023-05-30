//
//  WelcomeViewCotroller.swift
//  StateDataManagemet
//
//  Created by Htet Myat Tun on 30/05/2023.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnCreateNewAccount: UIButton!
    private var gradientLayer: CAGradientLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
    
    private func prepareUI() {
        btnFacebook.layer.cornerRadius = 10
        btnEmail.layer.cornerRadius = 10
        btnCreateNewAccount.layer.cornerRadius = 10
        
        let startColor = UIColor(red: 7.0/255.0, green: 180.0/255.0, blue: 197.0/255.0, alpha: 1.0)
        let endColor = UIColor(red: 50.0/255.0, green: 114.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer?.locations = [0.0, 1.0]
        gradientLayer?.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer?.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer?.frame = CGRect(x: 0, y: 0, width: btnCreateNewAccount.bounds.width + 20.0, height: btnCreateNewAccount.bounds.height)
        gradientLayer?.cornerRadius = 10
                
        // Insert the gradient layer below any other layers
        btnCreateNewAccount.layer.insertSublayer(gradientLayer!, at: 0)
    }
}
