//
//  DetailViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 14.03.2023.
//

import UIKit

//protocol DetailDelegate: AnyObject {
//    func changeText(_ text: String, indexPath: IndexPath)
//}

final class DetailPostViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    private let detailPostView = DetailPostView()
    private let post: Post
    private let indexPath: IndexPath
    
   // weak var delegate: DetailDelegate?
    
    init(
        post: Post,
        indexPath: IndexPath
    ) {
        self.post = post
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = detailPostView
        detailPostView.setupCell(post: post)
        //detailPostView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
            detailPostView.scrollView.contentInset.bottom = keybordSize.height
            detailPostView.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        detailPostView.scrollView.contentInset = .zero
        detailPostView.scrollView.verticalScrollIndicatorInsets = .zero
        
    }
}

//extension DetailPostViewController: MyCustomViewDelegate {
//    func changeText(_ text: String) {
//        delegate?.changeText(text, indexPath: indexPath)
//    }
//}

