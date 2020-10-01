//
//  ProfileAvatarView.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 01.10.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ProfileAvatarView: UIView {

    
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    
    func setCornerRadius(cornerRadius: CGFloat) {
        profileLabel.layer.cornerRadius = cornerRadius
        profileImageView.layer.cornerRadius = cornerRadius
        profileImageButton.layer.cornerRadius = cornerRadius
        self.layer.cornerRadius = cornerRadius
    }
}
