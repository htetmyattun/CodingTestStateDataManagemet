//
//  WelcomeModule.swift
//  StateDataManagemet
//
//  Created by Htet Myat Tun on 30/05/2023.
//

import Foundation
import UIKit

class WelcomeModule {
    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        return view
    }
}
