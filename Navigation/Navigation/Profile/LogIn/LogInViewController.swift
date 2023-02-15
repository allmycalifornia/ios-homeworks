//
//  LogInViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 14.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    private let notification = NotificationCenter.default
    private let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginButton()
    }
    
    // метод добавления действия на кнопку Log In
    private func setupLoginButton() {
        loginView.loginButton.addTarget(self, action: #selector(tapLoginAction), for: .touchUpInside)
    }
    
    // метод перехода на страницу профиля
    @objc private func tapLoginAction() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginView.scrollView.contentInset.bottom = keybordSize.height
            loginView.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        loginView.scrollView.contentInset = .zero
        loginView.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
}
