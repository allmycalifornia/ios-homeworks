//
//  FeedViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 01.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    
    private var model:[[Any]]  = [["Photos"], Post.makePost()]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = .zero
        tableView.sectionHeaderHeight = .zero
        tableView.sectionFooterHeight = .zero
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.identifier )
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier )
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        layout()
    }
    
    private func layout() {
            view.addSubview(tableView)
            tableView.tableHeaderView = FeedTableHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 90))
            tableView.backgroundColor = .systemGray4
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: StoriesCell = tableView.dequeueReusableCell(withIdentifier: StoriesCell.identifier, for: indexPath) as! StoriesCell
            return cell

        default:
            if let post: Post = model[indexPath.section][indexPath.row] as? Post {
                let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                cell.setupCell(post: post)
                return cell
            } else { return UITableViewCell() }
            
        }
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? FeedTableHeaderView() : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && editingStyle == .delete {
            model[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}




//        private let viewPostButton: UIButton = {
//            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//            button.setTitle("Посмотреть пост", for: .normal)
//            button.backgroundColor = .systemBlue
//            return button
//        }()
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            view.backgroundColor = .white
//            setupButton()
//            makeBarItem()
//        }
//
//
//        // установка кнопки по центру экрана
//        private func setupButton() {
//            view.addSubview(viewPostButton)
//            viewPostButton.center = view.center
//            viewPostButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
//        }
//
//        // верхняя кнопка "Дальше"
//        private func makeBarItem() {
//            let barItem = UIBarButtonItem(title: "Профиль", style: .plain, target: self, action: #selector(barItemAction))
//            navigationItem.rightBarButtonItem = barItem
//        }
//
//        // переход на экран "Профиль"
//        @objc private func barItemAction() {
//            let profileVC = ProfileViewController()
//            profileVC.title = "Профиль"
//            profileVC.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(profileVC, animated: true)
//        }
//
//
//
//        // метод действия кнопки
//        @objc private func tapAction() {
//            let postVC = PostViewController()
//            //postVC.titlePost = post.title
//            //present(postVC, animated: true)
//            navigationController?.pushViewController(postVC, animated: true)
//        }
//
//
//    
//}


