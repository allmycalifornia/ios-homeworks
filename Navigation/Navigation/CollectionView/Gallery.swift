//
//  Gallery.swift
//  Navigation
//
//  Created by Борис Кравченко on 22.02.2023.
//

import UIKit

struct Source {
    
    static func makeGallery() -> [Gallery] {
        [
            .init(id: 1, imageName: "gallery01"),
            .init(id: 2, imageName: "gallery02"),
            .init(id: 3, imageName: "gallery03"),
            .init(id: 4, imageName: "gallery04"),
            .init(id: 5, imageName: "gallery05"),
            .init(id: 6, imageName: "gallery06"),
            .init(id: 7, imageName: "gallery07"),
            .init(id: 8, imageName: "gallery08"),
            .init(id: 9, imageName: "gallery09"),
            .init(id: 10, imageName: "gallery10"),
            .init(id: 11, imageName: "gallery11"),
            .init(id: 12, imageName: "gallery12"),
            .init(id: 13, imageName: "gallery13"),
            .init(id: 14, imageName: "gallery14"),
            .init(id: 15, imageName: "gallery15"),
            .init(id: 16, imageName: "gallery16"),
            .init(id: 17, imageName: "gallery17"),
            .init(id: 18, imageName: "gallery18"),
            .init(id: 19, imageName: "gallery19"),
            .init(id: 20, imageName: "gallery20")
        ]
    }

    static func photos(with count: Int) -> [Gallery] {
        let gallery = makeGallery()
        guard count <= gallery.count else { return gallery }
        return Array(gallery.shuffled())
    }

}

struct Gallery {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Gallery]
}
