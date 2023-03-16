//
//  DetailViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 14.03.2023.
//

import UIKit

final class DetailPostViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    private let detailPostView = DetailPostView()
    private let post: Post
    private let indexPath: IndexPath
    
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
    }
}
