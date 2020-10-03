//
//  ChatOfflineCell.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 03.10.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ChatOfflineCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
}

extension ChatOfflineCell: ConfigurableView {
    typealias ConfigurationModel = Int
    
    func configure(with model: Int) {
        return
    }
    
}
