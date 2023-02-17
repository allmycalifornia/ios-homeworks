//
//  TableViewController.swift
//  Navigation
//
//  Created by Борис Кравченко on 17.02.2023.
//

import UIKit

final class TableViewController: UIViewController {
    
    private var post: [[Posts]] = Posts.makePost()
    private var isNeedUpdate: Bool = false
    private var indexPathToUpdate = IndexPath()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: CustomCellTableViewCell.identifier)
//        tableView.register(CustomHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: CustomHeaderFooterView.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard isNeedUpdate else { return }
        tableView.reloadRows(at: [indexPathToUpdate], with: .bottom)
        isNeedUpdate = false
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        post.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        post[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//        var context: UIListContentConfiguration = cell.defaultContentConfiguration()
//        context.text = "Секция = \(indexPath.section) , ячейка = \(indexPath.row)"
//        cell.contentConfiguration = context
//        return cell
        
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "reuseID")
//        cell.imageView?.image = UIImage(named: "Mercedes Benz")
//        cell.textLabel?.text = "Value 1 cell"
//        cell.detailTextLabel?.text = "Detail Text"
//        cell.accessoryView = nil
//        cell.accessoryType = .detailButton
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellTableViewCell.identifier, for: indexPath) as! CustomCellTableViewCell
        cell.setupCell(feed: post[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let hedaer = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderFooterView.identifier)
        let header = CustomHeaderFooterView()
        header.setupHeader(text: "Это хедер секции \(section)")
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = CustomHeaderFooterView()
        footer.setupHeader(text: "Это футер секции \(section)")
        footer.backgroundColor = .systemGray2
        return footer
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section % 2 == 0 ? 100 : 50
//        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = ProfileViewController(post: post[indexPath.section][indexPath.row], indexPath: indexPath)
//        detailVC.delegate = self
//        navigationController?.pushViewController(detailVC, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            post[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension TableViewController: DetailDelegate {
    func changeText(_ text: String, indexPath: IndexPath) {
        post[indexPath.section][indexPath.row].description = text
        isNeedUpdate = true
        indexPathToUpdate = indexPath
    }
}
