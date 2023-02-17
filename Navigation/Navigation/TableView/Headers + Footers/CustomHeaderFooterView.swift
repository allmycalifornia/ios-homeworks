//
//  CustomHeaderFooterView.swift
//  Navigation
//
//  Created by Борис Кравченко on 17.02.2023.
//

import UIKit

final class CustomHeaderFooterView: UIView {
    
    private let headerTextLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader(text: String) {
        headerTextLabel.text = text
    }
    
    private func layout() {
        addSubview(headerTextLabel)
        
        let inset: CGFloat = 16
        NSLayoutConstraint.activate([
            headerTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            headerTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            headerTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            headerTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
        
    }
}
