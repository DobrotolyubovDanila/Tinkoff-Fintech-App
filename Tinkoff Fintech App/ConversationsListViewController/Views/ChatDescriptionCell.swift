//
//  ChatDecsriptionCell.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 30.09.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ChatDescriptionCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!

}

extension ChatDescriptionCell: ConfigurableView {
    typealias ConfigurationModel = Int
    
    func configure(with model: Int) {
        return
    }
    
}


struct ConversationCellModel {
    let name:String
    let message: String?
    let date: Date
    let isOnline: Bool
    let hasUnreadMessage: Bool
}
