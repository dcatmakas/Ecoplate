//
//  KeyboardHeightHelper.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 24.06.2024.
//

import SwiftUI
import Combine

final class KeyboardHeightHelper: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0

    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        let keyboardWillShowPublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect }
            .map { $0.height }
        
        let keyboardWillHidePublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        Publishers.Merge(keyboardWillShowPublisher, keyboardWillHidePublisher)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardHeight, on: self)
            .store(in: &cancellableSet)
    }
}
