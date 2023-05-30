//
//  WelcomeViewModel.swift
//  StateDataManagemet
//
//  Created by Htet Myat Tun on 30/05/2023.
//

import Foundation
import UIKit

class WelcomeViewModel {
    var viewCotroller: UIViewController?
    
    func goToFormView() {
        let view = FormModule().build()
        view.modalPresentationStyle = .fullScreen
        viewCotroller?.present(view, animated: true)
    }
}
