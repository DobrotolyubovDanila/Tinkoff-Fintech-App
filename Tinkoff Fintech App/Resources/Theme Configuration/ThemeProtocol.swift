//
//  ThemeProtocol.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 07.10.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

protocol ThemeProtocol: AnyObject {
    var style: InterfaceStyle { get }
    var backgroundColor: UIColor { get }
    var secondBackgroundColor: UIColor { get }
    var tintColor: UIColor { get }
    var mainTextColor: UIColor { get }
    var secondaryTextColor: UIColor { get }
    var incomeMessagesBackgroundColor: UIColor { get }
    var sendedMessagesBackgroundColor: UIColor { get }
    var incomeMessagesTextColor: UIColor { get }
    var sendedMessagesTextColor: UIColor { get }
    
}
