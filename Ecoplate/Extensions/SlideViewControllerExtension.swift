//
//  SlideViewControllerExtension.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 1.05.2024.
//

import SwiftUI

class AppState {
    static let shared = AppState()

    var swipeEnabled = true
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if AppState.shared.swipeEnabled {
            return viewControllers.count > 1
        }
        return false
    }
    
}
