//
//  InfoViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 04.02.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let alertButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Кнопка", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray6
        setupAlertButton()
        
    }
    
    private func setupAlertButton() {
        view.addSubview(alertButton)
        alertButton.center = view.center
        alertButton.addTarget(self, action: #selector(tapAlertAction), for: .touchUpInside)
    
    }
    
    @objc private func tapAlertAction() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Title", style: .default) { (action) in
            print("Сообщение в консоль")
            }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            present(alert, animated: true)
        }



}
