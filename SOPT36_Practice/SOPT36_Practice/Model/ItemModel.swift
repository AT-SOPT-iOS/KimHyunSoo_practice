//
//  ItemModel.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 4/26/25.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .coffee, name: "퉁퉁퉁사후르", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .coffee, name: "퉁퉁퉁사후르", price: "5000", heartIsSelected: false)
        ]
    }
}

