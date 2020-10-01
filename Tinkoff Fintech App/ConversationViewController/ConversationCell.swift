//
//  ConversationCell.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 01.10.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!

}

extension ConversationCell: ConfigurableView {
    typealias ConfigurationModel = Int
    
    func configure(with model: Int) {
        
    }
}

struct MessageCellMode {
    let text: String
    let isIncoming: Bool
}
