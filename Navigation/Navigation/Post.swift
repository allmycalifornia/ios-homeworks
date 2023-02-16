//
//  Post.swift
//  Navigation
//
//  Created by Борис Кравченко on 02.02.2023.
//

import UIKit

struct Posts {
    let author: String
    let image: UIImage
    var description: String
    var likes: Int
    var views: Int
    
    static func makePost() -> [[Posts]] {
        var post = [[Posts]]()
        var section = [Posts]()
        section.append(Posts(author: "Лариса Мосенко", image: UIImage(named: "TomHolland")!, description: "Том Холланд вернётся к роли Человека-паука в MCU", likes: Int.random(in: 300...500), views: Int.random(in: 700...1999)))
        section.append(Posts(author: "Юрий Лущинский", image: UIImage(named: "Dragon")!, description: "«Как приручить дракона» станет полнометражным фильмом", likes: Int.random(in: 300...500), views: Int.random(in: 700...1999)))
        section.append(Posts(author: "Лариса Мосенко", image: UIImage(named: "Andor")!, description: "Диего Луна и Стеллан Скарсгард засветились на съёмках второго сезона «Андора»", likes: Int.random(in: 300...500), views: Int.random(in: 700...1999)))
        section.append(Posts(author: "Дина Касимова", image: UIImage(named: "PaulWalker")!, description: "Режиссёр «Форсажа 10» рассказал о возвращении Пола Уокера", likes: Int.random(in: 300...500), views: Int.random(in: 700...1999)))
        
//        for _ in 0...5 {
//            post.append(section)
//        }
        return post
    }
}


/* Ссылки на новости:
 https://kg-portal.ru/comments/112082-tom-holland-vernetsja-k-roli-chelovekapauka-v-mcu/
 https://kg-portal.ru/comments/112090-zarazitelnye-disneevskie-primery-kak-priruchit-drakona-stanet-polnometrazhnym-filmom/
 https://kg-portal.ru/comments/112079-diego-luna-i-stellan-skarsgard-zasvetilis-na-semkah-vtorogo-sezona-andora-foto/
 https://kg-portal.ru/comments/112067-rezhisser-forsazha-10-rasskazal-o-vozvraschenii-geroja-pola-uokera/
 */
