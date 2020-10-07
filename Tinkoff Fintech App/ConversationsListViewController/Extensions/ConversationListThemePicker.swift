//
//  ConversationListExtencion.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 08.10.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

extension ConversationsListViewController: ThemesPickerDelegate {
    func updateInterfaceWithTheme() {
        
        updateInterfaceWithoutReloadData()
        tableView.reloadData()
    }
    
    func updateInterfaceWithoutReloadData() {
        self.tableView.backgroundColor = ThemeManager.shared.current.backgroundColor
        
        navigationController?.navigationBar.tintColor = ThemeManager.shared.current.tintColor
        navigationController?.navigationBar.barTintColor = ThemeManager.shared.current.backgroundColor
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.shared.current.mainTextColor]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.shared.current.mainTextColor]
    }
}
