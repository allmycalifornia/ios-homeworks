//
//  PostViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 01.02.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
//    private let backButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//        button.setTitle("Назад", for: .normal)
//        button.backgroundColor = .black
//        return button
//    }()
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
       // setupButton()
    }
    
//    private func setupButton() {
//        view.addSubview(backButton)
//        backButton.center = view.center
//        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
//    }
//
//    @objc private func backAction() {
//        let alert = UIAlertController(title: "Перейти назад", message: "Вы точно хотите выйти?", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Выйти", style: .default) { _ in
//            self.navigationController?.popViewController(animated: true)
//        }
//        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
//        alert.addAction(cancelAction)
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
    }
}

