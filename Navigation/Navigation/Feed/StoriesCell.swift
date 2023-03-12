//
//  StoriesCell.swift
//  Navigation
//
//  Created by Борис Кравченко on 12.03.2023.
//

import UIKit

final class StoriesCell: UITableViewCell {
    
    let user1TextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mando"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    let user2TextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jina"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    let user3TextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Grogue"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    let user4TextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Episode 5"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    let user5TextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Season 1"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
        
        let imageView1: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 38
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.systemBlue.cgColor
            imageView.image = UIImage(named: "gallery01")
            return imageView
        }()
        
        let imageView2: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 38
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.systemBlue.cgColor
            imageView.image = UIImage(named: "gallery02")
            return imageView
        }()
        
        let imageView3: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 38
            imageView.image = UIImage(named: "gallery03")
            return imageView
        }()
        
        let imageView4: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 38
            imageView.image = UIImage(named: "gallery04")
            return imageView
        }()
        
    let imageView5: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 38
        imageView.image = UIImage(named: "gallery05")
        return imageView
    }()
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            layout()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func layout() {
            [imageView1, imageView2, imageView3, imageView4, imageView5, user1TextLabel, user2TextLabel, user3TextLabel, user4TextLabel, user5TextLabel].forEach { contentView.addSubview($0) }
            contentView.layer.borderWidth = 0
            let inset: CGFloat = 12
            let insetImage: CGFloat = 8
            let imageHeight: CGFloat = 75
            
            NSLayoutConstraint.activate([
                imageView1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
                imageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insetImage),
                imageView1.heightAnchor.constraint(equalToConstant: imageHeight),
                imageView1.widthAnchor.constraint(equalToConstant: imageHeight),
                
                user1TextLabel.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: insetImage),
                user1TextLabel.centerXAnchor.constraint(equalTo: imageView1.centerXAnchor),
                
                imageView2.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
                imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: insetImage),
                imageView2.heightAnchor.constraint(equalToConstant: imageHeight),
                imageView2.widthAnchor.constraint(equalToConstant: imageHeight),
                
                user2TextLabel.topAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: insetImage),
                user2TextLabel.centerXAnchor.constraint(equalTo: imageView2.centerXAnchor),
                
                imageView3.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
                imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: insetImage),
                imageView3.heightAnchor.constraint(equalToConstant: imageHeight),
                imageView3.widthAnchor.constraint(equalToConstant: imageHeight),
                
                user3TextLabel.topAnchor.constraint(equalTo: imageView3.bottomAnchor, constant: insetImage),
                user3TextLabel.centerXAnchor.constraint(equalTo: imageView3.centerXAnchor),
                
                imageView4.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
                imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor, constant: insetImage),
                imageView4.heightAnchor.constraint(equalToConstant: imageHeight),
                imageView4.widthAnchor.constraint(equalToConstant: imageHeight),
                
                user4TextLabel.topAnchor.constraint(equalTo: imageView4.bottomAnchor, constant: insetImage),
                user4TextLabel.centerXAnchor.constraint(equalTo: imageView4.centerXAnchor),
                
                imageView5.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
                imageView5.leadingAnchor.constraint(equalTo: imageView4.trailingAnchor, constant: insetImage),
                imageView5.heightAnchor.constraint(equalToConstant: imageHeight),
                imageView5.widthAnchor.constraint(equalToConstant: imageHeight),
                
                user5TextLabel.topAnchor.constraint(equalTo: imageView5.bottomAnchor, constant: insetImage),
                user5TextLabel.centerXAnchor.constraint(equalTo: imageView5.centerXAnchor)
            ])
        }
}


