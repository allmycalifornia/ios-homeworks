//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Борис Кравченко on 22.02.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photosTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let goToGalleryButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.backgroundImage(for: .normal)
        //button.largeContentImage = UIImage(systemName: "arrow.right")
        button.addTarget(PhotosTableViewCell.self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonPressed() {
        //let photosVC = PhotosViewController()
        //navigationController?.pushViewController(photosVC, animated: true)
    }
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "gallery01")
        return imageView
    }()
    
    private let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "gallery02")
        return imageView
    }()
    
    private let imageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "gallery03")
        return imageView
    }()
    
    private let imageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "gallery04")
        return imageView
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [photosTextLabel, goToGalleryButton, imageView1, imageView2, imageView3, imageView4].forEach { contentView.addSubview($0) }
        contentView.layer.borderWidth = 0
        let inset: CGFloat = 12
        let insetImage: CGFloat = 8
        
        NSLayoutConstraint.activate([
            photosTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            photosTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            photosTextLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            goToGalleryButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            goToGalleryButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            goToGalleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: inset),
            
            imageView1.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
            imageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            imageView1.trailingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: -insetImage),
            imageView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: inset),
            
            
            imageView2.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.leadingAnchor, constant: insetImage),
            imageView2.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -insetImage / 2),
            imageView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: inset),
            
            imageView3.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
            imageView3.leadingAnchor.constraint(equalTo: centerXAnchor, constant: insetImage / 2),
            imageView3.trailingAnchor.constraint(equalTo: imageView4.leadingAnchor, constant: insetImage),
            imageView3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: inset),
            
            imageView4.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.leadingAnchor, constant: insetImage),
            imageView4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: inset),
            imageView4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: inset),
        ])
    }
}
