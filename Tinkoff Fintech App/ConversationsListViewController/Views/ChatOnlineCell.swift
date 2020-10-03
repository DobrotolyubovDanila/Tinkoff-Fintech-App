//
//  ChatDecsriptionCell.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 30.09.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ChatOnlineCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!

    @IBOutlet weak var onlineIndicator: UIView!
    
    func configOnlineIndicator() {
        onlineIndicator.layer.cornerRadius = onlineIndicator.layer.frame.height/2
        
        let shapeLayer = CAShapeLayer()
        
        let path = UIBezierPath(arcCenter: CGPoint(x: onlineIndicator.bounds.midX,
                                                   y: onlineIndicator.bounds.midY),
                                radius: onlineIndicator.frame.height/2 - 3,
                                startAngle: 0,
                                endAngle: CGFloat.pi*2,
                                clockwise: true)
        
        shapeLayer.fillColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        shapeLayer.path = path.cgPath
        
        onlineIndicator.layer.addSublayer(shapeLayer)
    }
    
}

extension ChatOnlineCell: ConfigurableView {
    typealias ConfigurationModel = Int
    
    func configure(with model: Int) {
        return
    }
    
}

